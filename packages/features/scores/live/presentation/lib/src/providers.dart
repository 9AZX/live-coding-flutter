import 'package:flutter/widgets.dart';
import 'package:live_presentation/src/providers_di.br.dart';
import 'package:live_presentation/src/theme/live_theme.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scores_domain/scores_domain.dart';
import 'package:widget_factory_presentation/widget_factory_presentation.dart';

// Les fabriques de widgets sont requises — leurs contrats throw jusqu'à ce que la
// composition les fournisse. Le thème est optionnel (défaut interne à la feature).
List<Override> bindProviders({
  required WidgetFactory<({IconData icon, String subtitle, String title})> emptyStateFactory,
  required WidgetFactory<List<MatchGroup>> feedFactory,
  required WidgetFactory<String> headerFactory,
  ProviderListenable<LiveTheme>? theme,
}) => [
  liveEmptyStateFactoryProvider.overrideWithValue(emptyStateFactory),
  liveFeedFactoryProvider.overrideWithValue(feedFactory),
  liveHeaderFactoryProvider.overrideWithValue(headerFactory),
  if (theme != null) liveThemeProvider.overrideWith((ref) => ref.watch(theme)),
];
