import 'package:scores_domain/src/entities/match.br.dart';
import 'package:scores_domain/src/entities/match_filter.dart';
import 'package:scores_domain/src/entities/match_group.br.dart';

/// Filtre puis regroupe les matchs par compétition, dans l'ordre d'apparition.
/// Partagé par les features Matchs et En direct.
class GroupMatches {
  const GroupMatches();

  List<MatchGroup> call(List<Match> matches, MatchFilter filter) {
    final byCompetition = <String, List<Match>>{};

    for (final match in matches.where((match) => match.matches(filter))) {
      byCompetition.putIfAbsent(match.competition.id, () => []).add(match);
    }

    return [
      for (final grouped in byCompetition.values) MatchGroup(competition: grouped.first.competition, matches: grouped),
    ];
  }
}
