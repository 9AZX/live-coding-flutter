import 'package:matchs_data/src/dtos/timeline_entry_dto.br.dart';
import 'package:scores_domain/scores_domain.dart';

/// Traduit une entrée de timeline en évènement du domaine. Rend `null` pour ce que
/// l'écran n'affiche pas (remplacements) : c'est le data source qui filtre.
extension TimelineEntryDtoMapper on TimelineEntryDto {
  MatchEvent? toEntity() {
    final type = _typeOf(this.type ?? '', detail ?? '');

    if (type == null) return null;

    final player = this.player ?? '';
    final assist = this.assist ?? '';

    return MatchEvent(
      detail: type == MatchEventType.goal && assist.isNotEmpty ? 'Passe déc. $assist' : null,
      isHome: (home ?? '').toLowerCase() == 'yes',
      minute: int.tryParse(minute ?? '') ?? 0,
      player: player.isEmpty ? '?' : player,
      type: type,
    );
  }
}

MatchEventType? _typeOf(String type, String detail) {
  final normalizedDetail = detail.toLowerCase();

  return switch (type.toLowerCase()) {
    'goal' => MatchEventType.goal,
    'card' when normalizedDetail.contains('red') => MatchEventType.redCard,
    'card' => MatchEventType.yellowCard,
    _ => null,
  };
}
