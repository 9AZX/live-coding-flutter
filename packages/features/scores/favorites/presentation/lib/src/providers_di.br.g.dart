// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_di.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Widgets injectés par la composition (fournis par la feature Matchs) : Favoris
/// ne dépend ainsi d'aucune autre feature.

@ProviderFor(favoritesEmptyStateFactory)
final favoritesEmptyStateFactoryProvider =
    FavoritesEmptyStateFactoryProvider._();

/// Widgets injectés par la composition (fournis par la feature Matchs) : Favoris
/// ne dépend ainsi d'aucune autre feature.

final class FavoritesEmptyStateFactoryProvider
    extends
        $FunctionalProvider<
          WidgetFactory<({IconData icon, String subtitle, String title})>,
          WidgetFactory<({IconData icon, String subtitle, String title})>,
          WidgetFactory<({IconData icon, String subtitle, String title})>
        >
    with
        $Provider<
          WidgetFactory<({IconData icon, String subtitle, String title})>
        > {
  /// Widgets injectés par la composition (fournis par la feature Matchs) : Favoris
  /// ne dépend ainsi d'aucune autre feature.
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
  $ProviderElement<
    WidgetFactory<({IconData icon, String subtitle, String title})>
  >
  $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

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
      providerOverride:
          $SyncValueProvider<
            WidgetFactory<({IconData icon, String subtitle, String title})>
          >(value),
    );
  }
}

String _$favoritesEmptyStateFactoryHash() =>
    r'5c4b0b5347e02f0db7082a34aa5b727a4f449a30';

@ProviderFor(favoritesHeaderFactory)
final favoritesHeaderFactoryProvider = FavoritesHeaderFactoryProvider._();

final class FavoritesHeaderFactoryProvider
    extends
        $FunctionalProvider<
          WidgetFactory<String>,
          WidgetFactory<String>,
          WidgetFactory<String>
        >
    with $Provider<WidgetFactory<String>> {
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

String _$favoritesHeaderFactoryHash() =>
    r'5b275f4b18c220bac8a9e77658428378602e9ed4';

@ProviderFor(favoritesListFactory)
final favoritesListFactoryProvider = FavoritesListFactoryProvider._();

final class FavoritesListFactoryProvider
    extends
        $FunctionalProvider<
          WidgetFactory<List<Match>>,
          WidgetFactory<List<Match>>,
          WidgetFactory<List<Match>>
        >
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

String _$favoritesListFactoryHash() =>
    r'461208a77242304ac1c595eec1c2263508b544d7';

@ProviderFor(favoritesTheme)
final favoritesThemeProvider = FavoritesThemeProvider._();

final class FavoritesThemeProvider
    extends $FunctionalProvider<FavoritesTheme, FavoritesTheme, FavoritesTheme>
    with $Provider<FavoritesTheme> {
  FavoritesThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoritesThemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoritesThemeHash();

  @$internal
  @override
  $ProviderElement<FavoritesTheme> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FavoritesTheme create(Ref ref) {
    return favoritesTheme(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FavoritesTheme value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FavoritesTheme>(value),
    );
  }
}

String _$favoritesThemeHash() => r'28d33d32dbc2ba5ff58130776fd746975b9bfcb7';
