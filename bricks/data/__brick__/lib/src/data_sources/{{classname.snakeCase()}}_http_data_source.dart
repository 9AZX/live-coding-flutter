import 'package:{{domainPackage.snakeCase()}}/{{domainPackage.snakeCase()}}.dart';

/// Source unique : implémente directement le contrat du domaine, donc pas de
/// classe repository intermédiaire (règle A). Si la feature coordonne plusieurs
/// sources, ajouter un `{{classname.snakeCase()}}_repository_single_source.dart`.
final class {{classname.pascalCase()}}HttpDataSource implements {{classname.pascalCase()}}Repository {}
