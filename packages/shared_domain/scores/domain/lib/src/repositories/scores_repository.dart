import 'package:scores_domain/src/entities/match.br.dart';
import 'package:scores_domain/src/entities/match_day.dart';

// ignore: one_member_abstracts
abstract interface class ScoresRepository {
  /// Flux des matchs du jour demandé ; émet à nouveau quand un score change.
  Stream<List<Match>> watchMatches(MatchDay day);

  // WORKSHOP : `Stream<Match?> watchMatch(String id)` (détail) à reconstruire ici.
}
