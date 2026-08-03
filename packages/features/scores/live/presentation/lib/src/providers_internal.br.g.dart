// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_internal.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(defaultLiveTheme)
final defaultLiveThemeProvider = DefaultLiveThemeProvider._();

final class DefaultLiveThemeProvider
    extends $FunctionalProvider<LiveTheme, LiveTheme, LiveTheme>
    with $Provider<LiveTheme> {
  DefaultLiveThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'defaultLiveThemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$defaultLiveThemeHash();

  @$internal
  @override
  $ProviderElement<LiveTheme> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LiveTheme create(Ref ref) {
    return defaultLiveTheme(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LiveTheme value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LiveTheme>(value),
    );
  }
}

String _$defaultLiveThemeHash() => r'88b6f3021f8980538b412e28821fda321c12c782';
