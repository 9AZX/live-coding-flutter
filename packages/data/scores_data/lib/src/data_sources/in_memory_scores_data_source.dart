import 'package:scores_domain/scores_domain.dart';

/// Source de données factice : reproduit le jeu de données du design « Scores
/// Betclic » (matchs, évènements, compositions) et fait avancer les minutes des
/// matchs live toutes les 5 secondes.
class InMemoryScoresDataSource implements ScoresRepository {
  static const _tick = Duration(seconds: 5);

  static const _competitions = <String, Competition>{
    'l1': Competition(id: 'l1', name: 'Ligue 1', country: 'France', colorValue: 0xFF091C3E),
    'pl': Competition(id: 'pl', name: 'Premier League', country: 'Angleterre', colorValue: 0xFF3D195B),
    'ucl': Competition(id: 'ucl', name: 'Ligue des Champions', country: 'Europe', colorValue: 0xFF0A1A4F),
  };

  static const _teams = <String, Team>{
    'psg': Team(id: 'psg', name: 'Paris SG', shortName: 'PSG', colorValue: 0xFF06234E),
    'om': Team(id: 'om', name: 'Marseille', shortName: 'OM', colorValue: 0xFF2AAEE0),
    'ol': Team(id: 'ol', name: 'Lyon', shortName: 'OL', colorValue: 0xFF16467F),
    'asm': Team(id: 'asm', name: 'Monaco', shortName: 'ASM', colorValue: 0xFFE2231A),
    'nic': Team(id: 'nic', name: 'Nice', shortName: 'NIC', colorValue: 0xFF111827),
    'ren': Team(id: 'ren', name: 'Rennes', shortName: 'REN', colorValue: 0xFFB0142B),
    'len': Team(id: 'len', name: 'Lens', shortName: 'RCL', colorValue: 0xFFC8102E),
    'lil': Team(id: 'lil', name: 'Lille', shortName: 'LIL', colorValue: 0xFF122E63),
    'ars': Team(id: 'ars', name: 'Arsenal', shortName: 'ARS', colorValue: 0xFFC8102E),
    'che': Team(id: 'che', name: 'Chelsea', shortName: 'CHE', colorValue: 0xFF1A47B8),
    'liv': Team(id: 'liv', name: 'Liverpool', shortName: 'LIV', colorValue: 0xFFC8102E),
    'mci': Team(id: 'mci', name: 'Man City', shortName: 'MCI', colorValue: 0xFF5CA8D8),
    'tot': Team(id: 'tot', name: 'Tottenham', shortName: 'TOT', colorValue: 0xFF132257),
    'mun': Team(id: 'mun', name: 'Man United', shortName: 'MUN', colorValue: 0xFFDA291C),
    'rma': Team(id: 'rma', name: 'Real Madrid', shortName: 'RMA', colorValue: 0xFF00529F),
    'bay': Team(id: 'bay', name: 'Bayern', shortName: 'BAY', colorValue: 0xFFDC052D),
    'int': Team(id: 'int', name: 'Inter', shortName: 'INT', colorValue: 0xFF0A0A6E),
    'bar': Team(id: 'bar', name: 'Barcelone', shortName: 'BAR', colorValue: 0xFFA50044),
  };

