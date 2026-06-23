import 'package:{{name.snakeCase()}}/src/providers_internal.br.dart';
import 'package:{{domainPackage.snakeCase()}}/{{domainPackage.snakeCase()}}.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

List<Override> bindProviders() => [
  {{classname.camelCase()}}RepositoryProvider.overrideWith(
    (ref) => ref.watch({{classname.camelCase()}}DataSourceProvider),
  ),
];
