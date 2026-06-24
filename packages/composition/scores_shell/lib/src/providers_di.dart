import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:widget_factory_presentation/widget_factory_presentation.dart';

part 'providers_di.g.dart';

/// Onglets injectés par la composition : le shell rend ces widgets sans dépendre
/// des features qui les fournissent.
@riverpod
WidgetFactory<void> matchsTab(Ref ref) => throw UnimplementedError('matchsTabProvider must be overridden');

@riverpod
WidgetFactory<void> directTab(Ref ref) => throw UnimplementedError('directTabProvider must be overridden');

@riverpod
WidgetFactory<void> favoritesTab(Ref ref) => throw UnimplementedError('favoritesTabProvider must be overridden');
