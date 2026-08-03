import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matchs_presentation/src/providers_di.br.dart';
import 'package:scores_domain/scores_domain.dart';
import 'package:tactics_components/tactics_components.dart';

/// Titre d'un groupe de matchs : pastille de la compétition + nom + pays.
class CompetitionHeader extends ConsumerWidget {
  final Competition competition;

  const CompetitionHeader({required this.competition, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(matchsThemeProvider);

    return Padding(
      padding: const EdgeInsets.fromLTRB(TacticsSpacing.spacing400, 18, TacticsSpacing.spacing400, 9),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Color(competition.colorValue),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          const SizedBox(width: 9),
          Text(competition.name, style: theme.competitionNameTextStyle),
          const SizedBox(width: TacticsSpacing.spacing200),
          Text(competition.country, style: theme.competitionCountryTextStyle),
        ],
      ),
    );
  }
}
