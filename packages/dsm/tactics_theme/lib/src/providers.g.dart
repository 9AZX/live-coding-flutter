// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tacticsPalette)
final tacticsPaletteProvider = TacticsPaletteProvider._();

final class TacticsPaletteProvider extends $FunctionalProvider<TacticsPalette, TacticsPalette, TacticsPalette>
    with $Provider<TacticsPalette> {
  TacticsPaletteProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tacticsPaletteProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tacticsPaletteHash();

  @$internal
  @override
  $ProviderElement<TacticsPalette> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  TacticsPalette create(Ref ref) {
    return tacticsPalette(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TacticsPalette value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TacticsPalette>(value),
    );
  }
}

String _$tacticsPaletteHash() => r'df7fcff7e012d0179711177dc9ce94878e206744';
