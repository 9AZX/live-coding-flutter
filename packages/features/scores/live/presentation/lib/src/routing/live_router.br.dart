import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_presentation/src/live_screen.dart';

part 'live_router.br.gr.dart';

enum LiveRoutePath {
  live(path: 'live');

  final String path;

  const LiveRoutePath({required this.path});
}

@AutoRouterConfig()
abstract class LiveRouter extends RootStackRouter {}

@RoutePage(name: 'LiveRoute')
class LivePage extends ConsumerWidget {
  const LivePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => const LiveScreen();
}
