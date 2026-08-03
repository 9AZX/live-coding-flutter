import 'package:app_router/src/app_router.br.dart';
import 'package:matchs_presentation/matchs_presentation.dart';

final class AppMatchsRouting implements MatchsRouting {
  // WORKSHOP : `_router` servira à pousser l'écran détail (voir onMatchDetailRequested).
  // ignore: unused_field
  final AppRouter _router;

  const AppMatchsRouting({required AppRouter router}) : _router = router;

  // WORKSHOP : brancher la navigation vers l'écran détail —
  // `_router.push(MatchDetailRoute(matchId: matchId))` une fois la feature créée.
  @override
  void onMatchDetailRequested(String matchId) {}
}
