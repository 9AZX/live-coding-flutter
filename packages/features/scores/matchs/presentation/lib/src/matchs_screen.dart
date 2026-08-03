import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matchs_presentation/src/l10n/matchs_strings.dart';
import 'package:matchs_presentation/src/notifiers/scores_filter_notifier.br.dart';
import 'package:matchs_presentation/src/notifiers/selected_day_notifier.br.dart';
import 'package:matchs_presentation/src/providers_di.br.dart';
import 'package:matchs_presentation/src/widgets/empty_state.dart';
import 'package:matchs_presentation/src/widgets/filter_chips.dart';
import 'package:matchs_presentation/src/widgets/match_groups_view.dart';
import 'package:matchs_presentation/src/widgets/scores_header.dart';
import 'package:scores_domain/scores_domain.dart';
import 'package:tactics_components/tactics_components.dart';

const _dayLabels = {
  MatchDay.tomorrow: MatchsStrings.dayTomorrow,
  MatchDay.today: MatchsStrings.dayToday,
  MatchDay.yesterday: MatchsStrings.dayYesterday,
};

/// Écran Matchs : feed des scores foot groupé par compétition.
class MatchsScreen extends ConsumerWidget {
  const MatchsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(scoresFilterProvider);
    final day = ref.watch(selectedDayProvider);
    final groups = ref.watch(matchGroupsProvider(filter, day));

    return Column(
      children: [
        const ScoresHeader(title: MatchsStrings.headerTitle, bottom: _DayTabs()),
        Expanded(
          child: groups.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            // L'échec est un `ScoresError` du domaine : il se traduit en copie
            // utilisateur, jamais en `toString()` d'un type interne.
            error: (_, __) => const EmptyState(
              icon: Icons.cloud_off,
              subtitle: MatchsStrings.unavailableFeedSubtitle,
              title: MatchsStrings.unavailableFeedTitle,
            ),
            data: (groups) => groups.isEmpty
                ? const EmptyState(
                    icon: Icons.sports_soccer,
                    subtitle: MatchsStrings.emptyFeedSubtitle,
                    title: MatchsStrings.emptyFeedTitle,
                  )
                : MatchGroupsView(groups: groups, leading: const FilterChips()),
          ),
        ),
      ],
    );
  }
}

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
              active: day == selected,
              label: _dayLabels[day]!,
              onTap: () => ref.read(selectedDayProvider.notifier).select(day),
            ),
          ),
          if (day != MatchDay.values.last) const SizedBox(width: TacticsSpacing.spacing200),
        ],
      ],
    );
  }
}

class _DayTab extends ConsumerWidget {
  final bool active;
  final String label;
  final VoidCallback onTap;

  const _DayTab({required this.active, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(matchsThemeProvider.select((theme) => theme.headerTheme));

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: active ? theme.dayTabSelectedColor : Colors.transparent,
          borderRadius: BorderRadius.circular(TacticsRadius.pill),
        ),
        child: Text(label, style: active ? theme.dayTabActiveTextStyle : theme.dayTabInactiveTextStyle),
      ),
    );
  }
}
