// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_internal.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Thème par défaut de la feature, dérivé de la palette DSM. L'app peut le
/// remplacer via `bindProviders(theme: …)` sans toucher à la feature.

@ProviderFor(defaultMatchsTheme)
final defaultMatchsThemeProvider = DefaultMatchsThemeProvider._();

/// Thème par défaut de la feature, dérivé de la palette DSM. L'app peut le
/// remplacer via `bindProviders(theme: …)` sans toucher à la feature.

final class DefaultMatchsThemeProvider
    extends $FunctionalProvider<MatchsTheme, MatchsTheme, MatchsTheme>
    with $Provider<MatchsTheme> {
  /// Thème par défaut de la feature, dérivé de la palette DSM. L'app peut le
  /// remplacer via `bindProviders(theme: …)` sans toucher à la feature.
  DefaultMatchsThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'defaultMatchsThemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$defaultMatchsThemeHash();

  @$internal
  @override
  $ProviderElement<MatchsTheme> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MatchsTheme create(Ref ref) {
    return defaultMatchsTheme(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MatchsTheme value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MatchsTheme>(value),
    );
  }
}

String _$defaultMatchsThemeHash() =>
    r'3955e8496e5d831e9f4ab2475d8d6c5a435001d9';
