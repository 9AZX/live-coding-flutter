import 'package:app_router/src/shell/scores_bottom_navigation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:favorites_presentation/favorites_presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_presentation/live_presentation.dart';
import 'package:matchs_presentation/matchs_presentation.dart';
import 'package:tactics_providers/tactics_providers.dart';

/// Shell de l'app : héberge les onglets et la barre de navigation. C'est de la
/// composition — la seule couche autorisée à connaître toutes les features.
@RoutePage(name: 'ScoresShellRoute')
class ScoresShellPage extends ConsumerWidget {
  const ScoresShellPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backgroundColor = ref.watch(tacticsPaletteProvider.select((palette) => palette.bgPage));

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: AutoTabsScaffold(
        backgroundColor: backgroundColor,
        routes: const [MatchsRoute(), LiveRoute(), FavoritesRoute()],
        bottomNavigationBuilder: (context, tabsRouter) => ScoresBottomNavigation(tabsRouter: tabsRouter),
      ),
    );
  }
}
