import 'package:scores_domain/src/entities/match.dart';
import 'package:scores_domain/src/entities/match_filter.dart';
import 'package:scores_domain/src/entities/match_group.dart';

/// Filtre puis regroupe les matchs par compétition, dans l'ordre d'apparition.
/// Partagé par les features Matchs et En direct.
class GroupMatches {
  const GroupMatches();

  List<MatchGroup> call(List<Match> matches, MatchFilter filter) {
    final kept = matches.where((m) => _matchesFilter(m, filter));

    final byCompetition = <String, List<Match>>{};
    final order = <String>[];

    for (final match in kept) {
      final id = match.competition.id;

      if (!byCompetition.containsKey(id)) {
        byCompetition[id] = [];
        order.add(id);
      }

      byCompetition[id]!.add(match);
    }

    return [
      for (final id in order)
        MatchGroup(competition: byCompetition[id]!.first.competition, matches: byCompetition[id]!),
    ];
  }

  bool _matchesFilter(Match m, MatchFilter filter) => switch (filter) {
    MatchFilter.all => true,
    MatchFilter.live => m.isLive,
    MatchFilter.upcoming => m.isUpcoming,
    MatchFilter.finished => m.isFinished,
  };
}
