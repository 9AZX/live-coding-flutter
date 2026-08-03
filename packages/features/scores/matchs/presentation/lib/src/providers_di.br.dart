import 'package:exceptions/exceptions.dart';
import 'package:matchs_presentation/src/providers_internal.br.dart';
import 'package:matchs_presentation/src/routing/matchs_routing.dart';
import 'package:matchs_presentation/src/theme/matchs_theme.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scores_domain/scores_domain.dart';
import 'package:widget_factory_presentation/widget_factory_presentation.dart';

part 'providers_di.br.g.dart';

/// Feature optionnelle, exposée par certains marchés seulement : le contrat throw
/// jusqu'à ce que la composition réponde — une fabrique, ou `null` pour l'absence.
/// Matchs ignore totalement quelle feature s'affiche là.
@riverpod
WidgetFactory<Match>? matchOddsFactory(Ref _) {
  throw UnregisteredProviderException(matchOddsFactoryProvider);
}

@riverpod
MatchsRouting matchsRouting(Ref _) {
  throw UnregisteredProviderException(matchsRoutingProvider);
}

@riverpod
MatchsTheme matchsTheme(Ref ref) => ref.watch(defaultMatchsThemeProvider);
