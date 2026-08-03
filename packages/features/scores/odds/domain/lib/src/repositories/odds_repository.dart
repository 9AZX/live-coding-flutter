import 'package:odds_domain/src/entities/odds.br.dart';

// ignore: one_member_abstracts
abstract interface class OddsRepository {
  /// Cotes d'une rencontre, ou `null` si le marché n'est pas ouvert.
  Odds? oddsForMatch(String matchId);
}
