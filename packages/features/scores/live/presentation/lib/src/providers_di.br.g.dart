// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_di.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Widgets injectés par la composition (fournis par la feature Matchs) : En direct
/// ne dépend ainsi d'aucune autre feature. Les arguments sont des types de
/// `scores_domain` ou des records structurels, jamais des types d'une autre feature.

@ProviderFor(liveEmptyStateFactory)
final liveEmptyStateFactoryProvider = LiveEmptyStateFactoryProvider._();

/// Widgets injectés par la composition (fournis par la feature Matchs) : En direct
/// ne dépend ainsi d'aucune autre feature. Les arguments sont des types de
/// `scores_domain` ou des records structurels, jamais des types d'une autre feature.

final class LiveEmptyStateFactoryProvider
    extends
        $FunctionalProvider<
          WidgetFactory<({IconData icon, String subtitle, String title})>,
          WidgetFactory<({IconData icon, String subtitle, String title})>,
          WidgetFactory<({IconData icon, String subtitle, String title})>
        >
    with
        $Provider<
          WidgetFactory<({IconData icon, String subtitle, String title})>
        > {
  /// Widgets injectés par la composition (fournis par la feature Matchs) : En direct
  /// ne dépend ainsi d'aucune autre feature. Les arguments sont des types de
  /// `scores_domain` ou des records structurels, jamais des types d'une autre feature.
  LiveEmptyStateFactoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'liveEmptyStateFactoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$liveEmptyStateFactoryHash();

  @$internal
  @override
  $ProviderElement<
    WidgetFactory<({IconData icon, String subtitle, String title})>
  >
  $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  WidgetFactory<({IconData icon, String subtitle, String title})> create(
    Ref ref,
  ) {
    return liveEmptyStateFactory(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(
    WidgetFactory<({IconData icon, String subtitle, String title})> value,
  ) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<
            WidgetFactory<({IconData icon, String subtitle, String title})>
          >(value),
    );
  }
}

String _$liveEmptyStateFactoryHash() =>
    r'7debc23242f9996c08d373f19486bd01557fc053';

@ProviderFor(liveFeedFactory)
final liveFeedFactoryProvider = LiveFeedFactoryProvider._();

final class LiveFeedFactoryProvider
    extends
        $FunctionalProvider<
          WidgetFactory<List<MatchGroup>>,
          WidgetFactory<List<MatchGroup>>,
          WidgetFactory<List<MatchGroup>>
        >
    with $Provider<WidgetFactory<List<MatchGroup>>> {
  LiveFeedFactoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'liveFeedFactoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$liveFeedFactoryHash();

  @$internal
  @override
  $ProviderElement<WidgetFactory<List<MatchGroup>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WidgetFactory<List<MatchGroup>> create(Ref ref) {
    return liveFeedFactory(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WidgetFactory<List<MatchGroup>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WidgetFactory<List<MatchGroup>>>(
        value,
      ),
    );
  }
}

String _$liveFeedFactoryHash() => r'5ecabc4bd3f0c6be3fa818347b44541b39b130e1';

@ProviderFor(liveHeaderFactory)
final liveHeaderFactoryProvider = LiveHeaderFactoryProvider._();

final class LiveHeaderFactoryProvider
    extends
        $FunctionalProvider<
          WidgetFactory<String>,
          WidgetFactory<String>,
          WidgetFactory<String>
        >
    with $Provider<WidgetFactory<String>> {
  LiveHeaderFactoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'liveHeaderFactoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$liveHeaderFactoryHash();

  @$internal
  @override
  $ProviderElement<WidgetFactory<String>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WidgetFactory<String> create(Ref ref) {
    return liveHeaderFactory(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WidgetFactory<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WidgetFactory<String>>(value),
    );
  }
}

String _$liveHeaderFactoryHash() => r'8782c28b3ecca10b815eff1a623de32a08388155';

@ProviderFor(liveTheme)
final liveThemeProvider = LiveThemeProvider._();

final class LiveThemeProvider
    extends $FunctionalProvider<LiveTheme, LiveTheme, LiveTheme>
    with $Provider<LiveTheme> {
  LiveThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'liveThemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$liveThemeHash();

  @$internal
  @override
  $ProviderElement<LiveTheme> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LiveTheme create(Ref ref) {
    return liveTheme(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LiveTheme value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LiveTheme>(value),
    );
  }
}

String _$liveThemeHash() => r'b129c2a035c88096ddacdd8ed736dfce4a780c1b';
