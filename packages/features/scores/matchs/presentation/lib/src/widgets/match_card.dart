import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matchs_presentation/src/providers_di.br.dart';
import 'package:matchs_presentation/src/widgets/match_row.dart';
import 'package:scores_domain/scores_domain.dart';
import 'package:tactics_components/tactics_components.dart';

/// Carte blanche contenant une liste de rangées de match, séparées par un filet.
class MatchCard extends ConsumerWidget {
  final List<Match> matches;

  const MatchCard({required this.matches, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(matchsThemeProvider);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: TacticsSpacing.spacing300),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(theme.cardRadius),
        boxShadow: theme.cardShadow,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          for (var index = 0; index < matches.length; index++)
            MatchRow(match: matches[index], showDivider: index != matches.length - 1),
        ],
      ),
    );
  }
}
