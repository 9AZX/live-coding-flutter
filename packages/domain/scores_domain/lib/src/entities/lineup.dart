import 'package:scores_domain/src/entities/team.dart';

class Player {
  const Player({required this.number, required this.name});

  final int number;
  final String name;
}

/// Composition d'une équipe pour un match (onglet « Compo »).
class Lineup {
  const Lineup({required this.team, required this.formation, required this.players});

  final Team team;
  final String formation;
  final List<Player> players;
}
