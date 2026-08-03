import 'package:exceptions/exceptions.dart';
import 'package:favorites_presentation/src/providers_internal.br.dart';
import 'package:favorites_presentation/src/theme/favorites_theme.br.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scores_domain/scores_domain.dart';
import 'package:widget_factory_presentation/widget_factory_presentation.dart';

part 'providers_di.br.g.dart';

/// Widgets injectés par la composition (fournis par la feature Matchs) : Favoris
/// ne dépend ainsi d'aucune autre feature.
@riverpod
WidgetFactory<({IconData icon, String subtitle, String title})> favoritesEmptyStateFactory(Ref _) {
  throw UnregisteredProviderException(favoritesEmptyStateFactoryProvider);
}

@riverpod
WidgetFactory<String> favoritesHeaderFactory(Ref _) {
  throw UnregisteredProviderException(favoritesHeaderFactoryProvider);
}

@riverpod
WidgetFactory<List<Match>> favoritesListFactory(Ref _) {
  throw UnregisteredProviderException(favoritesListFactoryProvider);
}

@riverpod
FavoritesTheme favoritesTheme(Ref ref) => ref.watch(defaultFavoritesThemeProvider);
