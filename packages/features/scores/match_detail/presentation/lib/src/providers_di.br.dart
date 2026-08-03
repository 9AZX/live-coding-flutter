import 'package:exceptions/exceptions.dart';
import 'package:match_detail_presentation/src/providers_internal.br.dart';
import 'package:match_detail_presentation/src/routing/match_detail_routing.dart';
import 'package:match_detail_presentation/src/theme/match_detail_theme.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scores_domain/scores_domain.dart';
import 'package:widget_factory_presentation/widget_factory_presentation.dart';

part 'providers_di.br.g.dart';

@riverpod
MatchDetailRouting matchDetailRouting(Ref _) {
  throw UnregisteredProviderException(matchDetailRoutingProvider);
}

@riverpod
MatchDetailTheme matchDetailTheme(Ref ref) => ref.watch(defaultMatchDetailThemeProvider);

/// Contrat de régulation : l'écran déclare « quelqu'un peut me donner un widget de
/// cotes ». Nullable, mais il `throw` quand même — chaque marché doit répondre
/// explicitement oui (une fabrique) ou non (`null`).
@riverpod
WidgetFactory<Match>? matchDetailOddsFactory(Ref _) {
  throw UnregisteredProviderException(matchDetailOddsFactoryProvider);
}
