enum MatchEventType { goal, yellowCard, redCard }

/// Évènement de la timeline d'un match (but, carton).
class MatchEvent {
  const MatchEvent({
    required this.minute,
    required this.type,
    required this.isHome,
    required this.player,
    this.detail,
  });

  final int minute;
  final MatchEventType type;

  /// `true` si l'évènement concerne l'équipe à domicile.
  final bool isHome;
  final String player;

  /// Précision optionnelle (« Penalty », « Passe déc. X »…).
  final String? detail;

  bool get isGoal => type == MatchEventType.goal;
}
