import 'dart:developer' as developer;

import 'package:matchs_data/src/api/the_sports_db_client.dart';
import 'package:matchs_data/src/api/the_sports_db_config.dart';
import 'package:matchs_data/src/dtos/event_dto.br.dart';
import 'package:matchs_data/src/mappers/event_dto_mapper.dart';
import 'package:matchs_data/src/package_name.dart';
import 'package:scores_domain/scores_domain.dart';

/// Source de données réelle TheSportsDB. Implémente directement le contrat du
/// domaine : une seule source, donc pas de classe repository intermédiaire.
///
/// WORKSHOP : `watchMatch(id)` (détail) à reconstruire — récupérer l'event, sa
/// timeline et ses compositions, puis mapper vers un `Match` enrichi.
final class TheSportsDbScoresDataSource implements ScoresRepository {
  final TheSportsDbClient _client;

  TheSportsDbScoresDataSource({required TheSportsDbClient client}) : _client = client;

  @override
  Stream<List<Match>> watchMatches(MatchDay day) => Stream.fromFuture(_fetchFeed(day));

  Future<List<Match>> _fetchFeed(MatchDay day) async {
    final date = _dateFor(day);

    // Un appel par ligue, lancés en parallèle : `Future.wait` restitue les résultats
    // dans l'ordre de `leagueIds`, donc l'ordre des cartes de compétition reste stable.
    final perLeague = await Future.wait(
      TheSportsDbConfig.leagueIds.map((leagueId) => _fetchLeague(date, leagueId)),
    );

    final matches = perLeague.expand((leagueMatches) => leagueMatches).toList();

    developer.log('feed: ${matches.length} matchs du $date', name: packageName);

    return matches;
  }

  /// Une ligue qui échoue (réseau, quota de la clé de test) ne doit pas vider tout
  /// le feed : on la journalise et on rend les autres.
  Future<List<Match>> _fetchLeague(String date, int leagueId) async {
    try {
      final events = (await _client.eventsDay(date, leagueId)).map(EventDto.fromJson).toList()
        ..sort((a, b) => '${a.timestamp}'.compareTo('${b.timestamp}'));

      return events.map((event) => event.toEntity()).toList();
    } on Exception catch (e, s) {
      developer.log('ligue $leagueId ignorée pour le $date', name: packageName, error: e, stackTrace: s);

      return const [];
    }
  }

  // ponytail: date via l'horloge appareil (en prod : source NTP type Kronos).
  String _dateFor(MatchDay day) {
    final date = DateTime.now().add(Duration(days: day.offset));

    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}
