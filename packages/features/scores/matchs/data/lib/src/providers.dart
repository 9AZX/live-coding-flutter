import 'package:matchs_data/src/providers.br.dart';
import 'package:matchs_data/src/providers_di.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scores_domain/scores_domain.dart' as scores_domain;

List<Override> bindProviders({required ProviderListenable<String> baseUrlProvider}) => [
  scoresBaseUrlProvider.overrideWith((ref) => ref.watch(baseUrlProvider)),
  ...scores_domain.bindProviders(scoresRepository: scoresRepositoryProvider),
];

/// Alimenté par le package de composition du marché (`fr_providers`, `pl_providers`).
List<Override> bindRegulationProviders({
  required Map<String, String> countryByLeague,
  required List<String> leagueIds,
}) => [
  countryByLeagueProvider.overrideWithValue(countryByLeague),
  leagueIdsProvider.overrideWithValue(leagueIds),
];
