import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:match_detail_presentation/src/match_detail_screen.dart';

part 'match_detail_router.br.gr.dart';

/// Sous-chemins de cette feature, triés alphabétiquement. Les chemins de premier
/// niveau appartiennent au `RoutePath` de la composition.
enum MatchDetailRoutePath {
  matchDetail(path: '/match/:id');

  final String path;

  const MatchDetailRoutePath({required this.path});
}

@AutoRouterConfig()
abstract class MatchDetailRouter extends RootStackRouter {}

@RoutePage(name: 'MatchDetailRoute')
class MatchDetailPage extends ConsumerWidget {
  final String matchId;

  const MatchDetailPage({@PathParam('id') required this.matchId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => MatchDetailScreen(matchId: matchId);
}
