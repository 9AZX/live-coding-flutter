// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_di.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Onglets injectés par la composition : le shell rend ces widgets sans dépendre
/// des features qui les fournissent.

@ProviderFor(matchsTab)
final matchsTabProvider = MatchsTabProvider._();

/// Onglets injectés par la composition : le shell rend ces widgets sans dépendre
/// des features qui les fournissent.

final class MatchsTabProvider extends $FunctionalProvider<WidgetFactory<void>, WidgetFactory<void>, WidgetFactory<void>>
    with $Provider<WidgetFactory<void>> {
  /// Onglets injectés par la composition : le shell rend ces widgets sans dépendre
  /// des features qui les fournissent.
  MatchsTabProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'matchsTabProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$matchsTabHash();

  @$internal
  @override
  $ProviderElement<WidgetFactory<void>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WidgetFactory<void> create(Ref ref) {
    return matchsTab(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WidgetFactory<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WidgetFactory<void>>(value),
    );
  }
}

String _$matchsTabHash() => r'01df2fa7d29c9b30de1efb94c21664889578f3e8';

@ProviderFor(directTab)
final directTabProvider = DirectTabProvider._();

final class DirectTabProvider extends $FunctionalProvider<WidgetFactory<void>, WidgetFactory<void>, WidgetFactory<void>>
    with $Provider<WidgetFactory<void>> {
  DirectTabProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'directTabProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$directTabHash();

  @$internal
  @override
  $ProviderElement<WidgetFactory<void>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WidgetFactory<void> create(Ref ref) {
    return directTab(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WidgetFactory<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WidgetFactory<void>>(value),
    );
  }
}

String _$directTabHash() => r'047bdb6efdfbd178a750de67233fc1892527e0e6';

@ProviderFor(favoritesTab)
final favoritesTabProvider = FavoritesTabProvider._();

final class FavoritesTabProvider
    extends $FunctionalProvider<WidgetFactory<void>, WidgetFactory<void>, WidgetFactory<void>>
    with $Provider<WidgetFactory<void>> {
  FavoritesTabProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoritesTabProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoritesTabHash();

  @$internal
  @override
  $ProviderElement<WidgetFactory<void>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WidgetFactory<void> create(Ref ref) {
    return favoritesTab(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WidgetFactory<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WidgetFactory<void>>(value),
    );
  }
}

String _$favoritesTabHash() => r'ad63370822179beb40cdd8cb1b90c66883652692';
