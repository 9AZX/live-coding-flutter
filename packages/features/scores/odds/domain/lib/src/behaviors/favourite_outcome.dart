import 'package:odds_domain/src/entities/odds.br.dart';

enum MatchOutcome { away, draw, home }

/// Désigne l'issue favorite des bookmakers : la cote la plus basse.
/// À cotes égales, le nul est privilégié (convention retenue pour l'exercice).
class FavouriteOutcome {
  const FavouriteOutcome();

  MatchOutcome call(Odds odds) {
    if (odds.home < odds.draw && odds.home < odds.away) return MatchOutcome.home;
    if (odds.away < odds.draw && odds.away < odds.home) return MatchOutcome.away;

    return MatchOutcome.draw;
  }
}
