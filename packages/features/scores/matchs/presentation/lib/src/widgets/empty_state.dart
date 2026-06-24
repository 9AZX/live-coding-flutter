import 'package:flutter/material.dart';
import 'package:matchs_presentation/src/theme/scores_theme.dart';

/// État vide centré : icône estompée + titre + sous-titre.
class EmptyState extends StatelessWidget {
  const EmptyState({required this.icon, required this.title, required this.subtitle, super.key});

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = context.scoresTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(36),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 44, color: theme.palette.n200),
            const SizedBox(height: 14),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: theme.palette.fontBrand,
                fontWeight: FontWeight.w800,
                fontSize: 18,
                color: theme.palette.night,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, height: 1.5, color: theme.palette.n300),
            ),
          ],
        ),
      ),
    );
  }
}
