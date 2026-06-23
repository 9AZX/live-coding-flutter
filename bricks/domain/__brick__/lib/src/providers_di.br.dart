import 'package:exceptions/exceptions.dart';
import 'package:{{name.snakeCase()}}/{{name.snakeCase()}}.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers_di.br.g.dart';

@riverpod
{{classname.pascalCase()}}Repository {{classname.camelCase()}}Repository(Ref ref) {
  throw UnregisteredProviderException({{classname.camelCase()}}RepositoryProvider);
}
