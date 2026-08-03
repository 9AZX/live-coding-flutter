// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_internal.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(defaultFavoritesTheme)
final defaultFavoritesThemeProvider = DefaultFavoritesThemeProvider._();

final class DefaultFavoritesThemeProvider
    extends $FunctionalProvider<FavoritesTheme, FavoritesTheme, FavoritesTheme>
    with $Provider<FavoritesTheme> {
  DefaultFavoritesThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'defaultFavoritesThemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$defaultFavoritesThemeHash();

  @$internal
  @override
  $ProviderElement<FavoritesTheme> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FavoritesTheme create(Ref ref) {
    return defaultFavoritesTheme(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FavoritesTheme value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FavoritesTheme>(value),
    );
  }
}

String _$defaultFavoritesThemeHash() =>
    r'0a16d932193f868f4a90f7adc8c7f8af0f8eeb7d';
