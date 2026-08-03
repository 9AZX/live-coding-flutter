import 'package:matchs_data/src/api/the_sports_db_config.dart';
import 'package:matchs_data/src/dtos/event_dto.br.dart';
import 'package:scores_domain/scores_domain.dart';

const _palette = [
  0xFF06234E,
  0xFFE2231A,
  0xFF2AAEE0,
  0xFF122E63,
  0xFF3D195B,
  0xFF018C54,
  0xFF111827,
  0xFFB0142B,
  0xFF00529F,
  0xFF7B61FF,
];

/// Traduit le JSON TheSportsDB en entités du domaine. Tolérant : les champs
/// arrivent en `String` ou `null` selon le statut du match.
extension EventDtoMapper on EventDto {
  Match toEntity({List<MatchEvent> events = const [], List<Lineup> lineups = const []}) {
    final leagueId = _int(this.leagueId);

    return Match(
      away: _team(awayTeamId, awayTeam),
      awayScore: _int(awayScore),
      competition: Competition(
        colorValue: _colorFor(leagueId),
        country: TheSportsDbConfig.countryByLeague[leagueId] ?? '',
        id: '$leagueId',
        name: _string(league),
      ),
      events: events,
      home: _team(homeTeamId, homeTeam),
      homeScore: _int(homeScore),
      id: _string(id),
      kickoff: _time(timestamp, time),
      lineups: lineups,
      minute: int.tryParse(_string(progress)),
      status: _status(_string(status), _string(progress)),
    );
  }

  // WORKSHOP : `toEvents(timeline)` et `toLineups(lineup, …)` à reconstruire pour
  // alimenter l'écran détail (timeline buts/cartons + compositions).
}

Team _team(Object? id, Object? name) {
  final label = _string(name).isEmpty ? '?' : _string(name);

  return Team(colorValue: _colorFor(_int(id)), id: '$id', name: label, shortName: _shortName(label));
}

MatchStatus _status(String status, String progress) {
  final normalized = status.toLowerCase();

  if (normalized.contains('finished') || ['ft', 'aet', 'ap', 'pen', 'awarded'].contains(normalized)) {
    return MatchStatus.finished;
  }

  if (['1h', '2h', 'ht', 'et', 'bt', 'p', 'live'].contains(normalized) || progress.isNotEmpty) {
    return MatchStatus.live;
  }

  return MatchStatus.upcoming;
}

String _shortName(String name) {
  final words = name.split(' ').where((word) => word.isNotEmpty).toList();

  if (words.length >= 2) {
    return words.take(3).map((word) => word[0]).join().toUpperCase();
  }

  return name.length <= 3 ? name.toUpperCase() : name.substring(0, 3).toUpperCase();
}

int _colorFor(int id) => _palette[id.abs() % _palette.length];

String _time(Object? timestamp, Object? time) {
  final parsed = DateTime.tryParse(_string(timestamp))?.toLocal();

  if (parsed != null) {
    return '${parsed.hour.toString().padLeft(2, '0')}:${parsed.minute.toString().padLeft(2, '0')}';
  }

  final fallback = _string(time);

  return fallback.length >= 5 ? fallback.substring(0, 5) : fallback;
}

String _string(Object? value) => value?.toString() ?? '';

int _int(Object? value) => value is int ? value : int.tryParse(_string(value)) ?? 0;
