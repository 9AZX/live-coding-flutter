import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scores_domain/src/repositories/favorites_repository.dart';
import 'package:scores_domain/src/repositories/scores_repository.dart';

part 'providers_di.g.dart';

/// Dépendances entrantes : la couche data les override (composition).
@riverpod
ScoresRepository scoresRepository(Ref ref) {
  throw UnimplementedError('scoresRepositoryProvider must be overridden');
}

@riverpod
FavoritesRepository favoritesRepository(Ref ref) {
  throw UnimplementedError('favoritesRepositoryProvider must be overridden');
}
