import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'favorites_theme.br.tailor.dart';

@TailorMixinComponent()
class FavoritesTheme extends ThemeExtension<FavoritesTheme> with _$FavoritesThemeTailorMixin {
  @override
  final Color backgroundColor;

  const FavoritesTheme({required this.backgroundColor});
}
