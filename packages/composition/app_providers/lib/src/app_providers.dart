import 'package:app_router/app_router.dart';
import 'package:favorites_data/favorites_data.dart' as favorites_data;
import 'package:favorites_presentation/favorites_presentation.dart' as favorites_presentation;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_presentation/live_presentation.dart' as live_presentation;
import 'package:matchs_data/matchs_data.dart' as matchs_data;
import 'package:matchs_presentation/matchs_presentation.dart';
import 'package:matchs_presentation/matchs_presentation.dart' as matchs_presentation;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scores_domain/scores_domain.dart' show ScoresRepository;
import 'package:scores_domain/scores_domain.dart' as scores_domain;
import 'package:tactics_components/tactics_components.dart';
import 'package:tactics_providers/tactics_providers.dart' as tactics_providers;

/// Racine de composition : le seul endroit qui connaît toutes les features.
/// - DSM : la palette concrète alimente le contrat `tacticsPaletteProvider`
/// - data : les repositories implémentent les contrats du domaine partagé
/// - presentation : ports de routing + widgets partagés injectés entre features
///
/// Le thème de chaque feature est optionnel : omis ici, chaque feature s'affiche
/// avec son thème par défaut interne dérivé de la palette.
///
/// [scoresRepository] permet de substituer la source réseau (tests, mode démo
/// hors-ligne) : la couche data réelle n'est alors pas branchée du tout. Riverpod
/// interdit d'overrider deux fois le même provider, donc le choix se fait ici.
List<Override> appProviders({ProviderListenable<ScoresRepository>? scoresRepository}) => [
  ...tactics_providers.bindProviders(palette: Provider((_) => TacticsPalette.light())),
  if (scoresRepository case final scoresRepository?)
    ...scores_domain.bindProviders(scoresRepository: scoresRepository)
  else
    ...matchs_data.bindProviders(),
  ...favorites_data.bindProviders(),
  ...matchs_presentation.bindProviders(
    routing: (ref) => AppMatchsRouting(router: ref.watch(appRouterProvider)),
  ),
  ...live_presentation.bindProviders(
    emptyStateFactory: const EmptyStateWidgetFactory(),
    feedFactory: const MatchGroupsViewWidgetFactory(),
    headerFactory: const ScoresHeaderWidgetFactory(),
  ),
  ...favorites_presentation.bindProviders(
    emptyStateFactory: const EmptyStateWidgetFactory(),
    headerFactory: const ScoresHeaderWidgetFactory(),
    listFactory: const FavoritesListWidgetFactory(),
  ),
];
