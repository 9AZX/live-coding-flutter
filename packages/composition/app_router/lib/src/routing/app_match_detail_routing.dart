import 'package:app_router/src/app_router.br.dart';
import 'package:match_detail_presentation/match_detail_presentation.dart';

final class AppMatchDetailRouting implements MatchDetailRouting {
  final AppRouter _router;

  const AppMatchDetailRouting({required AppRouter router}) : _router = router;

  @override
  void onDismissMatchDetail() => _router.maybePop();
}
