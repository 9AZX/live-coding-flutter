import 'dart:developer' as developer;

import 'package:matchs_data/src/dtos/events_response_dto.br.dart';
import 'package:matchs_data/src/dtos/lineup_entry_dto.br.dart';
import 'package:matchs_data/src/dtos/lineup_response_dto.br.dart';
import 'package:matchs_data/src/dtos/timeline_entry_dto.br.dart';
import 'package:matchs_data/src/dtos/timeline_response_dto.br.dart';
import 'package:matchs_data/src/mappers/event_dto_mapper.dart';
import 'package:matchs_data/src/mappers/lineup_entry_dto_mapper.dart';
import 'package:matchs_data/src/mappers/timeline_entry_dto_mapper.dart';
import 'package:matchs_data/src/package_name.dart';
import 'package:network_domain/network_domain.dart';
import 'package:scores_domain/scores_domain.dart';
import 'package:types_result_domain/types_result_domain.dart';

/// Source de données réelle TheSportsDB. Implémente directement le contrat du
/// domaine : une seule source, donc pas de classe repository intermédiaire.
///
/// Le catalogue de ligues est injecté : la source ne décide pas du marché.
final class TheSportsDbScoresDataSource implements ScoresRepository {
  final DateTime Function() _clock;
  final HttpClient _client;
  final Map<String, String> _countryByLeague;
  final List<String> _leagueIds;

  const TheSportsDbScoresDataSource({
    required DateTime Function() clock,
    required HttpClient client,
    required Map<String, String> countryByLeague,
    required List<String> leagueIds,
  }) : _clock = clock,
       _client = client,
       _countryByLeague = countryByLeague,
       _leagueIds = leagueIds;

  static const String _eventsDayPath = '/eventsday.php';
  static const String _lineupPath = '/lookuplineup.php';
  static const String _lookupEventPath = '/lookupevent.php';
  static const String _timelinePath = '/lookuptimeline.php';

  @override
  Future<Result<Match, ScoresError>> fetchMatch(String id) async {
    try {
      // Les trois appels sont indépendants : lancés ensemble, le détail s'ouvre en un
      // aller-retour plutôt qu'en trois.
      final [eventResponse, timelineResponse, lineupResponse] = await Future.wait([
        _client.get<Map<String, dynamic>>(_lookupEventPath, queryParameters: {'id': id}),
        _client.get<Map<String, dynamic>>(_timelinePath, queryParameters: {'id': id}),
        _client.get<Map<String, dynamic>>(_lineupPath, queryParameters: {'id': id}),
      ]);

      if (eventResponse.data case final data?) {
        final event = EventsResponseDto.fromJson(data).events?.firstOrNull;

        if (event == null) return const Failure(ScoresError.notFound());

        final match = event.toEntity(country: _countryByLeague[event.leagueId ?? ''] ?? '');
        final entries = _timelineEntries(timelineResponse);

        return Success(
          match.copyWith(
            events: [for (final entry in entries) ?entry.toEntity()]..sort(_byMinute),
            lineups: lineupsFrom(
              away: match.away,
              awayFormation: event.awayFormation ?? '',
              entries: _lineupEntries(lineupResponse),
              home: match.home,
              homeFormation: event.homeFormation ?? '',
            ),
          ),
        );
      }

      return const Failure(ScoresError.unavailable());
    } catch (exception, stackTrace) {
      if (exception is! NetworkError) {
        developer.log(
          'Échec inattendu du détail du match $id',
          name: packageName,
          error: exception,
          stackTrace: stackTrace,
        );
      }

      return const Failure(ScoresError.unavailable());
    }
  }

  @override
  Future<Result<List<Match>, ScoresError>> fetchMatches(MatchDay day) async {
    final date = _dateFor(day);

    // Un appel par ligue, lancés en parallèle : `Future.wait` restitue les résultats
    // dans l'ordre de `_leagueIds`, donc l'ordre des cartes de compétition reste stable.
    final perLeague = await Future.wait(_leagueIds.map((leagueId) => _leagueMatches(date, leagueId)));

    // Une ligue en échec (réseau, quota de la clé de test) ne doit pas vider le feed ;
    // toutes en échec, si — sinon l'écran affiche « aucun match » pour une panne.
    if (perLeague.isNotEmpty && perLeague.every((result) => result.isError())) {
      return const Failure(ScoresError.unavailable());
    }

    return Success(perLeague.expand((result) => result.getOrDefault(const [])).toList());
  }

  Future<Result<List<Match>, ScoresError>> _leagueMatches(String date, String leagueId) async {
    try {
      final response = await _client.get<Map<String, dynamic>>(
        _eventsDayPath,
        queryParameters: {'d': date, 'l': leagueId},
      );

      if (response.data case final data?) {
        final events = EventsResponseDto.fromJson(data).events ?? const [];
        final country = _countryByLeague[leagueId] ?? '';

        return Success([for (final event in events) event.toEntity(country: country)]..sort(_byKickoff));
      }

      return const Failure(ScoresError.unavailable());
    } catch (exception, stackTrace) {
      // Un NetworkError est déjà journalisé par la couche réseau ; le reste (JSON
      // inattendu, bug de mapping) est un défaut à voir passer dans les logs.
      if (exception is! NetworkError) {
        developer.log(
          'Échec inattendu du feed de la ligue $leagueId',
          name: packageName,
          error: exception,
          stackTrace: stackTrace,
        );
      }

      return const Failure(ScoresError.unavailable());
    }
  }

  String _dateFor(MatchDay day) {
    final date = _clock().add(Duration(days: day.offset));

    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}

List<TimelineEntryDto> _timelineEntries(NetworkResponse<Map<String, dynamic>> response) => switch (response.data) {
  final data? => TimelineResponseDto.fromJson(data).timeline ?? const [],
  _ => const [],
};

List<LineupEntryDto> _lineupEntries(NetworkResponse<Map<String, dynamic>> response) => switch (response.data) {
  final data? => LineupResponseDto.fromJson(data).lineup ?? const [],
  _ => const [],
};

int _byKickoff(Match a, Match b) => a.kickoff.compareTo(b.kickoff);

int _byMinute(MatchEvent a, MatchEvent b) => a.minute.compareTo(b.minute);
