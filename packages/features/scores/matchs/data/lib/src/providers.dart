import 'package:matchs_data/src/data_sources/the_sports_db_scores_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scores_domain/scores_domain.dart';

/// Override de l'interface partagée `ScoresRepository` par l'impl TheSportsDB.
List<Override> bindScoresRepository() => [
  scoresRepositoryProvider.overrideWithValue(TheSportsDbScoresDataSource()),
];
