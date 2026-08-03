// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_internal.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(defaultOddsTheme)
final defaultOddsThemeProvider = DefaultOddsThemeProvider._();

final class DefaultOddsThemeProvider
    extends $FunctionalProvider<OddsTheme, OddsTheme, OddsTheme>
    with $Provider<OddsTheme> {
  DefaultOddsThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'defaultOddsThemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$defaultOddsThemeHash();

  @$internal
  @override
  $ProviderElement<OddsTheme> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  OddsTheme create(Ref ref) {
    return defaultOddsTheme(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OddsTheme value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OddsTheme>(value),
    );
  }
}

String _$defaultOddsThemeHash() => r'04feff4664b07e86757b55c9d4774a79cf7c8722';
