import 'package:scores_domain/src/entities/competition.dart';
import 'package:scores_domain/src/entities/lineup.dart';
import 'package:scores_domain/src/entities/match_event.dart';
import 'package:scores_domain/src/entities/team.dart';

enum MatchStatus { live, upcoming, finished }

/// Une rencontre. `minute` n'a de sens que pour un match `live`.
/// `events` / `lineups` alimentent la page de détail (vides si indisponibles).
class Match {
  const Match({
    required this.id,
    required this.competition,
    required this.home,
    required this.away,
    required this.homeScore,
    required this.awayScore,
    required this.status,
    required this.kickoff,
    this.minute,
    this.events = const [],
    this.lineups = const [],
  });

  final String id;
  final Competition competition;
  final Team home;
  final Team away;
  final int homeScore;
  final int awayScore;
  final MatchStatus status;

  /// Heure de coup d'envoi, déjà formatée (ex: « 20:45 »).
  final String kickoff;
  final int? minute;
  final List<MatchEvent> events;
  final List<Lineup> lineups;

  bool get isLive => status == MatchStatus.live;
  bool get isUpcoming => status == MatchStatus.upcoming;
  bool get isFinished => status == MatchStatus.finished;
  bool get hasScore => isLive || isFinished;
  bool get hasLineups => lineups.length >= 2;
}
