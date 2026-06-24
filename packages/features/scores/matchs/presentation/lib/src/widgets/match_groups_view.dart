import 'package:flutter/material.dart';
import 'package:matchs_presentation/src/theme/scores_theme.dart';
import 'package:matchs_presentation/src/widgets/competition_header.dart';
import 'package:matchs_presentation/src/widgets/match_row.dart';
import 'package:scores_domain/scores_domain.dart';

/// Feed scrollable des matchs groupés par compétition (Matchs + En direct).
/// `leading` permet d'insérer les chips de filtre en tête (page Matchs).
class MatchGroupsView extends StatelessWidget {
  const MatchGroupsView({required this.groups, this.leading, super.key});

  final List<MatchGroup> groups;
  final Widget? leading;

  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.only(bottom: 18),
    children: [
      if (leading case final leading?) leading,
      for (final group in groups) _CompetitionCard(group: group),
    ],
  );
}

class _CompetitionCard extends StatelessWidget {
  const _CompetitionCard({required this.group});

  final MatchGroup group;

  @override
  Widget build(BuildContext context) {
    final theme = context.scoresTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CompetitionHeader(competition: group.competition),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: theme.palette.white,
            borderRadius: BorderRadius.circular(theme.palette.rXl),
            boxShadow: theme.palette.shadowCard,
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              for (var i = 0; i < group.matches.length; i++)
                MatchRow(match: group.matches[i], showDivider: i != group.matches.length - 1),
            ],
          ),
        ),
      ],
    );
  }
}
