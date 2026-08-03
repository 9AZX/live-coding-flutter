// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_di.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(favoritesRepository)
final favoritesRepositoryProvider = FavoritesRepositoryProvider._();

final class FavoritesRepositoryProvider
    extends
        $FunctionalProvider<
          FavoritesRepository,
          FavoritesRepository,
          FavoritesRepository
        >
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

String _$favoritesRepositoryHash() =>
    r'8e1423d582303442b334e81f5a8aea4d1c264e84';

@ProviderFor(scoresRepository)
final scoresRepositoryProvider = ScoresRepositoryProvider._();

final class ScoresRepositoryProvider
    extends
        $FunctionalProvider<
          ScoresRepository,
          ScoresRepository,
          ScoresRepository
        >
    with $Provider<ScoresRepository> {
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
  $ProviderElement<ScoresRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

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

String _$scoresRepositoryHash() => r'15a66710299983510de05fd66a1cd80d9851c607';
