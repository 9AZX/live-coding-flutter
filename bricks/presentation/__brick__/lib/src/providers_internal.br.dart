import 'package:{{name.snakeCase()}}/{{name.snakeCase()}}.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tactics_providers/tactics_providers.dart';

part 'providers_internal.br.g.dart';

@riverpod
{{classname.pascalCase()}}Theme default{{classname.pascalCase()}}Theme(Ref ref) {
  final palette = ref.watch(tacticsPaletteProvider);

  return {{classname.pascalCase()}}Theme(backgroundColor: palette.backgroundBase);
}
