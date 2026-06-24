// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_di.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Thème par défaut fourni par la composition (`theme_manager`).

@ProviderFor(scoresTheme)
final scoresThemeProvider = ScoresThemeProvider._();

/// Thème par défaut fourni par la composition (`theme_manager`).

final class ScoresThemeProvider extends $FunctionalProvider<ScoresTheme, ScoresTheme, ScoresTheme>
    with $Provider<ScoresTheme> {
  /// Thème par défaut fourni par la composition (`theme_manager`).
  ScoresThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scoresThemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scoresThemeHash();

  @$internal
  @override
  $ProviderElement<ScoresTheme> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  ScoresTheme create(Ref ref) {
    return scoresTheme(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ScoresTheme value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ScoresTheme>(value),
    );
  }
}

String _$scoresThemeHash() => r'd5b9de2a29d8e88acbd968544ee97e22ef911f26';

/// Implémentation de navigation fournie par la composition (`scores_router`).

@ProviderFor(scoresRouting)
final scoresRoutingProvider = ScoresRoutingProvider._();

/// Implémentation de navigation fournie par la composition (`scores_router`).

final class ScoresRoutingProvider extends $FunctionalProvider<ScoresRouting, ScoresRouting, ScoresRouting>
    with $Provider<ScoresRouting> {
  /// Implémentation de navigation fournie par la composition (`scores_router`).
  ScoresRoutingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scoresRoutingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scoresRoutingHash();

  @$internal
  @override
  $ProviderElement<ScoresRouting> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  ScoresRouting create(Ref ref) {
    return scoresRouting(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ScoresRouting value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ScoresRouting>(value),
    );
  }
}

String _$scoresRoutingHash() => r'db6face40e001ede04f7feff69f46406671abad4';
