// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Matchs favoris : croise les ids favoris (partagés) avec le flux des matchs.
/// Démontre une feature qui compose deux providers du common domain.

@ProviderFor(favoriteMatches)
final favoriteMatchesProvider = FavoriteMatchesProvider._();

/// Matchs favoris : croise les ids favoris (partagés) avec le flux des matchs.
/// Démontre une feature qui compose deux providers du common domain.

final class FavoriteMatchesProvider extends $FunctionalProvider<List<Match>, List<Match>, List<Match>>
    with $Provider<List<Match>> {
  /// Matchs favoris : croise les ids favoris (partagés) avec le flux des matchs.
  /// Démontre une feature qui compose deux providers du common domain.
  FavoriteMatchesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoriteMatchesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoriteMatchesHash();

  @$internal
  @override
  $ProviderElement<List<Match>> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  List<Match> create(Ref ref) {
    return favoriteMatches(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Match> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Match>>(value),
    );
  }
}

String _$favoriteMatchesHash() => r'd3bbef28f76536e1de409b57a656cbe5255bacc3';
