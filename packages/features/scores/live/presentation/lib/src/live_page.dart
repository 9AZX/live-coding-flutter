import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_presentation/src/providers_di.dart';
import 'package:scores_domain/scores_domain.dart';

/// Onglet En direct : compose des widgets injectés (header, feed, état vide)
/// fournis par la feature Matchs — aucun import direct entre features.
class LivePage extends ConsumerWidget {
  const LivePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groups = ref.watch(watchMatchGroupsProvider(MatchFilter.live, MatchDay.today));

    return Column(
      children: [
        ref.watch(liveHeaderFactoryProvider).create('En direct'),
        Expanded(
          child: groups.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => Center(child: Text('$error')),
            data: (groups) => groups.isEmpty
                ? ref.watch(liveEmptyStateFactoryProvider).create((
                    icon: Icons.sports_soccer,
                    title: 'Aucun match en direct',
                    subtitle: "Revenez au coup d'envoi des prochaines rencontres.",
                  ))
                : ref.watch(liveFeedFactoryProvider).create(groups),
          ),
        ),
      ],
    );
  }
}