  static final _squads = <String, ({String formation, List<(int, String)> players})>{
    'psg': (
      formation: '4-3-3',
      players: [
        (1, 'Donnarumma'),
        (2, 'Hakimi'),
        (5, 'Marquinhos'),
        (51, 'Pacho'),
        (25, 'Mendes'),
        (87, 'Neves'),
        (17, 'Vitinha'),
        (8, 'F. Ruiz'),
        (10, 'Dembélé'),
        (7, 'Barcola'),
        (9, 'G. Ramos'),
      ],
    ),
    'om': (
      formation: '4-3-3',
      players: [
        (30, 'Rulli'),
        (15, 'Murillo'),
        (5, 'Balerdi'),
        (12, 'Brassier'),
        (3, 'Merlin'),
        (8, 'Rongier'),
        (6, 'Højbjerg'),
        (11, 'Greenwood'),
        (7, 'Harit'),
        (10, 'Aubameyang'),
        (27, 'L. Henrique'),
      ],
    ),
    'len': (
      formation: '3-4-3',
      players: [
        (16, 'Samba'),
        (24, 'Gradit'),
        (4, 'Danso'),
        (5, 'Medina'),
        (11, 'Frankowski'),
        (18, 'Mendy'),
        (6, 'Abdul Samed'),
        (21, 'Machado'),
        (7, 'Sotoca'),
        (9, 'Wahi'),
        (22, 'Saïd'),
      ],
    ),
    'lil': (
      formation: '4-4-2',
      players: [
        (30, 'Chevalier'),
        (21, 'Meunier'),
        (3, 'Diakité'),
        (15, 'Alexsandro'),
        (20, 'Ismaily'),
        (10, 'Cabella'),
        (8, 'André'),
        (32, 'Bouaddi'),
        (17, 'Á. Gomes'),
        (9, 'J. David'),
        (7, 'Zhegrova'),
      ],
    ),
    'ars': (
      formation: '4-3-3',
      players: [
        (22, 'Raya'),
        (4, 'White'),
        (2, 'Saliba'),
        (6, 'Gabriel'),
        (33, 'Calafiori'),
        (41, 'Rice'),
        (5, 'Partey'),
        (8, 'Ødegaard'),
        (7, 'Saka'),
        (29, 'Havertz'),
        (11, 'Martinelli'),
      ],
    ),
    'che': (
      formation: '4-2-3-1',
      players: [
        (1, 'R. Sánchez'),
        (27, 'Gusto'),
        (29, 'Fofana'),
        (6, 'Colwill'),
        (3, 'Cucurella'),
        (25, 'Caicedo'),
        (8, 'Fernández'),
        (10, 'Palmer'),
        (18, 'Nkunku'),
        (7, 'Neto'),
        (15, 'Jackson'),
      ],
    ),
  };

  static final _seed = <_MatchSeed>[
    const _MatchSeed('m1', 'l1', 'psg', 'om', 2, 1, MatchStatus.live, '20:45', 67, [
      _Ev(12, MatchEventType.goal, true, 'Hakimi', 'Passe déc. Dembélé'),
      _Ev(28, MatchEventType.yellowCard, false, 'Rongier', null),
      _Ev(41, MatchEventType.goal, false, 'Aubameyang', 'Passe déc. Greenwood'),
      _Ev(55, MatchEventType.goal, true, 'G. Ramos', 'Penalty'),
      _Ev(63, MatchEventType.redCard, false, 'Balerdi', 'Deuxième avertissement'),
    ]),
    const _MatchSeed('m2', 'l1', 'ol', 'asm', 1, 1, MatchStatus.live, '21:00', 23, [
      _Ev(9, MatchEventType.goal, true, 'Lacazette', null),
      _Ev(15, MatchEventType.goal, false, 'Ben Yedder', 'Penalty'),
    ]),
    const _MatchSeed('m3', 'l1', 'len', 'lil', 1, 1, MatchStatus.finished, '17:00', null, [
      _Ev(22, MatchEventType.goal, true, 'Wahi', 'Passe déc. Sotoca'),
      _Ev(70, MatchEventType.yellowCard, true, 'Frankowski', null),
      _Ev(84, MatchEventType.goal, false, 'J. David', 'Passe déc. Cabella'),
    ]),
    const _MatchSeed('m4', 'l1', 'nic', 'ren', 0, 0, MatchStatus.upcoming, '21:00', null, []),
    const _MatchSeed('m5', 'pl', 'ars', 'che', 0, 0, MatchStatus.live, '18:30', 78, [
      _Ev(35, MatchEventType.yellowCard, true, 'Rice', null),
      _Ev(60, MatchEventType.yellowCard, false, 'Caicedo', null),
    ]),
    const _MatchSeed('m6', 'pl', 'liv', 'mci', 0, 0, MatchStatus.upcoming, '18:30', null, []),
    const _MatchSeed('m7', 'pl', 'tot', 'mun', 2, 3, MatchStatus.finished, '15:00', null, [
      _Ev(18, MatchEventType.goal, true, 'Son', null),
      _Ev(33, MatchEventType.goal, false, 'B. Fernandes', 'Penalty'),
      _Ev(49, MatchEventType.goal, false, 'Højlund', null),
      _Ev(67, MatchEventType.goal, true, 'Maddison', null),
      _Ev(88, MatchEventType.goal, false, 'Garnacho', null),
    ]),
    const _MatchSeed('m8', 'ucl', 'rma', 'bay', 0, 0, MatchStatus.upcoming, '21:00', null, []),
    const _MatchSeed('m9', 'ucl', 'int', 'bar', 1, 2, MatchStatus.finished, '21:00', null, [
      _Ev(24, MatchEventType.goal, false, 'Lewandowski', null),
      _Ev(52, MatchEventType.goal, true, 'Lautaro', 'Passe déc. Thuram'),
      _Ev(79, MatchEventType.goal, false, 'L. Yamal', null),
    ]),
  ];

