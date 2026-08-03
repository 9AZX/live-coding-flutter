import 'package:match_detail_presentation/src/providers_di.br.dart';
import 'package:match_detail_presentation/src/routing/match_detail_routing.dart';
import 'package:match_detail_presentation/src/theme/match_detail_theme.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scores_domain/scores_domain.dart';
import 'package:widget_factory_presentation/widget_factory_presentation.dart';

// Le routing est requis — son contrat throw jusqu'à ce qu'on le fournisse. Le thème
// est optionnel : sans lui la feature s'affiche avec son thème par défaut interne.
List<Override> bindProviders({
  required MatchDetailRouting Function(Ref ref) routing,
  ProviderListenable<MatchDetailTheme>? theme,
}) => [
  matchDetailRoutingProvider.overrideWith(routing),
  if (theme != null) matchDetailThemeProvider.overrideWith((ref) => ref.watch(theme)),
];

/// Alimenté par le package de composition du marché (`fr_providers`, `pl_providers`).
List<Override> bindRegulationProviders({required WidgetFactory<Match>? oddsFactory}) => [
  matchDetailOddsFactoryProvider.overrideWithValue(oddsFactory),
];
