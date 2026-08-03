// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_internal.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(oddsDataSource)
final oddsDataSourceProvider = OddsDataSourceProvider._();

final class OddsDataSourceProvider
    extends
        $FunctionalProvider<
          StaticOddsDataSource,
          StaticOddsDataSource,
          StaticOddsDataSource
        >
    with $Provider<StaticOddsDataSource> {
  OddsDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'oddsDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$oddsDataSourceHash();

  @$internal
  @override
  $ProviderElement<StaticOddsDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  StaticOddsDataSource create(Ref ref) {
    return oddsDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StaticOddsDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StaticOddsDataSource>(value),
    );
  }
}

String _$oddsDataSourceHash() => r'4f59400cc4f282858c01316697e452cbdac91647';
