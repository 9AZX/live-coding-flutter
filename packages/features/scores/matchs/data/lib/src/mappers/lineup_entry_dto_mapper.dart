import 'package:matchs_data/src/dtos/lineup_entry_dto.br.dart';
import 'package:scores_domain/scores_domain.dart';

extension LineupEntryDtoMapper on LineupEntryDto {
  bool get isHome => (home ?? '').toLowerCase() == 'yes';

  bool get isSubstitute => (substitute ?? '').toLowerCase() == 'yes';

  Player toEntity() {
    final player = this.player ?? '';

    return Player(name: player.isEmpty ? '?' : player, number: int.tryParse(squadNumber ?? '') ?? 0);
  }
}

/// Regroupe les joueurs en deux compositions. Les équipes et les formations viennent
/// de l'event : l'endpoint lineup ne les renvoie pas de façon fiable.
List<Lineup> lineupsFrom({
  required Team away,
  required String awayFormation,
  required List<LineupEntryDto> entries,
  required Team home,
  required String homeFormation,
}) {
  final titulars = entries.where((entry) => !entry.isSubstitute).toList();

  if (titulars.isEmpty) return const [];

  return [
    Lineup(
      formation: homeFormation,
      players: [for (final entry in titulars.where((entry) => entry.isHome)) entry.toEntity()],
      team: home,
    ),
    Lineup(
      formation: awayFormation,
      players: [for (final entry in titulars.where((entry) => !entry.isHome)) entry.toEntity()],
      team: away,
    ),
  ];
}
