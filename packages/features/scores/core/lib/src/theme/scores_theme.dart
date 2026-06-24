import 'package:flutter/material.dart';
import 'package:tactics_theme/tactics_theme.dart';

/// Thème partagé des écrans Scores. Compose la palette Betclic (DSM) ; les
/// widgets lisent leurs tokens ici, jamais une couleur brute.
///
/// En production ce `ThemeExtension` serait généré par `theme_tailor` ; écrit à
/// la main ici pour rester sans codegen côté thème. L'instance par défaut est
/// fournie par la composition (`theme_manager`).
@immutable
class ScoresTheme extends ThemeExtension<ScoresTheme> {
  const ScoresTheme({required this.palette, required this.divider});

  final TacticsPalette palette;
  final Color divider;

  @override
  ScoresTheme copyWith({TacticsPalette? palette, Color? divider}) =>
      ScoresTheme(palette: palette ?? this.palette, divider: divider ?? this.divider);

  @override
  ScoresTheme lerp(ThemeExtension<ScoresTheme>? other, double t) {
    if (other is! ScoresTheme) return this;

    return ScoresTheme(
      palette: t < 0.5 ? palette : other.palette,
      divider: Color.lerp(divider, other.divider, t) ?? divider,
    );
  }
}

extension ScoresThemeX on BuildContext {
  ScoresTheme get scoresTheme => Theme.of(this).extension<ScoresTheme>()!;
}