  @override
  Stream<List<Match>> watchMatches() async* {
    final minutes = <String, int>{
      for (final s in _seed)
        if (s.status == MatchStatus.live && s.minute != null) s.id: s.minute!,
    };

    yield _build(minutes);

    yield* Stream.periodic(_tick, (_) {
      for (final id in minutes.keys) {
        if (minutes[id]! < 90) minutes[id] = minutes[id]! + 1;
      }

      return _build(minutes);
    });
  }

  @override
  Stream<Match?> watchMatch(String id) => watchMatches().map((matches) => matches.where((m) => m.id == id).firstOrNull);

  List<Match> _build(Map<String, int> minutes) => [for (final s in _seed) _toMatch(s, minutes[s.id])];

  Match _toMatch(_MatchSeed s, int? minute) {
    final home = _teams[s.home]!;
    final away = _teams[s.away]!;
    final lineups = [_lineup(home), _lineup(away)].whereType<Lineup>().toList();

    return Match(
      id: s.id,
      competition: _competitions[s.comp]!,
      home: home,
      away: away,
      homeScore: s.homeScore,
      awayScore: s.awayScore,
      status: s.status,
      kickoff: s.kickoff,
      minute: minute,
      events: [
        for (final e in s.events)
          MatchEvent(minute: e.minute, type: e.type, isHome: e.isHome, player: e.player, detail: e.detail),
      ],
      lineups: lineups.length == 2 ? lineups : const [],
    );
  }

  Lineup? _lineup(Team team) {
    final squad = _squads[team.id];
    if (squad == null) return null;

    return Lineup(
      team: team,
      formation: squad.formation,
      players: [for (final p in squad.players) Player(number: p.$1, name: p.$2)],
    );
  }
}

class _MatchSeed {
  const _MatchSeed(
    this.id,
    this.comp,
    this.home,
    this.away,
    this.homeScore,
    this.awayScore,
    this.status,
    this.kickoff,
    this.minute,
    this.events,
  );

  final String id;
  final String comp;
  final String home;
  final String away;
  final int homeScore;
  final int awayScore;
  final MatchStatus status;
  final String kickoff;
  final int? minute;
  final List<_Ev> events;
}

class _Ev {
  // ignore: avoid_positional_boolean_parameters
  const _Ev(this.minute, this.type, this.isHome, this.player, this.detail);

  final int minute;
  final MatchEventType type;
  final bool isHome;
  final String player;
  final String? detail;
}
