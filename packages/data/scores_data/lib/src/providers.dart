import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scores_data/src/data_sources/in_memory_favorites_data_source.dart';
import 'package:scores_data/src/data_sources/in_memory_scores_data_source.dart';
import 'package:scores_domain/scores_domain.dart';

/// Overrides à appliquer dans la composition : branche les interfaces du common
/// domain sur les sources de données en mémoire.
List<Override> bindScoresDataProviders() => [
  scoresRepositoryProvider.overrideWithValue(InMemoryScoresDataSource()),
  favoritesRepositoryProvider.overrideWithValue(InMemoryFavoritesDataSource()),
];
