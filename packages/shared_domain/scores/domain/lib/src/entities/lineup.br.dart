import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scores_domain/src/entities/team.br.dart';

part 'lineup.br.freezed.dart';

@freezed
abstract class Player with _$Player {
  const factory Player({required String name, required int number}) = _Player;
}

/// Composition d'une équipe pour un match (onglet « Compo »).
@freezed
abstract class Lineup with _$Lineup {
  const factory Lineup({
    required String formation,
    required List<Player> players,
    required Team team,
  }) = _Lineup;
}
