/// Catalogue des compétitions du marché français : Ligue 1 en tête, puis les autres
/// grands championnats européens, complétés par les championnats d'été (Brésil,
/// Argentine, MLS) pour que le feed ne soit jamais vide entre deux saisons.
class FrLeagueCatalog {
  const FrLeagueCatalog._();

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
