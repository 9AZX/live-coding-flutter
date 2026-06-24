import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matchs_presentation/src/theme/scores_theme.dart';
import 'package:matchs_presentation/src/widgets/live_dot.dart';
import 'package:matchs_presentation/src/widgets/team_badge.dart';
import 'package:scores_domain/scores_domain.dart';
import 'package:tactics_theme/tactics_theme.dart';

/// Rangée de match partagée par Matchs / En direct / Favoris.
/// Étoile → favori (common domain).
///
/// WORKSHOP : la rangée n'est pas cliquable. À reconstruire en live — ajouter un
/// port `ScoresRouting` et envelopper d'un `GestureDetector` qui ouvre le détail.
class MatchRow extends ConsumerWidget {
  const MatchRow({required this.match, required this.showDivider, super.key});

  final Match match;
  final bool showDivider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.scoresTheme;
    final isFavorite = ref.watch(favoriteMatchIdsProvider.select((v) => v.value?.contains(match.id) ?? false));

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
      decoration: BoxDecoration(
        border: showDivider ? Border(bottom: BorderSide(color: theme.divider)) : null,
      ),
      child: Row(
        children: [
          SizedBox(width: 46, child: _StatusCell(match: match)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TeamLine(team: match.home),
                  const SizedBox(height: 6),
                  _TeamLine(team: match.away),
                ],
              ),
            ),
          ),
          SizedBox(width: 24, child: _ScoreCell(match: match)),
          const SizedBox(width: 6),
          GestureDetector(
            onTap: () => ref.read(favoritesRepositoryProvider).toggleMatch(match.id),
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: TacticsIcon(
                isFavorite ? theme.palette.iconStarFull : theme.palette.iconStarEmpty,
                size: 19,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusCell extends StatelessWidget {
  const _StatusCell({required this.match});

  final Match match;

  @override
  Widget build(BuildContext context) {
    final theme = context.scoresTheme;

    return switch (match.status) {
      MatchStatus.live => Column(
        children: [
          LiveDot(color: theme.palette.red),
          const SizedBox(height: 2),
          Text(
            '${match.minute ?? 0}’',
            style: TextStyle(
              fontFamily: theme.palette.fontExpanded,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w700,
              fontSize: 12,
              color: theme.palette.red,
            ),
          ),
        ],
      ),
      MatchStatus.upcoming => Text(
        match.kickoff,
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: theme.palette.night),
      ),
      MatchStatus.finished => Text(
        'Fin',
        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: theme.palette.n300),
      ),
    };
  }
}

class _TeamLine extends StatelessWidget {
  const _TeamLine({required this.team});

  final Team team;

  @override
  Widget build(BuildContext context) {
    final theme = context.scoresTheme;

    return Row(
      children: [
        TeamBadge(shortName: team.shortName, colorValue: team.colorValue),
        const SizedBox(width: 9),
        Expanded(
          child: Text(
            team.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: theme.palette.night),
          ),
        ),
      ],
    );
  }
}

class _ScoreCell extends StatelessWidget {
  const _ScoreCell({required this.match});

  final Match match;

  @override
  Widget build(BuildContext context) {
    final theme = context.scoresTheme;

    if (!match.hasScore) {
      final dash = Text(
        '-',
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: theme.palette.n200),
      );

      return Column(children: [dash, const SizedBox(height: 6), dash]);
    }

    final color = match.isLive ? theme.palette.red : theme.palette.night;
    final style = TextStyle(
      fontFamily: theme.palette.fontExpanded,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w900,
      fontSize: 15,
      color: color,
    );

    return Column(
      children: [
        Text('${match.homeScore}', style: style),
        const SizedBox(height: 6),
        Text('${match.awayScore}', style: style),
      ],
    );
  }
}
