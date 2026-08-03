import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tactics_components/tactics_components.dart';
import 'package:tactics_providers/tactics_providers.dart';

const _tabs = [
  (asset: TacticsIcons.home, label: 'Matchs'),
  (asset: TacticsIcons.live, label: 'En direct'),
  (asset: TacticsIcons.starFull, label: 'Favoris'),
];

/// Barre de navigation du bas, pilotée par le `TabsRouter` d'AutoRoute.
class ScoresBottomNavigation extends ConsumerWidget {
  final TabsRouter tabsRouter;

  const ScoresBottomNavigation({required this.tabsRouter, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = ref.watch(tacticsPaletteProvider);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.white,
        border: Border(top: BorderSide(color: palette.divider)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(TacticsSpacing.spacing200),
          child: Row(
            children: [
              for (final (index, tab) in _tabs.indexed)
                Expanded(
                  child: _NavigationItem(
                    active: tabsRouter.activeIndex == index,
                    asset: tab.asset,
                    label: tab.label,
                    onTap: () => tabsRouter.setActiveIndex(index),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavigationItem extends ConsumerWidget {
  final bool active;
  final String asset;
  final String label;
  final VoidCallback onTap;

  const _NavigationItem({
    required this.active,
    required this.asset,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = ref.watch(tacticsPaletteProvider);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TacticsIcon(asset, active: active, size: 23),
          const SizedBox(height: TacticsSpacing.spacing100),
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
}
