import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:match_detail_presentation/src/providers_di.br.dart';
import 'package:match_detail_presentation/src/theme/match_detail_theme.br.dart';
import 'package:scores_domain/scores_domain.dart';
import 'package:tactics_components/tactics_components.dart';

/// Une ligne de timeline : minute, marqueur du type d'évènement, joueur.
/// L'évènement de l'équipe à l'extérieur est aligné à droite.
class MatchEventTile extends ConsumerWidget {
  final MatchEvent event;

  const MatchEventTile({required this.event, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(matchDetailThemeProvider.select((theme) => theme.tabsTheme));

    final cells = [
      SizedBox(
        width: 34,
        child: Text('${event.minute}’', style: theme.minuteTextStyle, textAlign: TextAlign.center),
      ),
      _EventMarker(color: _colorFor(event.type, theme), isGoal: event.isGoal),
      const SizedBox(width: TacticsSpacing.spacing200),
      Expanded(
        child: Column(
          crossAxisAlignment: event.isHome ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Text(event.player, style: theme.playerTextStyle),
            if (event.detail case final detail?) Text(detail, style: theme.minuteTextStyle),
          ],
        ),
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TacticsSpacing.spacing300, vertical: TacticsSpacing.spacing200),
      child: Row(children: event.isHome ? cells : cells.reversed.toList()),
    );
  }
}

Color _colorFor(MatchEventType type, MatchDetailTabsTheme theme) => switch (type) {
  MatchEventType.goal => theme.goalColor,
  MatchEventType.redCard => theme.redCardColor,
  MatchEventType.yellowCard => theme.yellowCardColor,
};

class _EventMarker extends StatelessWidget {
  final Color color;
  final bool isGoal;

  const _EventMarker({required this.color, required this.isGoal});

  @override
  Widget build(BuildContext context) => Container(
    width: isGoal ? 10 : 8,
    height: isGoal ? 10 : 11,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(isGoal ? TacticsRadius.pill : 2),
    ),
  );
}
