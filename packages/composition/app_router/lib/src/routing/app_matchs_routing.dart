import 'package:app_router/src/app_router.br.dart';
import 'package:match_detail_presentation/match_detail_presentation.dart';
import 'package:matchs_presentation/matchs_presentation.dart';

final class AppMatchsRouting implements MatchsRouting {
  final AppRouter _router;

  const AppMatchsRouting({required AppRouter router}) : _router = router;

  @override
  void onMatchDetailRequested(String matchId) => _router.push(MatchDetailRoute(matchId: matchId));
}
