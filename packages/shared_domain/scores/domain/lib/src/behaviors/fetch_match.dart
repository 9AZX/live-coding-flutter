import 'package:scores_domain/src/entities/errors/scores_error.br.dart';
import 'package:scores_domain/src/entities/match.br.dart';
import 'package:scores_domain/src/repositories/scores_repository.dart';
import 'package:types_result_domain/types_result_domain.dart';

class FetchMatch {
  final ScoresRepository _repository;

  const FetchMatch({required ScoresRepository repository}) : _repository = repository;

  Future<Result<Match, ScoresError>> execute(String id) => _repository.fetchMatch(id);
}
