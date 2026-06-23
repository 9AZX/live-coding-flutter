import 'package:tactics_components/tactics_components.dart';

const semantics = {{classname.pascalCase()}}Semantics._();

class {{classname.pascalCase()}}Semantics {
  const {{classname.pascalCase()}}Semantics._();

  SemanticsConfiguration get {{classname.camelCase()}}Container => .container('{{classname.snakeCase()}}');
}
