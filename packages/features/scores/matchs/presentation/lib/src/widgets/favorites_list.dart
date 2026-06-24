import 'package:flutter/material.dart';
import 'package:matchs_presentation/src/theme/scores_theme.dart';
import 'package:matchs_presentation/src/widgets/match_row.dart';
import 'package:scores_domain/scores_domain.dart';

/// Liste des matchs favoris (section « Mes matchs » + carte de rangées).
/// Partagée avec la feature Favoris via une `WidgetFactory`.
class FavoritesList extends StatelessWidget {
  const FavoritesList({required this.matches, super.key});

  final List<Match> matches;

  @override
  Widget build(BuildContext context) {
    final theme = context.scoresTheme;

    return ListView(
      padding: const EdgeInsets.only(top: 18, bottom: 18),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 9),
          child: Text(
            'Mes matchs',
            style: TextStyle(
              fontFamily: theme.palette.fontBrand,
              fontWeight: FontWeight.w800,
              fontSize: 14,
              color: theme.palette.night,
            ),
          ),
        ),
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
              for (var i = 0; i < matches.length; i++)
                MatchRow(match: matches[i], showDivider: i != matches.length - 1),
            ],
          ),
        ),
      ],
    );
  }
}
