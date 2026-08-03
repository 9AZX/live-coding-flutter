import 'package:favorites_presentation/src/providers_di.br.dart';
import 'package:favorites_presentation/src/theme/favorites_theme.br.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scores_domain/scores_domain.dart';
import 'package:widget_factory_presentation/widget_factory_presentation.dart';

// Les fabriques de widgets sont requises — leurs contrats throw jusqu'à ce que la
// composition les fournisse. Le thème est optionnel (défaut interne à la feature).
List<Override> bindProviders({
  required WidgetFactory<({IconData icon, String subtitle, String title})> emptyStateFactory,
  required WidgetFactory<String> headerFactory,
  required WidgetFactory<List<Match>> listFactory,
  ProviderListenable<FavoritesTheme>? theme,
}) => [
  favoritesEmptyStateFactoryProvider.overrideWithValue(emptyStateFactory),
  favoritesHeaderFactoryProvider.overrideWithValue(headerFactory),
  favoritesListFactoryProvider.overrideWithValue(listFactory),
  if (theme != null) favoritesThemeProvider.overrideWith((ref) => ref.watch(theme)),
];
