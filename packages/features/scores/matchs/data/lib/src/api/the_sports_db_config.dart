/// Configuration technique de TheSportsDB (https://www.thesportsdb.com/api.php).
///
/// La clé fait partie de l'URL. La clé de test publique `123` suffit pour l'exo ;
/// surchargeable via `--dart-define=THESPORTSDB_KEY=…`.
///
/// Limite assumée de la clé de test : l'API tronque **chaque** réponse à 3 matchs,
/// quelle que soit la ligue ou la date. Le feed s'élargit donc en ajoutant des
/// ligues (une carte de compétition par ligue), pas en visant une ligue chargée.
///
/// Le *catalogue* de ligues n'est PAS ici : il dépend du marché, donc il arrive par
/// injection (voir `providers_di.br.dart` et `bindRegulationProviders`).
class TheSportsDbConfig {
  const TheSportsDbConfig._();

  static const String apiKey = String.fromEnvironment('THESPORTSDB_KEY', defaultValue: '123');

  static const String baseUrl = 'https://www.thesportsdb.com/api/v1/json';
}
