// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_di.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dummyDIMatchsData)
final dummyDIMatchsDataProvider = DummyDIMatchsDataProvider._();

final class DummyDIMatchsDataProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  DummyDIMatchsDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dummyDIMatchsDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dummyDIMatchsDataHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return dummyDIMatchsData(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$dummyDIMatchsDataHash() => r'297f193b127449214c0e35c39381f721439ef50d';
