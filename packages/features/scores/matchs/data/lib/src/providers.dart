import 'package:matchs_data/src/providers.br.dart';
import 'package:matchs_data/src/providers_di.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scores_domain/scores_domain.dart' as scores_domain;

List<Override> bindProviders() => [
  ...scores_domain.bindProviders(scoresRepository: scoresRepositoryProvider),
];

/// Alimenté par le package de composition du marché (`fr_providers`, `pl_providers`).
List<Override> bindRegulationProviders({
  required Map<int, String> countryByLeague,
  required List<int> leagueIds,
}) => [
  countryByLeagueProvider.overrideWithValue(countryByLeague),
  leagueIdsProvider.overrideWithValue(leagueIds),
];
