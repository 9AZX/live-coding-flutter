import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scores_domain/scores_domain.dart';
import 'package:widget_factory_presentation/widget_factory_presentation.dart';

part 'providers_di.g.dart';

/// Widgets injectés par la composition (fournis par la feature Matchs).
@riverpod
WidgetFactory<String> favoritesHeaderFactory(Ref ref) =>
    throw UnimplementedError('favoritesHeaderFactoryProvider must be overridden');

@riverpod
WidgetFactory<List<Match>> favoritesListFactory(Ref ref) =>
    throw UnimplementedError('favoritesListFactoryProvider must be overridden');

@riverpod
WidgetFactory<({IconData icon, String title, String subtitle})> favoritesEmptyStateFactory(Ref ref) =>
    throw UnimplementedError('favoritesEmptyStateFactoryProvider must be overridden');
