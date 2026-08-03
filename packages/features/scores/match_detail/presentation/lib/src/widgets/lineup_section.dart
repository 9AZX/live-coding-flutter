import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:match_detail_presentation/src/providers_di.br.dart';
import 'package:scores_domain/scores_domain.dart';
import 'package:tactics_components/tactics_components.dart';
import 'package:tactics_providers/tactics_providers.dart';

/// Composition d'une équipe : nom, formation, et le onze aligné.
class LineupSection extends ConsumerWidget {
  final Lineup lineup;

  const LineupSection({required this.lineup, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(matchDetailThemeProvider.select((theme) => theme.tabsTheme));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TacticsSpacing.spacing300, vertical: TacticsSpacing.spacing200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(lineup.team.name, style: theme.activeTabTextStyle),
              if (lineup.formation.isNotEmpty) ...[
                const SizedBox(width: TacticsSpacing.spacing200),
                Text(
                  lineup.formation,
                  style: theme.minuteTextStyle.copyWith(color: ref.watch(tacticsPaletteProvider).n500),
                ),
              ],
            ],
          ),
          const SizedBox(height: TacticsSpacing.spacing200),
          for (final player in lineup.players)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: TacticsSpacing.spacing100),
              child: Row(
                children: [
                  SizedBox(
                    width: 26,
                    child: Text('${player.number}', style: theme.minuteTextStyle),
                  ),
                  Text(player.name, style: theme.playerTextStyle),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
