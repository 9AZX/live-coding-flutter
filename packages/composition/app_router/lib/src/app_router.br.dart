import 'package:app_router/src/shell/scores_shell_page.br.dart';
import 'package:auto_route/auto_route.dart';
import 'package:favorites_presentation/favorites_presentation.dart';
import 'package:live_presentation/live_presentation.dart';
import 'package:matchs_presentation/matchs_presentation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.br.g.dart';
part 'app_router.br.gr.dart';

/// Chemins de premier niveau. Les sous-chemins appartiennent aux enums
/// `{Feature}RoutePath` colocalisés dans chaque feature.
enum RoutePath {
  scores(path: '/');

  final String path;

  const RoutePath({required this.path});
}

@Riverpod(keepAlive: true)
AppRouter appRouter(Ref _) => AppRouter();

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      initial: true,
      page: ScoresShellRoute.page,
      path: RoutePath.scores.path,
      children: [
        AutoRoute(initial: true, page: MatchsRoute.page, path: MatchsRoutePath.matchs.path),
        AutoRoute(page: LiveRoute.page, path: LiveRoutePath.live.path),
        AutoRoute(page: FavoritesRoute.page, path: FavoritesRoutePath.favorites.path),
      ],
    ),
    // WORKSHOP : ajouter ici la route du détail, une fois la feature match_detail créée.
  ];
}
