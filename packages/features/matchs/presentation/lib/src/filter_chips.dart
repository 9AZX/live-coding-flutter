import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matchs_presentation/src/scores_filter_notifier.dart';
import 'package:scores_domain/scores_domain.dart';
import 'package:scores_widgets/scores_widgets.dart';

const _labels = {
  MatchFilter.all: 'Tous',
  MatchFilter.live: 'En direct',
  MatchFilter.upcoming: 'À venir',
  MatchFilter.finished: 'Terminés',
};

/// Barre de chips filtrant le feed. Les compteurs portent sur tous les matchs.
class FilterChips extends ConsumerWidget {
  const FilterChips({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(scoresFilterProvider);
    final counts = ref
        .watch(watchMatchGroupsProvider(MatchFilter.all))
        .maybeWhen(
          data: _countByFilter,
          orElse: () => const <MatchFilter, int>{},
        );

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 2),
      child: Row(
        children: [
          for (final filter in MatchFilter.values) ...[
            _Chip(
              label: '${_labels[filter]} ${counts[filter] ?? 0}',
              selected: filter == selected,
              onTap: () => ref.read(scoresFilterProvider.notifier).select(filter),
            ),
            if (filter != MatchFilter.values.last) const SizedBox(width: 8),
          ],
        ],
      ),
    );
  }

  static Map<MatchFilter, int> _countByFilter(List<MatchGroup> groups) {
    final matches = groups.expand((g) => g.matches);

    return {
      MatchFilter.all: matches.length,
      MatchFilter.live: matches.where((m) => m.isLive).length,
      MatchFilter.upcoming: matches.where((m) => m.isUpcoming).length,
      MatchFilter.finished: matches.where((m) => m.isFinished).length,
    };
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = context.scoresTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: selected ? theme.palette.night : theme.palette.white,
          borderRadius: BorderRadius.circular(theme.palette.rPill),
          border: Border.all(color: selected ? theme.palette.night : theme.palette.n100),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: selected ? theme.palette.white : theme.palette.n500,
          ),
        ),
      ),
    );
  }
}
