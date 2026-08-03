import 'package:auto_route/auto_route.dart';
import 'package:favorites_presentation/src/favorites_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'favorites_router.br.gr.dart';

enum FavoritesRoutePath {
  favorites(path: 'favorites');

  final String path;

  const FavoritesRoutePath({required this.path});
}

@AutoRouterConfig()
abstract class FavoritesRouter extends RootStackRouter {}

@RoutePage(name: 'FavoritesRoute')
class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => const FavoritesScreen();
}
