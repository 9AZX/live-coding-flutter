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
          Map<String, String>,
          Map<String, String>,
          Map<String, String>
        >
    with $Provider<Map<String, String>> {
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
  $ProviderElement<Map<String, String>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Map<String, String> create(Ref ref) {
    return countryByLeague(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, String>>(value),
    );
  }
}

String _$countryByLeagueHash() => r'8eceb904d67e37ece4aef50d773fcfcff4b09a8b';

/// Ids TheSportsDB des ligues du feed, dans l'ordre d'affichage des compétitions.

@ProviderFor(leagueIds)
final leagueIdsProvider = LeagueIdsProvider._();

/// Ids TheSportsDB des ligues du feed, dans l'ordre d'affichage des compétitions.

final class LeagueIdsProvider
    extends $FunctionalProvider<List<String>, List<String>, List<String>>
    with $Provider<List<String>> {
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
  $ProviderElement<List<String>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<String> create(Ref ref) {
    return leagueIds(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$leagueIdsHash() => r'b9e5ba696080c02249eb77361a32821e48081463';

/// Racine de l'API scores. La feature ignore l'environnement sur lequel elle tourne.

@ProviderFor(scoresBaseUrl)
final scoresBaseUrlProvider = ScoresBaseUrlProvider._();

/// Racine de l'API scores. La feature ignore l'environnement sur lequel elle tourne.

final class ScoresBaseUrlProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  /// Racine de l'API scores. La feature ignore l'environnement sur lequel elle tourne.
  ScoresBaseUrlProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scoresBaseUrlProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scoresBaseUrlHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return scoresBaseUrl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$scoresBaseUrlHash() => r'e9d292bbea60b1d7cb73a68c712d21d6a9ea2e85';
