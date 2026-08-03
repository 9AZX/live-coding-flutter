// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_di.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dummyDIFavoritesDomain)
final dummyDIFavoritesDomainProvider = DummyDIFavoritesDomainProvider._();

final class DummyDIFavoritesDomainProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  DummyDIFavoritesDomainProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dummyDIFavoritesDomainProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dummyDIFavoritesDomainHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return dummyDIFavoritesDomain(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$dummyDIFavoritesDomainHash() =>
    r'e5c8771ed6c0ecfdf20c4b5ac2f0dce53e7aa0cb';
