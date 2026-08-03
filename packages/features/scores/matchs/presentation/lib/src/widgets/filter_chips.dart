import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matchs_presentation/src/l10n/matchs_strings.dart';
import 'package:matchs_presentation/src/notifiers/scores_filter_notifier.br.dart';
import 'package:matchs_presentation/src/notifiers/selected_day_notifier.br.dart';
import 'package:matchs_presentation/src/providers_di.br.dart';
import 'package:scores_domain/scores_domain.dart';
import 'package:tactics_components/tactics_components.dart';

const _labels = {
  MatchFilter.all: MatchsStrings.filterAll,
  MatchFilter.finished: MatchsStrings.filterFinished,
  MatchFilter.live: MatchsStrings.filterLive,
  MatchFilter.upcoming: MatchsStrings.filterUpcoming,
};

/// Barre de chips filtrant le feed. Les compteurs portent sur tous les matchs.
class FilterChips extends ConsumerWidget {
  const FilterChips({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(scoresFilterProvider);
    final day = ref.watch(selectedDayProvider);
    final counts = ref
        .watch(matchGroupsProvider(MatchFilter.all, day))
        .maybeWhen(data: _countByFilter, orElse: () => const <MatchFilter, int>{});

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.fromLTRB(TacticsSpacing.spacing400, 14, TacticsSpacing.spacing400, 2),
      child: Row(
        children: [
          for (final filter in MatchFilter.values) ...[
            _Chip(
              label: '${_labels[filter]} ${counts[filter] ?? 0}',
              selected: filter == selected,
              onTap: () => ref.read(scoresFilterProvider.notifier).select(filter),
            ),
            if (filter != MatchFilter.values.last) const SizedBox(width: TacticsSpacing.spacing200),
          ],
        ],
      ),
    );
  }

  static Map<MatchFilter, int> _countByFilter(List<MatchGroup> groups) {
    final matches = groups.expand((group) => group.matches).toList();

    return {
      for (final filter in MatchFilter.values) filter: matches.where((match) => match.matches(filter)).length,
    };
  }
}

class _Chip extends ConsumerWidget {
  final String label;
  final VoidCallback onTap;
  final bool selected;

  const _Chip({required this.label, required this.onTap, required this.selected});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(matchsThemeProvider.select((theme) => theme.chipTheme));

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: selected ? theme.selectedColor : theme.unselectedColor,
          borderRadius: BorderRadius.circular(TacticsRadius.pill),
          border: Border.all(color: selected ? theme.selectedColor : theme.borderColor),
        ),
        child: Text(label, style: selected ? theme.selectedTextStyle : theme.textStyle),
      ),
    );
  }
}
