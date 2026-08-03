import 'package:{{name.snakeCase()}}/src/providers_di.br.dart';
import 'package:{{name.snakeCase()}}/src/routing/{{classname.snakeCase()}}_routing.dart';
import 'package:{{name.snakeCase()}}/src/theme/{{classname.snakeCase()}}_theme.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Le routing est requis — son contrat throw jusqu'à ce qu'on le fournisse. Le thème
// est optionnel : sans lui la feature s'affiche avec son thème par défaut interne.
List<Override> bindProviders({
  required {{classname.pascalCase()}}Routing Function(Ref ref) routing,
  ProviderListenable<{{classname.pascalCase()}}Theme>? theme,
}) => [
  {{classname.camelCase()}}RoutingProvider.overrideWith(routing),
  if (theme != null) {{classname.camelCase()}}ThemeProvider.overrideWith((ref) => ref.watch(theme)),
];
