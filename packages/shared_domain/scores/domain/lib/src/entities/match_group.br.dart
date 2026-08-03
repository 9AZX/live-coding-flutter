import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scores_domain/src/entities/competition.br.dart';
import 'package:scores_domain/src/entities/match.br.dart';

part 'match_group.br.freezed.dart';

/// Matchs d'une même compétition, regroupés pour l'affichage.
@freezed
abstract class MatchGroup with _$MatchGroup {
  const factory MatchGroup({
    required Competition competition,
    required List<Match> matches,
  }) = _MatchGroup;
}
