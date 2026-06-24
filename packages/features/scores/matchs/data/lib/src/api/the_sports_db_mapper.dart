import 'package:matchs_data/src/api/the_sports_db_config.dart';
import 'package:matchs_data/src/dtos/event_dto.br.dart';
import 'package:scores_domain/scores_domain.dart';

/// Traduit le JSON TheSportsDB en entités du domaine. Tolérant : les champs
/// arrivent en `String` ou `null` selon le statut du match.
class TheSportsDbMapper {
  const TheSportsDbMapper();

  static const _palette = [
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

  Match toMatch(
    EventDto e, {
    List<MatchEvent> events = const [],
    List<Lineup> lineups = const [],
  }) {
    final leagueId = _int(e.leagueId);

    return Match(
      id: _str(e.id),
      competition: Competition(
        id: '$leagueId',
        name: _str(e.league),
        country: TheSportsDbConfig.countryByLeague[leagueId] ?? '',
        colorValue: _colorFor(leagueId),
      ),
      home: _team(e.homeTeamId, e.homeTeam),
      away: _team(e.awayTeamId, e.awayTeam),
      homeScore: _int(e.homeScore),
      awayScore: _int(e.awayScore),
      status: _status(_str(e.status), _str(e.progress)),
      kickoff: _time(e.timestamp, e.time),
      minute: int.tryParse(_str(e.progress)),
      events: events,
      lineups: lineups,
    );
  }

  // WORKSHOP : `toEvents(timeline)` et `toLineups(lineup, …)` à reconstruire pour
  // alimenter la page détail (timeline buts/cartons + compositions).

  Team _team(Object? id, Object? name) {
    final label = _str(name).isEmpty ? '?' : _str(name);

    return Team(
      id: '$id',
      name: label,
      shortName: _shortName(label),
      colorValue: _colorFor(_int(id)),
    );
  }

  MatchStatus _status(String status, String progress) {
    final s = status.toLowerCase();

    if (s.contains('finished') || ['ft', 'aet', 'ap', 'pen', 'awarded'].contains(s)) {
      return MatchStatus.finished;
    }
    if (['1h', '2h', 'ht', 'et', 'bt', 'p', 'live'].contains(s) || progress.isNotEmpty) {
      return MatchStatus.live;
    }

    return MatchStatus.upcoming;
  }

  String _shortName(String name) {
    final words = name.split(' ').where((w) => w.isNotEmpty).toList();

    if (words.length >= 2) {
      return words.take(3).map((w) => w[0]).join().toUpperCase();
    }

    return name.length <= 3 ? name.toUpperCase() : name.substring(0, 3).toUpperCase();
  }

  int _colorFor(int id) => _palette[id.abs() % _palette.length];

  String _time(Object? timestamp, Object? time) {
    final ts = _str(timestamp);

    if (ts.isNotEmpty) {
      final parsed = DateTime.tryParse(ts)?.toLocal();

      if (parsed != null) {
        return '${parsed.hour.toString().padLeft(2, '0')}:${parsed.minute.toString().padLeft(2, '0')}';
      }
    }

    final t = _str(time);

    return t.length >= 5 ? t.substring(0, 5) : t;
  }

  String _str(Object? value) => value?.toString() ?? '';

  int _int(Object? value) => value is int ? value : int.tryParse(_str(value)) ?? 0;
}
