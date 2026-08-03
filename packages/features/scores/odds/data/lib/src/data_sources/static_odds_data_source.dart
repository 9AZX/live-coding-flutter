import 'package:odds_domain/odds_domain.dart';

/// Cotes dérivées de l'id du match : pas d'appel réseau, donc des valeurs stables
/// d'un lancement à l'autre. La clé de test de TheSportsDB n'expose pas de cotes ;
/// en production ce serait un `OddsHttpDataSource` sur le service de trading.
final class StaticOddsDataSource implements OddsRepository {
  const StaticOddsDataSource();

  @override
  Odds? oddsForMatch(String matchId) {
    final seed = matchId.codeUnits.fold(0, (sum, unit) => sum + unit);

    // Marché fermé pour un match sur sept : le widget doit gérer l'absence de cotes.
    if (seed % 7 == 0) return null;

    return Odds(
      away: _quote(seed, offset: 5, spread: 40),
      draw: _quote(seed, offset: 3, spread: 12),
      home: _quote(seed, offset: 1, spread: 30),
    );
  }

  /// Cote décimale entre 1.20 et (1.20 + spread/10), au dixième près.
  double _quote(int seed, {required int offset, required int spread}) => (12 + (seed * offset) % spread) / 10;
}
