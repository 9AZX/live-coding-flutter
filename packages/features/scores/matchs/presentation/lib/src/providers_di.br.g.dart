// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_di.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Feature optionnelle, exposée par certains marchés seulement : le contrat throw
/// jusqu'à ce que la composition réponde — une fabrique, ou `null` pour l'absence.
/// Matchs ignore totalement quelle feature s'affiche là.

@ProviderFor(matchOddsFactory)
final matchOddsFactoryProvider = MatchOddsFactoryProvider._();

/// Feature optionnelle, exposée par certains marchés seulement : le contrat throw
/// jusqu'à ce que la composition réponde — une fabrique, ou `null` pour l'absence.
/// Matchs ignore totalement quelle feature s'affiche là.

final class MatchOddsFactoryProvider
    extends
        $FunctionalProvider<
          WidgetFactory<Match>?,
          WidgetFactory<Match>?,
          WidgetFactory<Match>?
        >
    with $Provider<WidgetFactory<Match>?> {
  /// Feature optionnelle, exposée par certains marchés seulement : le contrat throw
  /// jusqu'à ce que la composition réponde — une fabrique, ou `null` pour l'absence.
  /// Matchs ignore totalement quelle feature s'affiche là.
  MatchOddsFactoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'matchOddsFactoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$matchOddsFactoryHash();

  @$internal
  @override
  $ProviderElement<WidgetFactory<Match>?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WidgetFactory<Match>? create(Ref ref) {
    return matchOddsFactory(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WidgetFactory<Match>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WidgetFactory<Match>?>(value),
    );
  }
}

String _$matchOddsFactoryHash() => r'563c0d99d491271c876c1afa13feb14cd91e8de2';

@ProviderFor(matchsRouting)
final matchsRoutingProvider = MatchsRoutingProvider._();

final class MatchsRoutingProvider
    extends $FunctionalProvider<MatchsRouting, MatchsRouting, MatchsRouting>
    with $Provider<MatchsRouting> {
  MatchsRoutingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'matchsRoutingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$matchsRoutingHash();

  @$internal
  @override
  $ProviderElement<MatchsRouting> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MatchsRouting create(Ref ref) {
    return matchsRouting(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MatchsRouting value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MatchsRouting>(value),
    );
  }
}

String _$matchsRoutingHash() => r'be66520d385ecdfb8e188ab173a1278e0446ee19';

@ProviderFor(matchsTheme)
final matchsThemeProvider = MatchsThemeProvider._();

final class MatchsThemeProvider
    extends $FunctionalProvider<MatchsTheme, MatchsTheme, MatchsTheme>
    with $Provider<MatchsTheme> {
  MatchsThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'matchsThemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$matchsThemeHash();

  @$internal
  @override
  $ProviderElement<MatchsTheme> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MatchsTheme create(Ref ref) {
    return matchsTheme(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MatchsTheme value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MatchsTheme>(value),
    );
  }
}

String _$matchsThemeHash() => r'9adc3b1a41d2869006ef61efbf17176a9a31b23b';
