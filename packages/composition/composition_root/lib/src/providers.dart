import 'package:favorites_presentation/favorites_presentation.dart';
import 'package:live_presentation/live_presentation.dart';
import 'package:matchs_presentation/matchs_presentation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scores_data/scores_data.dart';
import 'package:scores_shell/scores_shell.dart';

/// Racine de composition : agrège tous les overrides à passer au `ProviderScope`.
/// Le thème est auto-fourni par la feature (plus de theme_manager) ; ici on
/// branche la data et les widget factories des onglets du shell.
List<Override> scoresAppOverrides() => [
  ...bindScoresDataProviders(),
  ..._bindShellTabProviders(),
];

/// Injecte chaque page-feature dans le shell via sa `WidgetFactory` — le shell
/// ne dépend ainsi d'aucune feature.
List<Override> _bindShellTabProviders() => [
  matchsTabProvider.overrideWithValue(const MatchsPageWidgetFactory()),
  directTabProvider.overrideWithValue(const LivePageWidgetFactory()),
  favoritesTabProvider.overrideWithValue(const FavoritesPageWidgetFactory()),
];
