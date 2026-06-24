import 'package:flutter/material.dart';
import 'package:matchs_presentation/src/theme/scores_theme.dart';

/// Bandeau rouge commun aux écrans : titre deux tons, avec un `bottom`
/// optionnel (onglets de jour pour Matchs).
class ScoresHeader extends StatelessWidget {
  const ScoresHeader({required this.title, this.bottom, super.key});

  final String title;
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    final theme = context.scoresTheme;

    return ColoredBox(
      color: theme.palette.red,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 6, 16, 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 34,
                child: Row(
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontFamily: theme.palette.fontBrand,
                        fontWeight: FontWeight.w900,
                        fontSize: 26,
                        color: theme.palette.white,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Scores',
                      style: TextStyle(
                        fontFamily: theme.palette.fontBrand,
                        fontWeight: FontWeight.w800,
                        fontSize: 26,
                        color: theme.palette.white55,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
              ),
              if (bottom case final bottom?) ...[const SizedBox(height: 14), bottom],
            ],
          ),
        ),
      ),
    );
  }
}
