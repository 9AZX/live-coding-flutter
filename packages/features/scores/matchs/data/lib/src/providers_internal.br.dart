import 'package:matchs_data/src/api/the_sports_db_client.dart';
import 'package:matchs_data/src/data_sources/the_sports_db_scores_data_source.dart';
import 'package:matchs_data/src/providers_di.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers_internal.br.g.dart';

@riverpod
TheSportsDbClient theSportsDbClient(Ref _) => TheSportsDbClient();

@riverpod
TheSportsDbScoresDataSource scoresDataSource(Ref ref) => TheSportsDbScoresDataSource(
  client: ref.watch(theSportsDbClientProvider),
  countryByLeague: ref.watch(countryByLeagueProvider),
  leagueIds: ref.watch(leagueIdsProvider),
);
