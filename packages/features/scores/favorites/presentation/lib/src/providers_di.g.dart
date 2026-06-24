// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_di.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Widgets injectés par la composition (fournis par la feature Matchs).

@ProviderFor(favoritesHeaderFactory)
final favoritesHeaderFactoryProvider = FavoritesHeaderFactoryProvider._();

/// Widgets injectés par la composition (fournis par la feature Matchs).

final class FavoritesHeaderFactoryProvider
    extends $FunctionalProvider<WidgetFactory<String>, WidgetFactory<String>, WidgetFactory<String>>
    with $Provider<WidgetFactory<String>> {
  /// Widgets injectés par la composition (fournis par la feature Matchs).
  FavoritesHeaderFactoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoritesHeaderFactoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoritesHeaderFactoryHash();

  @$internal
  @override
  $ProviderElement<WidgetFactory<String>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WidgetFactory<String> create(Ref ref) {
    return favoritesHeaderFactory(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WidgetFactory<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WidgetFactory<String>>(value),
    );
  }
}

String _$favoritesHeaderFactoryHash() => r'073a1ffd044d776137f14cf96a1113677b20cc16';

@ProviderFor(favoritesListFactory)
final favoritesListFactoryProvider = FavoritesListFactoryProvider._();

final class FavoritesListFactoryProvider
    extends $FunctionalProvider<WidgetFactory<List<Match>>, WidgetFactory<List<Match>>, WidgetFactory<List<Match>>>
    with $Provider<WidgetFactory<List<Match>>> {
  FavoritesListFactoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoritesListFactoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoritesListFactoryHash();

  @$internal
  @override
  $ProviderElement<WidgetFactory<List<Match>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WidgetFactory<List<Match>> create(Ref ref) {
    return favoritesListFactory(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WidgetFactory<List<Match>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WidgetFactory<List<Match>>>(value),
    );
  }
}

String _$favoritesListFactoryHash() => r'3d1ec91e7c624052bdcb84d29b5d7451f5e3720a';

@ProviderFor(favoritesEmptyStateFactory)
final favoritesEmptyStateFactoryProvider = FavoritesEmptyStateFactoryProvider._();

final class FavoritesEmptyStateFactoryProvider
    extends
        $FunctionalProvider<
          WidgetFactory<({IconData icon, String subtitle, String title})>,
          WidgetFactory<({IconData icon, String subtitle, String title})>,
          WidgetFactory<({IconData icon, String subtitle, String title})>
        >
    with $Provider<WidgetFactory<({IconData icon, String subtitle, String title})>> {
  FavoritesEmptyStateFactoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoritesEmptyStateFactoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoritesEmptyStateFactoryHash();

  @$internal
  @override
  $ProviderElement<WidgetFactory<({IconData icon, String subtitle, String title})>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WidgetFactory<({IconData icon, String subtitle, String title})> create(
    Ref ref,
  ) {
    return favoritesEmptyStateFactory(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(
    WidgetFactory<({IconData icon, String subtitle, String title})> value,
  ) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WidgetFactory<({IconData icon, String subtitle, String title})>>(value),
    );
  }
}

String _$favoritesEmptyStateFactoryHash() => r'5a4abc66bbd03ab78a219047aad080729e45282f';
