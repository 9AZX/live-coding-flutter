import 'package:flutter/material.dart';
import 'package:scores_domain/scores_domain.dart';
import 'package:scores_widgets/scores_widgets.dart';

/// Section « Compo » d'une équipe : en-tête (badge + nom + formation) + onze.
class LineupSection extends StatelessWidget {
  const LineupSection({required this.lineup, super.key});

  final Lineup lineup;

  @override
  Widget build(BuildContext context) {
    final theme = context.scoresTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 9),
          child: Row(
            children: [
              TeamBadge(shortName: lineup.team.shortName, colorValue: lineup.team.colorValue, size: 30, fontSize: 12),
              const SizedBox(width: 11),
              Expanded(
                child: Text(
                  lineup.team.name,
                  style: TextStyle(
                    fontFamily: theme.palette.fontBrand,
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                    color: theme.palette.night,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                decoration: BoxDecoration(
                  color: theme.palette.night,
                  borderRadius: BorderRadius.circular(theme.palette.rPill),
                ),
                child: Text(
                  lineup.formation,
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: theme.palette.white),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(12, 0, 12, 4),
          decoration: BoxDecoration(
            color: theme.palette.white,
            borderRadius: BorderRadius.circular(theme.palette.rXl),
            boxShadow: theme.palette.shadowCard,
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              for (var i = 0; i < lineup.players.length; i++)
                _PlayerRow(player: lineup.players[i], showDivider: i != lineup.players.length - 1),
            ],
          ),
        ),
      ],
    );
  }
}

class _PlayerRow extends StatelessWidget {
  const _PlayerRow({required this.player, required this.showDivider});

  final Player player;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final theme = context.scoresTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
      decoration: BoxDecoration(
        border: showDivider ? Border(bottom: BorderSide(color: theme.divider)) : null,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 22,
            child: Text(
              '${player.number}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: theme.palette.fontExpanded,
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: theme.palette.n300,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Text(
            player.name,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: theme.palette.night),
          ),
        ],
      ),
    );
  }
}
