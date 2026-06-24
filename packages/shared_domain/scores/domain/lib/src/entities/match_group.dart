import 'package:scores_domain/src/entities/competition.dart';
import 'package:scores_domain/src/entities/match.dart';

/// Matchs d'une même compétition, regroupés pour l'affichage.
class MatchGroup {
  const MatchGroup({required this.competition, required this.matches});

  final Competition competition;
  final List<Match> matches;
}
