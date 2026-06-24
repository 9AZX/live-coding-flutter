import 'package:scores_data/src/api/the_sports_db_config.dart';
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
    Map<String, dynamic> e, {
    List<MatchEvent> events = const [],
    List<Lineup> lineups = const [],
  }) {
    final leagueId = _int(e['idLeague']);

    return Match(
      id: '${e['idEvent']}',
      competition: Competition(
        id: '$leagueId',
        name: _str(e['strLeague']),
        country: TheSportsDbConfig.countryByLeague[leagueId] ?? '',
        colorValue: _colorFor(leagueId),
      ),
      home: _team(e['idHomeTeam'], e['strHomeTeam']),
      away: _team(e['idAwayTeam'], e['strAwayTeam']),
      homeScore: _int(e['intHomeScore']),
      awayScore: _int(e['intAwayScore']),
      status: _status(_str(e['strStatus']), _str(e['strProgress'])),
      kickoff: _time(e['strTimestamp'], e['strTime']),
      minute: int.tryParse(_str(e['strProgress'])),
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
