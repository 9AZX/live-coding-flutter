/// Configuration de TheSportsDB (https://www.thesportsdb.com/api.php).
///
/// La clé fait partie de l'URL. La clé de test publique `123` suffit pour l'exo ;
/// surchargeable via `--dart-define=THESPORTSDB_KEY=…`.
class TheSportsDbConfig {
  const TheSportsDbConfig();

  static const apiKey = String.fromEnvironment('THESPORTSDB_KEY', defaultValue: '123');

  static const baseUrl = 'https://www.thesportsdb.com/api/v1/json';

  /// Ligues du feed (ids TheSportsDB). Coupe du Monde uniquement (4429).
  static const leagueIds = [4429];

  /// Pays par ligue (l'endpoint events ne le renvoie pas toujours).
  static const countryByLeague = {4429: 'Monde'};
}
