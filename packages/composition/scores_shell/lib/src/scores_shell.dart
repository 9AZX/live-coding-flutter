import 'package:favorites_presentation/favorites_presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_presentation/live_presentation.dart';
import 'package:matchs_presentation/matchs_presentation.dart';
import 'package:scores_shell/src/selected_tab_notifier.dart';
import 'package:scores_widgets/scores_widgets.dart';
import 'package:tactics_theme/tactics_theme.dart';

/// Shell de l'app : héberge les 3 features en onglets + barre de navigation.
/// C'est la composition qui assemble les features, pas une feature elle-même.
class ScoresShell extends ConsumerWidget {
  const ScoresShell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.scoresTheme;
    final tab = ref.watch(selectedTabProvider);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: theme.palette.bgPage,
        body: Column(
          children: [
            Expanded(
              child: IndexedStack(
                index: tab.index,
                children: const [MatchsPage(), LivePage(), FavoritesPage()],
              ),
            ),
            const _BottomNav(),
          ],
        ),
      ),
    );
  }
}

class _BottomNav extends ConsumerWidget {
  const _BottomNav();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.scoresTheme;
    final current = ref.watch(selectedTabProvider);

    void select(ScoresTab tab) => ref.read(selectedTabProvider.notifier).select(tab);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme.palette.white,
        border: Border(top: BorderSide(color: theme.divider)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              _NavItem(
                asset: theme.palette.iconHome,
                label: 'Matchs',
                active: current == ScoresTab.matchs,
                onTap: () => select(ScoresTab.matchs),
              ),
              _NavItem(
                asset: theme.palette.iconLive,
                label: 'En direct',
                active: current == ScoresTab.direct,
                onTap: () => select(ScoresTab.direct),
              ),
              _NavItem(
                asset: theme.palette.iconStarFull,
                label: 'Favoris',
                active: current == ScoresTab.favoris,
                onTap: () => select(ScoresTab.favoris),
              ),
            ].map((w) => Expanded(child: w)).toList(),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({required this.asset, required this.label, required this.active, required this.onTap});

  final String asset;
  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = context.scoresTheme;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TacticsIcon(asset, size: 23, active: active),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10.5,
              fontWeight: FontWeight.w700,
              color: active ? theme.palette.red : theme.palette.n300,
            ),
          ),
        ],
      ),
    );
  }
}
