// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_di.br.dart';

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

String _$oddsRepositoryHash() => r'b74d1fd311ed9f7acf4fca4d1dcdc303708f62ca';
