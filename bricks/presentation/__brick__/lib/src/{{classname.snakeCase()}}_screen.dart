import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{domainPackage.snakeCase()}}/{{domainPackage.snakeCase()}}.dart';

class {{classname.pascalCase()}}Screen extends ConsumerWidget {
  const {{classname.pascalCase()}}Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(dummy{{domainPackage.pascalCase()}}Provider);
    return const Placeholder();
  }
}
