import 'package:riverpod_annotation/riverpod_annotation.dart';

/// Overrides à appliquer dans la composition : branche les interfaces du domaine
/// sur les sources de données de cette feature.
List<Override> bind{{classname.pascalCase()}}Providers() => [
  // TODO: <repo>Provider.overrideWithValue(<DataSource>()),
];
