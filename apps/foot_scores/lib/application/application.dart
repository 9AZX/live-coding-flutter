import 'package:app_providers/app_providers.dart';
import 'package:app_router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tactics_providers/tactics_providers.dart';

Widget buildApplication() => ProviderScope(overrides: appProviders(), child: const _AppWidget());

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
