import 'package:scores_domain/src/entities/match.dart';

abstract interface class ScoresRepository {
  /// Flux des matchs ; émet à nouveau quand un score / une minute live change.
  Stream<List<Match>> watchMatches();

  /// Flux d'un match précis (détail) ; `null` si l'id est inconnu.
  Stream<Match?> watchMatch(String id);
}
