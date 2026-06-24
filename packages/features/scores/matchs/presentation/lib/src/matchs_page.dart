import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matchs_presentation/src/filter_chips.dart';
import 'package:matchs_presentation/src/scores_filter_notifier.dart';
import 'package:matchs_presentation/src/selected_day_notifier.dart';
import 'package:scores_domain/scores_domain.dart';
import 'package:scores_widgets/scores_widgets.dart';

/// Onglet Matchs : feed des scores foot groupé par compétition.
class MatchsPage extends ConsumerWidget {
  const MatchsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(scoresFilterProvider);
    final day = ref.watch(selectedDayProvider);
    final groups = ref.watch(watchMatchGroupsProvider(filter, day));

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

const _dayLabels = {
  MatchDay.yesterday: 'Hier',
  MatchDay.today: "Aujourd'hui",
  MatchDay.tomorrow: 'Demain',
};

class _DayTabs extends ConsumerWidget {
  const _DayTabs();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedDayProvider);

    return Row(
      children: [
        for (final day in MatchDay.values) ...[
          Expanded(
            child: _DayTab(
              label: _dayLabels[day]!,
              active: day == selected,
              onTap: () => ref.read(selectedDayProvider.notifier).select(day),
            ),
          ),
          if (day != MatchDay.values.last) const SizedBox(width: 8),
        ],
      ],
    );
  }
}

class _DayTab extends StatelessWidget {
  const _DayTab({required this.label, required this.active, required this.onTap});

  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = context.scoresTheme;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
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
      ),
    );
  }
}
