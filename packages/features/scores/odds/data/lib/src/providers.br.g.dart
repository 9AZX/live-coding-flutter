// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(oddsRepository)
final oddsRepositoryProvider = OddsRepositoryProvider._();

final class OddsRepositoryProvider
    extends $FunctionalProvider<OddsRepository, OddsRepository, OddsRepository>
    with $Provider<OddsRepository> {
  OddsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'oddsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$oddsRepositoryHash();

  @$internal
  @override
  $ProviderElement<OddsRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  OddsRepository create(Ref ref) {
    return oddsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OddsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OddsRepository>(value),
    );
  }
}

String _$oddsRepositoryHash() => r'18c22113df0b88b7a9afe4ffb46aa0a0e93e1349';
