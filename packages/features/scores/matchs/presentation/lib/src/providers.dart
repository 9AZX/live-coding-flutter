import 'package:matchs_presentation/src/providers_di.br.dart';
import 'package:matchs_presentation/src/routing/matchs_routing.dart';
import 'package:matchs_presentation/src/theme/matchs_theme.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Le routing est requis — son contrat throw jusqu'à ce qu'on le fournisse. Le thème
// est optionnel : sans lui la feature s'affiche avec son thème par défaut interne.
List<Override> bindProviders({
  required MatchsRouting Function(Ref ref) routing,
  ProviderListenable<MatchsTheme>? theme,
}) => [
  matchsRoutingProvider.overrideWith(routing),
  if (theme != null) matchsThemeProvider.overrideWith((ref) => ref.watch(theme)),
];
