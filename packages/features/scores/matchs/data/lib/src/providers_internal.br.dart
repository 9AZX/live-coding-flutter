import 'package:matchs_data/src/data_sources/the_sports_db_scores_data_source.dart';
import 'package:matchs_data/src/providers_di.br.dart';
import 'package:network_domain/network_domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers_internal.br.g.dart';

/// Source de temps injectée : les tests figent la date, la source ne connaît pas
/// l'horloge de l'appareil (en prod : utilitaire NTP type Kronos).
@riverpod
DateTime Function() clock(Ref _) => DateTime.now;

@riverpod
TheSportsDbScoresDataSource scoresDataSource(Ref ref) {
  final configuration = HttpClientConfiguration(baseUrl: ref.watch(scoresBaseUrlProvider));

  return TheSportsDbScoresDataSource(
    clock: ref.watch(clockProvider),
    client: ref.watch(httpClientProvider(configuration)),
    countryByLeague: ref.watch(countryByLeagueProvider),
    leagueIds: ref.watch(leagueIdsProvider),
  );
}
