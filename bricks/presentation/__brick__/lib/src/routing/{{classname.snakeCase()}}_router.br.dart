import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{name.snakeCase()}}/src/{{classname.snakeCase()}}_screen.dart';

part '{{classname.snakeCase()}}_router.br.gr.dart';

@AutoRouterConfig()
abstract class {{classname.pascalCase()}}Router extends RootStackRouter {}

@RoutePage(name: '{{classname.pascalCase()}}Route')
class {{classname.pascalCase()}}Page extends ConsumerWidget {
  const {{classname.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => const {{classname.pascalCase()}}Screen();
}
