import 'package:scores_domain/src/entities/errors/scores_error.br.dart';
import 'package:scores_domain/src/entities/match.br.dart';
import 'package:scores_domain/src/entities/match_day.dart';
import 'package:scores_domain/src/repositories/scores_repository.dart';
import 'package:types_result_domain/types_result_domain.dart';

class FetchMatches {
  final ScoresRepository _repository;

  const FetchMatches({required ScoresRepository repository}) : _repository = repository;

  Future<Result<List<Match>, ScoresError>> execute(MatchDay day) => _repository.fetchMatches(day);
}
