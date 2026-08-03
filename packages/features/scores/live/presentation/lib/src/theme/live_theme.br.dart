import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'live_theme.br.tailor.dart';

@TailorMixinComponent()
class LiveTheme extends ThemeExtension<LiveTheme> with _$LiveThemeTailorMixin {
  @override
  final Color backgroundColor;

  const LiveTheme({required this.backgroundColor});
}
