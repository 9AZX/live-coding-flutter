// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_di.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dummyDIFavoritesData)
final dummyDIFavoritesDataProvider = DummyDIFavoritesDataProvider._();

final class DummyDIFavoritesDataProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  DummyDIFavoritesDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dummyDIFavoritesDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dummyDIFavoritesDataHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return dummyDIFavoritesData(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$dummyDIFavoritesDataHash() =>
    r'a9bcdc4ded488d9430518615ac563397c6d6b1da';
