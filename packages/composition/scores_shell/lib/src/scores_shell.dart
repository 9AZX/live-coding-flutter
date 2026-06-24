import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scores_shell/src/providers_di.dart';
import 'package:scores_shell/src/selected_tab_notifier.dart';
import 'package:tactics_theme/tactics_theme.dart';

const _divider = Color(0xFFF1F2F4);

/// Shell de l'app : héberge les onglets (injectés par WidgetFactory) + la barre
/// de navigation. C'est de la composition : il ne dépend d'aucune feature.
class ScoresShell extends ConsumerWidget {
  const ScoresShell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = ref.watch(tacticsPaletteProvider);
    final tab = ref.watch(selectedTabProvider);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: palette.bgPage,
        body: Column(
          children: [
            Expanded(
              child: IndexedStack(
                index: tab.index,
                children: [
                  ref.watch(matchsTabProvider).create(null),
                  ref.watch(directTabProvider).create(null),
                  ref.watch(favoritesTabProvider).create(null),
                ],
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
    final palette = ref.watch(tacticsPaletteProvider);
    final current = ref.watch(selectedTabProvider);

    void select(ScoresTab tab) => ref.read(selectedTabProvider.notifier).select(tab);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.white,
        border: const Border(top: BorderSide(color: _divider)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              _NavItem(
                palette: palette,
                asset: palette.iconHome,
                label: 'Matchs',
                active: current == ScoresTab.matchs,
                onTap: () => select(ScoresTab.matchs),
              ),
              _NavItem(
                palette: palette,
                asset: palette.iconLive,
                label: 'En direct',
                active: current == ScoresTab.direct,
                onTap: () => select(ScoresTab.direct),
              ),
              _NavItem(
                palette: palette,
                asset: palette.iconStarFull,
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
  const _NavItem({
    required this.palette,
    required this.asset,
    required this.label,
    required this.active,
    required this.onTap,
  });

  final TacticsPalette palette;
  final String asset;
  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
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
            color: active ? palette.red : palette.n300,
          ),
        ),
      ],
    ),
  );
}
