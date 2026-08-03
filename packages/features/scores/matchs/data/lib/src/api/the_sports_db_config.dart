/// Configuration de TheSportsDB (https://www.thesportsdb.com/api.php).
///
/// La clé fait partie de l'URL. La clé de test publique `123` suffit pour l'exo ;
/// surchargeable via `--dart-define=THESPORTSDB_KEY=…`.
class TheSportsDbConfig {
  const TheSportsDbConfig._();

  static const String apiKey = String.fromEnvironment('THESPORTSDB_KEY', defaultValue: '123');

  static const String baseUrl = 'https://www.thesportsdb.com/api/v1/json';

  /// Pays par ligue (l'endpoint events ne le renvoie pas toujours).
  static const Map<int, String> countryByLeague = {4429: 'Monde'};

  /// Ligues du feed (ids TheSportsDB). Coupe du Monde uniquement (4429).
  static const List<int> leagueIds = [4429];
}
