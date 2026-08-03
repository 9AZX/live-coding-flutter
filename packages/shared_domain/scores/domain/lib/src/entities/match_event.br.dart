import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_event.br.freezed.dart';

enum MatchEventType { goal, redCard, yellowCard }

/// Évènement de la timeline d'un match (but, carton).
@freezed
abstract class MatchEvent with _$MatchEvent {
  const factory MatchEvent({
    /// `true` si l'évènement concerne l'équipe à domicile.
    required bool isHome,

    required int minute,
    required String player,
    required MatchEventType type,

    /// Précision optionnelle (« Penalty », « Passe déc. X »…).
    String? detail,
  }) = _MatchEvent;

  const MatchEvent._();

  bool get isGoal => type == MatchEventType.goal;
}
