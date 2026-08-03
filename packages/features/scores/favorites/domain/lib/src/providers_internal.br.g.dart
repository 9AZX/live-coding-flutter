// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_internal.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dummyInternalFavoritesDomain)
final dummyInternalFavoritesDomainProvider =
    DummyInternalFavoritesDomainProvider._();

final class DummyInternalFavoritesDomainProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  DummyInternalFavoritesDomainProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dummyInternalFavoritesDomainProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dummyInternalFavoritesDomainHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return dummyInternalFavoritesDomain(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$dummyInternalFavoritesDomainHash() =>
    r'2a26c5c124b0d742cd8a22c3b4858b9fe6a4bb80';
