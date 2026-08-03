import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scores_domain/src/entities/competition.br.dart';
import 'package:scores_domain/src/entities/lineup.br.dart';
import 'package:scores_domain/src/entities/match_event.br.dart';
import 'package:scores_domain/src/entities/match_filter.dart';
import 'package:scores_domain/src/entities/team.br.dart';

part 'match.br.freezed.dart';

enum MatchStatus { finished, live, upcoming }

/// Une rencontre. `minute` n'a de sens que pour un match `live`.
/// `events` / `lineups` alimentent la page de détail (vides si indisponibles).
@freezed
abstract class Match with _$Match {
  const factory Match({
    required Team away,
    required int awayScore,
    required Competition competition,
    required Team home,
    required int homeScore,
    required String id,

    /// Heure de coup d'envoi, déjà formatée (ex: « 20:45 »).
    required String kickoff,

    required MatchStatus status,
    @Default([]) List<MatchEvent> events,
    @Default([]) List<Lineup> lineups,
    int? minute,
  }) = _Match;

  const Match._();

  bool get hasLineups => lineups.length >= 2;

  bool get hasScore => isFinished || isLive;

  bool get isFinished => status == MatchStatus.finished;

  bool get isLive => status == MatchStatus.live;

  bool get isUpcoming => status == MatchStatus.upcoming;

  /// Vrai si la rencontre doit apparaître sous [filter].
  bool matches(MatchFilter filter) => switch (filter) {
    MatchFilter.all => true,
    MatchFilter.finished => isFinished,
    MatchFilter.live => isLive,
    MatchFilter.upcoming => isUpcoming,
  };
}
