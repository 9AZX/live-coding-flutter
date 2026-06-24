// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_di.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Dépendances entrantes : la couche data les override (composition).

@ProviderFor(scoresRepository)
final scoresRepositoryProvider = ScoresRepositoryProvider._();

/// Dépendances entrantes : la couche data les override (composition).

final class ScoresRepositoryProvider extends $FunctionalProvider<ScoresRepository, ScoresRepository, ScoresRepository>
    with $Provider<ScoresRepository> {
  /// Dépendances entrantes : la couche data les override (composition).
  ScoresRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scoresRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scoresRepositoryHash();

  @$internal
  @override
  $ProviderElement<ScoresRepository> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  ScoresRepository create(Ref ref) {
    return scoresRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ScoresRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ScoresRepository>(value),
    );
  }
}

String _$scoresRepositoryHash() => r'663ac6c8485e3e6553bde566140960d40d529573';

@ProviderFor(favoritesRepository)
final favoritesRepositoryProvider = FavoritesRepositoryProvider._();

final class FavoritesRepositoryProvider
    extends $FunctionalProvider<FavoritesRepository, FavoritesRepository, FavoritesRepository>
    with $Provider<FavoritesRepository> {
  FavoritesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoritesRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoritesRepositoryHash();

  @$internal
  @override
  $ProviderElement<FavoritesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FavoritesRepository create(Ref ref) {
    return favoritesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FavoritesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FavoritesRepository>(value),
    );
  }
}

String _$favoritesRepositoryHash() => r'5206b82bb947605acbd25abc9b49cb77c5ee2326';
