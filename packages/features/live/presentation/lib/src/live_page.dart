import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scores_domain/scores_domain.dart';
import 'package:scores_widgets/scores_widgets.dart';

/// Onglet En direct : réutilise le même feed que Matchs, filtré sur les live.
class LivePage extends ConsumerWidget {
  const LivePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groups = ref.watch(watchMatchGroupsProvider(MatchFilter.live));

    return Column(
      children: [
        const ScoresHeader(title: 'En direct'),
        Expanded(
          child: groups.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => Center(child: Text('$error')),
            data: (groups) => groups.isEmpty
                ? const EmptyState(
                    icon: Icons.sports_soccer,
                    title: 'Aucun match en direct',
                    subtitle: "Revenez au coup d'envoi des prochaines rencontres.",
                  )
                : MatchGroupsView(groups: groups),
          ),
        ),
      ],
    );
  }
}
