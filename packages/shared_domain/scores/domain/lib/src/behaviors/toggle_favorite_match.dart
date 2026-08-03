import 'package:scores_domain/src/repositories/favorites_repository.dart';

/// Bascule l'état favori d'un match. Exposé aux features via un provider : la
/// présentation ne touche jamais le contrat de repository directement.
class ToggleFavoriteMatch {
  final FavoritesRepository repository;

  const ToggleFavoriteMatch({required this.repository});

  void call(String matchId) => repository.toggleMatch(matchId);
}
