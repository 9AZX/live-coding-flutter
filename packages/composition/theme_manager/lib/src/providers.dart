import 'package:flutter/painting.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scores_widgets/scores_widgets.dart';
import 'package:tactics_theme/tactics_theme.dart';

/// Construit le thème par défaut des features depuis la palette DSM et override
/// le `scoresThemeProvider` (équivalent du theme_manager de flutter-front).
List<Override> bindThemeProviders() => [
  scoresThemeProvider.overrideWith(
    (ref) => ScoresTheme(
      palette: ref.watch(tacticsPaletteProvider),
      divider: const Color(0xFFF1F2F4),
    ),
  ),
];
