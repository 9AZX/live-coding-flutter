// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_internal.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Source de temps injectée : les tests figent la date, la source ne connaît pas
/// l'horloge de l'appareil (en prod : utilitaire NTP type Kronos).

@ProviderFor(clock)
final clockProvider = ClockProvider._();

/// Source de temps injectée : les tests figent la date, la source ne connaît pas
/// l'horloge de l'appareil (en prod : utilitaire NTP type Kronos).

final class ClockProvider
    extends
        $FunctionalProvider<
          DateTime Function(),
          DateTime Function(),
          DateTime Function()
        >
    with $Provider<DateTime Function()> {
  /// Source de temps injectée : les tests figent la date, la source ne connaît pas
  /// l'horloge de l'appareil (en prod : utilitaire NTP type Kronos).
  ClockProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'clockProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$clockHash();

  @$internal
  @override
  $ProviderElement<DateTime Function()> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DateTime Function() create(Ref ref) {
    return clock(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DateTime Function() value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DateTime Function()>(value),
    );
  }
}

String _$clockHash() => r'b868babc61229c5562fda84453cd2c5e28c49452';

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

String _$scoresDataSourceHash() => r'498a06b2adf3656bec147dca4e9955064e372290';
