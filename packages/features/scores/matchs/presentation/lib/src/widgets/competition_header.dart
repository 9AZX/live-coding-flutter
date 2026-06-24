import 'package:flutter/material.dart';
import 'package:matchs_presentation/src/theme/scores_theme.dart';
import 'package:scores_domain/scores_domain.dart';

/// Titre d'un groupe de matchs : pastille de la compétition + nom + pays.
class CompetitionHeader extends StatelessWidget {
  const CompetitionHeader({required this.competition, super.key});

  final Competition competition;

  @override
  Widget build(BuildContext context) {
    final theme = context.scoresTheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 9),
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
          Text(
            competition.name,
            style: TextStyle(
              fontFamily: theme.palette.fontBrand,
              fontWeight: FontWeight.w800,
              fontSize: 14,
              color: theme.palette.night,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            competition.country,
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: theme.palette.n300),
          ),
        ],
      ),
    );
  }
}
