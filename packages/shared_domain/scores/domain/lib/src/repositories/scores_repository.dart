import 'package:scores_domain/src/entities/errors/scores_error.br.dart';
import 'package:scores_domain/src/entities/match.br.dart';
import 'package:scores_domain/src/entities/match_day.dart';
import 'package:types_result_domain/types_result_domain.dart';

// ignore: one_member_abstracts
abstract interface class ScoresRepository {
  /// Matchs du jour demandé. Un échec est une valeur de retour, pas une exception.
  Future<Result<List<Match>, ScoresError>> fetchMatches(MatchDay day);

  // WORKSHOP : `fetchMatch(String id)` (détail) à reconstruire ici.
}
