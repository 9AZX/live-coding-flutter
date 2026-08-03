import 'package:odds_presentation/src/providers_di.br.dart';
import 'package:odds_presentation/src/theme/odds_theme.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Cette feature n'a pas de navigation propre : seul son thème est surchargeable.
List<Override> bindProviders({ProviderListenable<OddsTheme>? theme}) => [
  if (theme != null) oddsThemeProvider.overrideWith((ref) => ref.watch(theme)),
];
