/// Favoris (matchs suivis). État partagé entre les features : l'écran Favoris et
/// l'étoile des lignes de Matchs / En direct lisent et modifient ce même flux.
abstract interface class FavoritesRepository {
  void toggleMatch(String matchId);

  Stream<Set<String>> watchFavoriteMatchIds();
}
