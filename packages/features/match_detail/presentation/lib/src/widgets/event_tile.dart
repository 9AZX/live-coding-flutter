import 'package:flutter/material.dart';
import 'package:scores_domain/scores_domain.dart';
import 'package:scores_widgets/scores_widgets.dart';

/// Ligne de la timeline : minute · icône (but/carton) · joueur · équipe.
class EventTile extends StatelessWidget {
  const EventTile({required this.event, required this.match, required this.showDivider, super.key});

  final MatchEvent event;
  final Match match;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final theme = context.scoresTheme;
    final team = event.isHome ? match.home : match.away;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
      decoration: BoxDecoration(
        border: showDivider ? Border(bottom: BorderSide(color: theme.divider)) : null,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 30,
            child: Text(
              '${event.minute}’',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontFamily: theme.palette.fontExpanded,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: theme.palette.n400,
              ),
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 22,
            child: Center(child: _EventIcon(event: event)),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.player,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: theme.palette.night),
                ),
                if (event.detail case final detail?)
                  Text(
                    detail,
                    style: TextStyle(fontSize: 11, color: theme.palette.n300),
                  ),
              ],
            ),
          ),
          Text(
            team.shortName,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 11,
              color: Color(team.colorValue),
            ),
          ),
        ],
      ),
    );
  }
}

class _EventIcon extends StatelessWidget {
  const _EventIcon({required this.event});

  final MatchEvent event;

  @override
  Widget build(BuildContext context) {
    final theme = context.scoresTheme;

    return switch (event.type) {
      MatchEventType.goal => Icon(Icons.sports_soccer, size: 17, color: theme.palette.night),
      MatchEventType.yellowCard => _Card(color: theme.palette.yellow),
      MatchEventType.redCard => _Card(color: theme.palette.red),
    };
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    width: 11,
    height: 15,
    decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2)),
  );
}
