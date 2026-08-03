/// Configuration de TheSportsDB (https://www.thesportsdb.com/api.php).
///
/// La clé fait partie de l'URL. La clé de test publique `123` suffit pour l'exo ;
/// surchargeable via `--dart-define=THESPORTSDB_KEY=…`.
///
/// Limite assumée de la clé de test : l'API tronque **chaque** réponse à 3 matchs,
/// quelle que soit la ligue ou la date. Le feed s'élargit donc en ajoutant des
/// ligues (une carte de compétition par ligue), pas en visant une ligue chargée.
class TheSportsDbConfig {
  const TheSportsDbConfig._();

  static const String apiKey = String.fromEnvironment('THESPORTSDB_KEY', defaultValue: '123');

  static const String baseUrl = 'https://www.thesportsdb.com/api/v1/json';

  /// Pays par ligue (l'endpoint events ne le renvoie pas toujours), en français.
  static const Map<int, String> countryByLeague = {
    4328: 'Angleterre',
    4331: 'Allemagne',
    4332: 'Italie',
    4334: 'France',
    4335: 'Espagne',
    4346: 'États-Unis',
    4351: 'Brésil',
    4406: 'Argentine',
  };

  /// Ligues du feed (ids TheSportsDB), dans l'ordre d'affichage des compétitions.
  /// Les cinq grands championnats européens tournent d'août à mai ; le Brésil,
  /// l'Argentine et la MLS couvrent l'été, pour que le feed ne soit jamais vide.
  static const List<int> leagueIds = [
    4334, // Ligue 1
    4328, // Premier League
    4335, // La Liga
    4332, // Serie A
    4331, // Bundesliga
    4351, // Brasileirão
    4406, // Primera División
    4346, // MLS
  ];
}
