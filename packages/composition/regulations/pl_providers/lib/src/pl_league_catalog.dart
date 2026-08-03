/// Catalogue des compétitions du marché polonais : Ekstraklasa en tête, puis les
/// grands championnats européens suivis localement.
class PlLeagueCatalog {
  const PlLeagueCatalog._();

  static const Map<String, String> countryByLeague = {
    '4328': 'Anglia',
    '4331': 'Niemcy',
    '4332': 'Włochy',
    '4335': 'Hiszpania',
    '4422': 'Polska',
  };

  static const List<String> leagueIds = [
    '4422', // Ekstraklasa
    '4328', // Premier League
    '4335', // La Liga
    '4332', // Serie A
    '4331', // Bundesliga
  ];
}
