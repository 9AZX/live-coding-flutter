import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scores_data/scores_data.dart';
import 'package:scores_router/scores_router.dart';
import 'package:theme_manager/theme_manager.dart';

/// Racine de composition : agrège tous les overrides à passer au `ProviderScope`
/// (data + thèmes + routing). Point d'assemblage unique de l'app.
List<Override> scoresAppOverrides() => [
  ...bindScoresDataProviders(),
  ...bindThemeProviders(),
  ...bindRouterProviders(),
];
