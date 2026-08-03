import 'package:scores_domain/src/entities/errors/scores_error.br.dart';
import 'package:scores_domain/src/entities/match.br.dart';
import 'package:scores_domain/src/entities/match_day.dart';
import 'package:types_result_domain/types_result_domain.dart';

abstract interface class ScoresRepository {
  /// Une rencontre et son détail (timeline, compositions).
  Future<Result<Match, ScoresError>> fetchMatch(String id);

  /// Matchs du jour demandé. Un échec est une valeur de retour, pas une exception.
  Future<Result<List<Match>, ScoresError>> fetchMatches(MatchDay day);
}
