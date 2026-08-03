// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_internal.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dummyInternalScoresDomain)
final dummyInternalScoresDomainProvider = DummyInternalScoresDomainProvider._();

final class DummyInternalScoresDomainProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  DummyInternalScoresDomainProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dummyInternalScoresDomainProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dummyInternalScoresDomainHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return dummyInternalScoresDomain(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$dummyInternalScoresDomainHash() =>
    r'3e4f455ce73e6b6f2d189d0ef47e56ac3d741777';
