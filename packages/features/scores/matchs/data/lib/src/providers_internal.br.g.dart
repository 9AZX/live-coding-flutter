// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_internal.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(theSportsDbClient)
final theSportsDbClientProvider = TheSportsDbClientProvider._();

final class TheSportsDbClientProvider
    extends
        $FunctionalProvider<
          TheSportsDbClient,
          TheSportsDbClient,
          TheSportsDbClient
        >
    with $Provider<TheSportsDbClient> {
  TheSportsDbClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'theSportsDbClientProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$theSportsDbClientHash();

  @$internal
  @override
  $ProviderElement<TheSportsDbClient> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TheSportsDbClient create(Ref ref) {
    return theSportsDbClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TheSportsDbClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TheSportsDbClient>(value),
    );
  }
}

String _$theSportsDbClientHash() => r'cf895ec0e23fd8f3202a6e1a3157c5901bef29c6';

@ProviderFor(scoresDataSource)
final scoresDataSourceProvider = ScoresDataSourceProvider._();

final class ScoresDataSourceProvider
    extends
        $FunctionalProvider<
          TheSportsDbScoresDataSource,
          TheSportsDbScoresDataSource,
          TheSportsDbScoresDataSource
        >
    with $Provider<TheSportsDbScoresDataSource> {
  ScoresDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scoresDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scoresDataSourceHash();

  @$internal
  @override
  $ProviderElement<TheSportsDbScoresDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TheSportsDbScoresDataSource create(Ref ref) {
    return scoresDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TheSportsDbScoresDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TheSportsDbScoresDataSource>(value),
    );
  }
}

String _$scoresDataSourceHash() => r'b3d78352becc7db365790e89ccb2394e70b12379';
