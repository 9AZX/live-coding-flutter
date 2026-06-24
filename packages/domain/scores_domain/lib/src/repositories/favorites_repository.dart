/// Favoris (matchs suivis). État partagé entre les features : la page Favoris,
/// et l'étoile des lignes de Matchs / En direct, lisent et modifient ce même flux.
abstract interface class FavoritesRepository {
  Stream<Set<String>> watchFavoriteMatchIds();

  void toggleMatch(String matchId);
}
