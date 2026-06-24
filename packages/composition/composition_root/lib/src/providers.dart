import 'package:favorites_data/favorites_data.dart';
import 'package:favorites_presentation/favorites_presentation.dart';
import 'package:live_presentation/live_presentation.dart';
import 'package:matchs_data/matchs_data.dart';
import 'package:matchs_presentation/matchs_presentation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scores_shell/scores_shell.dart';

/// Racine de composition : agrège tous les overrides du `ProviderScope`.
/// - data : impl des repos (matchs/data, favorites/data)
/// - onglets : injection des pages dans le shell
/// - widgets partagés : les `WidgetFactory` de Matchs injectées dans Live/Favoris
///
/// Le thème est auto-fourni par la feature Matchs (pas de theme_manager).
List<Override> scoresAppOverrides() => [
  ...bindScoresRepository(),
  ...bindFavoritesRepository(),
  ..._shellTabs(),
  ..._liveWidgets(),
  ..._favoritesWidgets(),
];

List<Override> _shellTabs() => [
  matchsTabProvider.overrideWithValue(const MatchsPageWidgetFactory()),
  directTabProvider.overrideWithValue(const LivePageWidgetFactory()),
  favoritesTabProvider.overrideWithValue(const FavoritesPageWidgetFactory()),
];

List<Override> _liveWidgets() => [
  liveHeaderFactoryProvider.overrideWithValue(const ScoresHeaderWidgetFactory()),
  liveFeedFactoryProvider.overrideWithValue(const MatchGroupsViewWidgetFactory()),
  liveEmptyStateFactoryProvider.overrideWithValue(const EmptyStateWidgetFactory()),
];

List<Override> _favoritesWidgets() => [
  favoritesHeaderFactoryProvider.overrideWithValue(const ScoresHeaderWidgetFactory()),
  favoritesListFactoryProvider.overrideWithValue(const FavoritesListWidgetFactory()),
  favoritesEmptyStateFactoryProvider.overrideWithValue(const EmptyStateWidgetFactory()),
];
