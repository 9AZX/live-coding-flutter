import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'odds_theme.br.tailor.dart';

@TailorMixinComponent()
class OddsTheme extends ThemeExtension<OddsTheme> with _$OddsThemeTailorMixin {
  @override
  final Color backgroundColor;

  @override
  final Color favouriteBackgroundColor;

  @override
  final TextStyle favouriteQuoteTextStyle;

  @override
  final TextStyle labelTextStyle;

  @override
  final TextStyle quoteTextStyle;

  const OddsTheme({
    required this.backgroundColor,
    required this.favouriteBackgroundColor,
    required this.favouriteQuoteTextStyle,
    required this.labelTextStyle,
    required this.quoteTextStyle,
  });
}
