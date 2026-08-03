import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matchs_presentation/src/matchs_screen.dart';

part 'matchs_router.br.gr.dart';

enum MatchsRoutePath {
  matchs(path: 'matchs');

  final String path;

  const MatchsRoutePath({required this.path});
}

@AutoRouterConfig()
abstract class MatchsRouter extends RootStackRouter {}

@RoutePage(name: 'MatchsRoute')
class MatchsPage extends ConsumerWidget {
  const MatchsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => const MatchsScreen();
}
