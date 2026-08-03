import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_presentation/src/l10n/live_strings.dart';
import 'package:live_presentation/src/providers_di.br.dart';
import 'package:scores_domain/scores_domain.dart';

/// Écran En direct : compose des widgets injectés (header, feed, état vide)
/// fournis par la feature Matchs — aucun import direct entre features.
class LiveScreen extends ConsumerWidget {
  const LiveScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backgroundColor = ref.watch(liveThemeProvider.select((theme) => theme.backgroundColor));
    final groups = ref.watch(matchGroupsProvider(MatchFilter.live, MatchDay.today));

    return ColoredBox(
      color: backgroundColor,
      child: Column(
        children: [
          ref.watch(liveHeaderFactoryProvider).create(LiveStrings.headerTitle),
          Expanded(
            child: groups.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (_, __) => ref.watch(liveEmptyStateFactoryProvider).create((
                icon: Icons.cloud_off,
                subtitle: LiveStrings.unavailableSubtitle,
                title: LiveStrings.unavailableTitle,
              )),
              data: (groups) => groups.isEmpty
                  ? ref.watch(liveEmptyStateFactoryProvider).create((
                      icon: Icons.sports_soccer,
                      subtitle: LiveStrings.emptySubtitle,
                      title: LiveStrings.emptyTitle,
                    ))
                  : ref.watch(liveFeedFactoryProvider).create(groups),
            ),
          ),
        ],
      ),
    );
  }
}
