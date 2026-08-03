import 'package:app_router/app_router.dart';
import 'package:favorites_data/favorites_data.dart' as favorites_data;
import 'package:favorites_presentation/favorites_presentation.dart' as favorites_presentation;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_presentation/live_presentation.dart' as live_presentation;
import 'package:matchs_data/matchs_data.dart' as matchs_data;
import 'package:matchs_presentation/matchs_presentation.dart';
import 'package:matchs_presentation/matchs_presentation.dart' as matchs_presentation;
import 'package:network_dio_data/network_dio_data.dart' as network_dio_data;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scores_domain/scores_domain.dart' show ScoresRepository;
import 'package:scores_domain/scores_domain.dart' as scores_domain;
import 'package:tactics_components/tactics_components.dart';
import 'package:tactics_providers/tactics_providers.dart' as tactics_providers;

/// La clé TheSportsDB fait partie de l'URL. La clé publique `123` suffit pour l'exo
/// (`--dart-define=THESPORTSDB_KEY=…` pour la remplacer), avec une limite assumée :
/// l'API tronque **chaque** réponse à 3 matchs. Le feed s'élargit donc en ajoutant des
/// ligues au catalogue du marché, pas en visant une ligue chargée.
const _theSportsDbKey = String.fromEnvironment('THESPORTSDB_KEY', defaultValue: '123');

const _scoresBaseUrl = 'https://www.thesportsdb.com/api/v1/json/$_theSportsDbKey';

/// Racine de composition : le seul endroit qui connaît toutes les features.
/// - réseau : l'implémentation Dio alimente le contrat `httpClientProvider`
/// - DSM : la palette concrète alimente le contrat `tacticsPaletteProvider`
/// - data : les repositories implémentent les contrats du domaine partagé
/// - presentation : ports de routing + widgets partagés injectés entre features
///
/// Le thème de chaque feature est optionnel : omis ici, chaque feature s'affiche
/// avec son thème par défaut interne dérivé de la palette.
///
/// [regulation] vient du package du marché (`fr_providers`, `pl_providers`) : c'est
/// lui qui décide des compétitions affichées et des features exposées. En prod,
/// chaque marché a son app ; ici un seul binaire choisit via `--dart-define`.
///
/// [scoresRepository] permet de substituer la source réseau (tests, mode démo
/// hors-ligne) : la couche data réelle n'est alors pas branchée du tout. Riverpod
/// interdit d'overrider deux fois le même provider, donc le choix se fait ici.
List<Override> appProviders({
  required List<Override> regulation,
  ProviderListenable<ScoresRepository>? scoresRepository,
}) => [
  ...network_dio_data.bindProviders(),
  ...tactics_providers.bindProviders(palette: Provider((_) => TacticsPalette.light())),
  if (scoresRepository case final scoresRepository?)
    ...scores_domain.bindProviders(scoresRepository: scoresRepository)
  else
    ...matchs_data.bindProviders(baseUrlProvider: Provider((_) => _scoresBaseUrl)),
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
  // Le marché en dernier : il alimente les contrats de régulation (catalogue de
  // compétitions, features optionnelles) laissés ouverts par les features.
  ...regulation,
];
