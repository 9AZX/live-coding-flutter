import 'package:flutter/painting.dart';
import 'package:matchs_presentation/src/theme/scores_theme.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tactics_theme/tactics_theme.dart';

part 'providers_internal.g.dart';

/// Le thème est fourni par la feature elle-même, construit depuis la palette DSM.
/// L'app peut l'overrider (ex. dark mode, A/B) sans theme_manager dédié.
@riverpod
ScoresTheme scoresTheme(Ref ref) {
  final palette = ref.watch(tacticsPaletteProvider);

  return ScoresTheme(palette: palette, divider: const Color(0xFFF1F2F4));
}
