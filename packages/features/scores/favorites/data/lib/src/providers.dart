import 'package:favorites_data/src/data_sources/in_memory_favorites_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scores_domain/scores_domain.dart';

/// Override de l'interface partagée `FavoritesRepository` par l'impl en mémoire.
List<Override> bindFavoritesRepository() => [
  favoritesRepositoryProvider.overrideWithValue(InMemoryFavoritesDataSource()),
];
