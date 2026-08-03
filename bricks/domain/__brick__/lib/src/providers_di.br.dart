import 'package:exceptions/exceptions.dart';
import 'package:{{name.snakeCase()}}/src/repositories/{{classname.snakeCase()}}_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers_di.br.g.dart';

// Contrats entrants : throw jusqu'à ce que la composition les fournisse.
// Ce fichier n'est jamais exporté par le barrel du package.
@riverpod
{{classname.pascalCase()}}Repository {{classname.camelCase()}}Repository(Ref ref) {
  throw UnregisteredProviderException({{classname.camelCase()}}RepositoryProvider);
}
