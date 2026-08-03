import 'package:exceptions/exceptions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scores_domain/src/repositories/favorites_repository.dart';
import 'package:scores_domain/src/repositories/scores_repository.dart';

part 'providers_di.br.g.dart';

@riverpod
FavoritesRepository favoritesRepository(Ref ref) {
  throw UnregisteredProviderException(favoritesRepositoryProvider);
}

@riverpod
ScoresRepository scoresRepository(Ref ref) {
  throw UnregisteredProviderException(scoresRepositoryProvider);
}
