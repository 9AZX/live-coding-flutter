import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scores_domain/scores_domain.dart';
import 'package:widget_factory_presentation/widget_factory_presentation.dart';

part 'providers_di.g.dart';

/// Widgets injectés par la composition (fournis par la feature Matchs) — Live
/// ne dépend ainsi d'aucune autre feature.
@riverpod
WidgetFactory<String> liveHeaderFactory(Ref ref) =>
    throw UnimplementedError('liveHeaderFactoryProvider must be overridden');

@riverpod
WidgetFactory<List<MatchGroup>> liveFeedFactory(Ref ref) =>
    throw UnimplementedError('liveFeedFactoryProvider must be overridden');

@riverpod
WidgetFactory<({IconData icon, String title, String subtitle})> liveEmptyStateFactory(Ref ref) =>
    throw UnimplementedError('liveEmptyStateFactoryProvider must be overridden');
