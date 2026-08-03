// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_internal.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(favoritesDataSource)
final favoritesDataSourceProvider = FavoritesDataSourceProvider._();

final class FavoritesDataSourceProvider
    extends
        $FunctionalProvider<
          InMemoryFavoritesDataSource,
          InMemoryFavoritesDataSource,
          InMemoryFavoritesDataSource
        >
    with $Provider<InMemoryFavoritesDataSource> {
  FavoritesDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoritesDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoritesDataSourceHash();

  @$internal
  @override
  $ProviderElement<InMemoryFavoritesDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  InMemoryFavoritesDataSource create(Ref ref) {
    return favoritesDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InMemoryFavoritesDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InMemoryFavoritesDataSource>(value),
    );
  }
}

String _$favoritesDataSourceHash() =>
    r'ae921847abf5e4a899c7a718e4bc548e1ddd4f2f';
