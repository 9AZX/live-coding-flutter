// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_di.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(matchDetailRouting)
final matchDetailRoutingProvider = MatchDetailRoutingProvider._();

final class MatchDetailRoutingProvider
    extends
        $FunctionalProvider<
          MatchDetailRouting,
          MatchDetailRouting,
          MatchDetailRouting
        >
    with $Provider<MatchDetailRouting> {
  MatchDetailRoutingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'matchDetailRoutingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$matchDetailRoutingHash();

  @$internal
  @override
  $ProviderElement<MatchDetailRouting> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MatchDetailRouting create(Ref ref) {
    return matchDetailRouting(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MatchDetailRouting value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MatchDetailRouting>(value),
    );
  }
}

String _$matchDetailRoutingHash() =>
    r'372f14f0c8d78188498b40e67dac7dab73f8e379';

@ProviderFor(matchDetailTheme)
final matchDetailThemeProvider = MatchDetailThemeProvider._();

final class MatchDetailThemeProvider
    extends
        $FunctionalProvider<
          MatchDetailTheme,
          MatchDetailTheme,
          MatchDetailTheme
        >
    with $Provider<MatchDetailTheme> {
  MatchDetailThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'matchDetailThemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$matchDetailThemeHash();

  @$internal
  @override
  $ProviderElement<MatchDetailTheme> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MatchDetailTheme create(Ref ref) {
    return matchDetailTheme(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MatchDetailTheme value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MatchDetailTheme>(value),
    );
  }
}

String _$matchDetailThemeHash() => r'12d52d3949b804c3c4f67ffb9f5a957ae3309679';

/// Contrat de régulation : l'écran déclare « quelqu'un peut me donner un widget de
/// cotes ». Nullable, mais il `throw` quand même — chaque marché doit répondre
/// explicitement oui (une fabrique) ou non (`null`).

@ProviderFor(matchDetailOddsFactory)
final matchDetailOddsFactoryProvider = MatchDetailOddsFactoryProvider._();

/// Contrat de régulation : l'écran déclare « quelqu'un peut me donner un widget de
/// cotes ». Nullable, mais il `throw` quand même — chaque marché doit répondre
/// explicitement oui (une fabrique) ou non (`null`).

final class MatchDetailOddsFactoryProvider
    extends
        $FunctionalProvider<
          WidgetFactory<Match>?,
          WidgetFactory<Match>?,
          WidgetFactory<Match>?
        >
    with $Provider<WidgetFactory<Match>?> {
  /// Contrat de régulation : l'écran déclare « quelqu'un peut me donner un widget de
  /// cotes ». Nullable, mais il `throw` quand même — chaque marché doit répondre
  /// explicitement oui (une fabrique) ou non (`null`).
  MatchDetailOddsFactoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'matchDetailOddsFactoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$matchDetailOddsFactoryHash();

  @$internal
  @override
  $ProviderElement<WidgetFactory<Match>?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WidgetFactory<Match>? create(Ref ref) {
    return matchDetailOddsFactory(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WidgetFactory<Match>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WidgetFactory<Match>?>(value),
    );
  }
}

String _$matchDetailOddsFactoryHash() =>
    r'a00a70e1b8f166fd5f40228680ea910cb252c050';
