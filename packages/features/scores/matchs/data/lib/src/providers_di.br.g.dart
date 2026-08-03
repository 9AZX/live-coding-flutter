// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_di.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Pays par ligue, pour l'affichage (l'endpoint events ne le renvoie pas toujours).

@ProviderFor(countryByLeague)
final countryByLeagueProvider = CountryByLeagueProvider._();

/// Pays par ligue, pour l'affichage (l'endpoint events ne le renvoie pas toujours).

final class CountryByLeagueProvider
    extends
        $FunctionalProvider<
          Map<int, String>,
          Map<int, String>,
          Map<int, String>
        >
    with $Provider<Map<int, String>> {
  /// Pays par ligue, pour l'affichage (l'endpoint events ne le renvoie pas toujours).
  CountryByLeagueProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'countryByLeagueProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$countryByLeagueHash();

  @$internal
  @override
  $ProviderElement<Map<int, String>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Map<int, String> create(Ref ref) {
    return countryByLeague(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<int, String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<int, String>>(value),
    );
  }
}

String _$countryByLeagueHash() => r'8403bf9951e560b3e7c51a8440b3d5adcd876577';

/// Ids TheSportsDB des ligues du feed, dans l'ordre d'affichage des compétitions.

@ProviderFor(leagueIds)
final leagueIdsProvider = LeagueIdsProvider._();

/// Ids TheSportsDB des ligues du feed, dans l'ordre d'affichage des compétitions.

final class LeagueIdsProvider
    extends $FunctionalProvider<List<int>, List<int>, List<int>>
    with $Provider<List<int>> {
  /// Ids TheSportsDB des ligues du feed, dans l'ordre d'affichage des compétitions.
  LeagueIdsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'leagueIdsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$leagueIdsHash();

  @$internal
  @override
  $ProviderElement<List<int>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<int> create(Ref ref) {
    return leagueIds(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<int>>(value),
    );
  }
}

String _$leagueIdsHash() => r'cfeb336a8eaf6431ac8d650280a590d32747a640';
