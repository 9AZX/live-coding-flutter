// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Matchs favoris : croise les ids favoris (partagés) avec le flux des matchs.
/// Démontre une feature qui compose deux providers du domaine partagé.

@ProviderFor(favoriteMatches)
final favoriteMatchesProvider = FavoriteMatchesProvider._();

/// Matchs favoris : croise les ids favoris (partagés) avec le flux des matchs.
/// Démontre une feature qui compose deux providers du domaine partagé.

final class FavoriteMatchesProvider
    extends $FunctionalProvider<List<Match>, List<Match>, List<Match>>
    with $Provider<List<Match>> {
  /// Matchs favoris : croise les ids favoris (partagés) avec le flux des matchs.
  /// Démontre une feature qui compose deux providers du domaine partagé.
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
  $ProviderElement<List<Match>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

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

String _$favoriteMatchesHash() => r'7f3ec9365801bf8ac7783ff6a246dfaac3c2c35c';
