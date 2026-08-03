// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_di.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(oddsTheme)
final oddsThemeProvider = OddsThemeProvider._();

final class OddsThemeProvider
    extends $FunctionalProvider<OddsTheme, OddsTheme, OddsTheme>
    with $Provider<OddsTheme> {
  OddsThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'oddsThemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$oddsThemeHash();

  @$internal
  @override
  $ProviderElement<OddsTheme> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  OddsTheme create(Ref ref) {
    return oddsTheme(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OddsTheme value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OddsTheme>(value),
    );
  }
}

String _$oddsThemeHash() => r'a7badba588de3fbef009db8bad2c03b6dea573a2';
