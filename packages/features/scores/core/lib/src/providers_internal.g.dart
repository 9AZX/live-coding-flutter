// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_internal.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Le thème est fourni par la feature elle-même, construit depuis la palette DSM.
/// L'app peut l'overrider (ex. dark mode, A/B) sans theme_manager dédié.

@ProviderFor(scoresTheme)
final scoresThemeProvider = ScoresThemeProvider._();

/// Le thème est fourni par la feature elle-même, construit depuis la palette DSM.
/// L'app peut l'overrider (ex. dark mode, A/B) sans theme_manager dédié.

final class ScoresThemeProvider extends $FunctionalProvider<ScoresTheme, ScoresTheme, ScoresTheme>
    with $Provider<ScoresTheme> {
  /// Le thème est fourni par la feature elle-même, construit depuis la palette DSM.
  /// L'app peut l'overrider (ex. dark mode, A/B) sans theme_manager dédié.
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

String _$scoresThemeHash() => r'94a9e41f558d170e90ae908ee11ff6a63646d859';
