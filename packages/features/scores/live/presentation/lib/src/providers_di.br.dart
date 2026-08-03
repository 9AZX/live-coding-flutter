import 'package:exceptions/exceptions.dart';
import 'package:flutter/widgets.dart';
import 'package:live_presentation/src/providers_internal.br.dart';
import 'package:live_presentation/src/theme/live_theme.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scores_domain/scores_domain.dart';
import 'package:widget_factory_presentation/widget_factory_presentation.dart';

part 'providers_di.br.g.dart';

/// Widgets injectés par la composition (fournis par la feature Matchs) : En direct
/// ne dépend ainsi d'aucune autre feature. Les arguments sont des types de
/// `scores_domain` ou des records structurels, jamais des types d'une autre feature.
@riverpod
WidgetFactory<({IconData icon, String subtitle, String title})> liveEmptyStateFactory(Ref _) {
  throw UnregisteredProviderException(liveEmptyStateFactoryProvider);
}

@riverpod
WidgetFactory<List<MatchGroup>> liveFeedFactory(Ref _) {
  throw UnregisteredProviderException(liveFeedFactoryProvider);
}

@riverpod
WidgetFactory<String> liveHeaderFactory(Ref _) {
  throw UnregisteredProviderException(liveHeaderFactoryProvider);
}

@riverpod
LiveTheme liveTheme(Ref ref) => ref.watch(defaultLiveThemeProvider);
