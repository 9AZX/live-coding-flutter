import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matchs_presentation/src/filter_chips.dart';
import 'package:matchs_presentation/src/scores_filter_notifier.dart';
import 'package:scores_domain/scores_domain.dart';
import 'package:scores_widgets/scores_widgets.dart';

/// Onglet Matchs : feed des scores foot groupé par compétition.
class MatchsPage extends ConsumerWidget {
  const MatchsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(scoresFilterProvider);
    final groups = ref.watch(watchMatchGroupsProvider(filter));

    return Column(
      children: [
        const ScoresHeader(title: 'Foot', bottom: _DayTabs()),
        Expanded(
          child: groups.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => Center(child: Text('$error')),
            data: (groups) => groups.isEmpty
                ? const EmptyState(
                    icon: Icons.sports_soccer,
                    title: 'Aucun match',
                    subtitle: 'Aucune rencontre pour ce filtre.',
                  )
                : MatchGroupsView(groups: groups, leading: const FilterChips()),
          ),
        ),
      ],
    );
  }
}

class _DayTabs extends StatelessWidget {
  const _DayTabs();

  // ponytail: onglets de jour visuels (la donnée mock est « aujourd'hui »).
  @override
  Widget build(BuildContext context) => Row(
    children: [
      const _DayTab(label: 'Hier', active: false),
      const SizedBox(width: 8),
      const _DayTab(label: "Aujourd'hui", active: true),
      const SizedBox(width: 8),
      const _DayTab(label: 'Demain', active: false),
    ].map((w) => Expanded(child: w)).toList(),
  );
}

class _DayTab extends StatelessWidget {
  const _DayTab({required this.label, required this.active});

  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final theme = context.scoresTheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: active ? theme.palette.white : Colors.transparent,
        borderRadius: BorderRadius.circular(theme.palette.rPill),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: active ? 13 : 12,
          fontWeight: active ? FontWeight.w800 : FontWeight.w600,
          color: active ? theme.palette.night : theme.palette.white55,
        ),
      ),
    );
  }
}
