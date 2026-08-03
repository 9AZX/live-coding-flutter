// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(favouriteOutcome)
final favouriteOutcomeProvider = FavouriteOutcomeProvider._();

final class FavouriteOutcomeProvider
    extends
        $FunctionalProvider<
          FavouriteOutcome,
          FavouriteOutcome,
          FavouriteOutcome
        >
    with $Provider<FavouriteOutcome> {
  FavouriteOutcomeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favouriteOutcomeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favouriteOutcomeHash();

  @$internal
  @override
  $ProviderElement<FavouriteOutcome> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FavouriteOutcome create(Ref ref) {
    return favouriteOutcome(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FavouriteOutcome value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FavouriteOutcome>(value),
    );
  }
}

String _$favouriteOutcomeHash() => r'7a0599d30b215fa951648211ae159ffde014edb2';

@ProviderFor(oddsForMatch)
final oddsForMatchProvider = OddsForMatchFamily._();

final class OddsForMatchProvider
    extends $FunctionalProvider<Odds?, Odds?, Odds?>
    with $Provider<Odds?> {
  OddsForMatchProvider._({
    required OddsForMatchFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'oddsForMatchProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$oddsForMatchHash();

  @override
  String toString() {
    return r'oddsForMatchProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Odds?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Odds? create(Ref ref) {
    final argument = this.argument as String;
    return oddsForMatch(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Odds? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Odds?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is OddsForMatchProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$oddsForMatchHash() => r'f80e8a767d75c4d7a9632302728cadb1bd82e30d';

final class OddsForMatchFamily extends $Family
    with $FunctionalFamilyOverride<Odds?, String> {
  OddsForMatchFamily._()
    : super(
        retry: null,
        name: r'oddsForMatchProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  OddsForMatchProvider call(String matchId) =>
      OddsForMatchProvider._(argument: matchId, from: this);

  @override
  String toString() => r'oddsForMatchProvider';
}
