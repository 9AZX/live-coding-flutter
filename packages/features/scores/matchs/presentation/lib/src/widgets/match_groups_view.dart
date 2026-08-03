import 'package:flutter/material.dart';
import 'package:matchs_presentation/src/widgets/competition_header.dart';
import 'package:matchs_presentation/src/widgets/match_card.dart';
import 'package:scores_domain/scores_domain.dart';

/// Feed scrollable des matchs groupés par compétition (Matchs + En direct).
/// `leading` permet d'insérer les chips de filtre en tête (écran Matchs).
class MatchGroupsView extends StatelessWidget {
  final List<MatchGroup> groups;
  final Widget? leading;

  const MatchGroupsView({required this.groups, this.leading, super.key});

  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.only(bottom: 18),
    children: [
      if (leading case final leading?) leading,
      for (final group in groups) _CompetitionSection(group: group),
    ],
  );
}

class _CompetitionSection extends StatelessWidget {
  final MatchGroup group;

  const _CompetitionSection({required this.group});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      CompetitionHeader(competition: group.competition),
      MatchCard(matches: group.matches),
    ],
  );
}
