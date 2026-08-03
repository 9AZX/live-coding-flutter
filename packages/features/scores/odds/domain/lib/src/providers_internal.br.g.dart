// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_internal.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dummyInternalOddsDomain)
final dummyInternalOddsDomainProvider = DummyInternalOddsDomainProvider._();

final class DummyInternalOddsDomainProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  DummyInternalOddsDomainProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dummyInternalOddsDomainProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dummyInternalOddsDomainHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return dummyInternalOddsDomain(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$dummyInternalOddsDomainHash() =>
    r'998be1cbbb5cbd2d3bcdd389d75e456bb5e58c1a';
