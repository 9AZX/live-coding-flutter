// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_internal.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Thème par défaut de la feature, dérivé de la palette DSM. Aucune couleur brute :
/// la composition peut le surcharger sans toucher la feature.

@ProviderFor(defaultMatchDetailTheme)
final defaultMatchDetailThemeProvider = DefaultMatchDetailThemeProvider._();

/// Thème par défaut de la feature, dérivé de la palette DSM. Aucune couleur brute :
/// la composition peut le surcharger sans toucher la feature.

final class DefaultMatchDetailThemeProvider
    extends
        $FunctionalProvider<
          MatchDetailTheme,
          MatchDetailTheme,
          MatchDetailTheme
        >
    with $Provider<MatchDetailTheme> {
  /// Thème par défaut de la feature, dérivé de la palette DSM. Aucune couleur brute :
  /// la composition peut le surcharger sans toucher la feature.
  DefaultMatchDetailThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'defaultMatchDetailThemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$defaultMatchDetailThemeHash();

  @$internal
  @override
  $ProviderElement<MatchDetailTheme> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MatchDetailTheme create(Ref ref) {
    return defaultMatchDetailTheme(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MatchDetailTheme value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MatchDetailTheme>(value),
    );
  }
}

String _$defaultMatchDetailThemeHash() =>
    r'f5c11cc40ed5ab857ed62afb69f2a87e1c637a07';
