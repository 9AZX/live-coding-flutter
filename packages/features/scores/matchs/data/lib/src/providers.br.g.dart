// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

String _$scoresRepositoryHash() => r'07b66ad4a64aaaa2fc8ac5e8e7f931b9c2ba8dce';
