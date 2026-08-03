import 'package:app_providers/app_providers.dart';
import 'package:app_router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fr_providers/fr_providers.dart';
import 'package:pl_providers/pl_providers.dart';
import 'package:riverpod/misc.dart';
import 'package:tactics_providers/tactics_providers.dart';

/// Marché à composer : `flutter run --dart-define=REGULATION=pl` pour la Pologne.
///
/// En production chaque marché a son propre app (`apps/betclic_fr`, `apps/betclic_pl`)
/// qui ne dépend que de son package de régulation. Ici un seul binaire embarque les
/// deux, pour pouvoir basculer en direct pendant l'exercice.
const regulation = String.fromEnvironment('REGULATION', defaultValue: 'fr');

List<Override> _regulationProviders() => switch (regulation) {
  'pl' => plProviders(),
  _ => frProviders(),
};

Widget buildApplication() => ProviderScope(
  overrides: appProviders(regulation: _regulationProviders()),
  child: const _AppWidget(),
);

class _AppWidget extends ConsumerWidget {
  const _AppWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = ref.watch(tacticsPaletteProvider);

    return MaterialApp.router(
      title: 'Foot Scores',
      debugShowCheckedModeBanner: false,
      routerConfig: ref.watch(appRouterProvider).config(),
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: palette.bgPage,
        fontFamily: palette.fontBrand,
      ),
    );
  }
}
