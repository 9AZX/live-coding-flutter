// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_di.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Widgets injectés par la composition (fournis par la feature Matchs) — Live
/// ne dépend ainsi d'aucune autre feature.

@ProviderFor(liveHeaderFactory)
final liveHeaderFactoryProvider = LiveHeaderFactoryProvider._();

/// Widgets injectés par la composition (fournis par la feature Matchs) — Live
/// ne dépend ainsi d'aucune autre feature.

final class LiveHeaderFactoryProvider
    extends $FunctionalProvider<WidgetFactory<String>, WidgetFactory<String>, WidgetFactory<String>>
    with $Provider<WidgetFactory<String>> {
  /// Widgets injectés par la composition (fournis par la feature Matchs) — Live
  /// ne dépend ainsi d'aucune autre feature.
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

String _$liveHeaderFactoryHash() => r'9b3e52d7d73287beedfaa3981f76c956892c71bd';

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

String _$liveFeedFactoryHash() => r'192f7574cb6323c70112e0b25dc325603fca1758';

@ProviderFor(liveEmptyStateFactory)
final liveEmptyStateFactoryProvider = LiveEmptyStateFactoryProvider._();

final class LiveEmptyStateFactoryProvider
    extends
        $FunctionalProvider<
          WidgetFactory<({IconData icon, String subtitle, String title})>,
          WidgetFactory<({IconData icon, String subtitle, String title})>,
          WidgetFactory<({IconData icon, String subtitle, String title})>
        >
    with $Provider<WidgetFactory<({IconData icon, String subtitle, String title})>> {
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
  $ProviderElement<WidgetFactory<({IconData icon, String subtitle, String title})>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

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
      providerOverride: $SyncValueProvider<WidgetFactory<({IconData icon, String subtitle, String title})>>(value),
    );
  }
}

String _$liveEmptyStateFactoryHash() => r'4d6eb8c818666dbfa774f330cf69d00a04d3e10b';
