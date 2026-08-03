// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_di.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dummyDIOddsData)
final dummyDIOddsDataProvider = DummyDIOddsDataProvider._();

final class DummyDIOddsDataProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  DummyDIOddsDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dummyDIOddsDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dummyDIOddsDataHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return dummyDIOddsData(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$dummyDIOddsDataHash() => r'1a93be7e60c912355af090b4489b7d5cae052c87';
