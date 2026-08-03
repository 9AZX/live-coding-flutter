import 'package:fr_providers/src/fr_league_catalog.dart';
import 'package:matchs_data/matchs_data.dart' as matchs_data;
import 'package:matchs_presentation/matchs_presentation.dart' as matchs_presentation;
import 'package:odds_data/odds_data.dart' as odds_data;
import 'package:odds_presentation/odds_presentation.dart';
import 'package:odds_presentation/odds_presentation.dart' as odds_presentation;
import 'package:riverpod_annotation/riverpod_annotation.dart';

/// Ce que le marché français expose. Les features ignorent tout de ce fichier :
/// elles déclarent des contrats, la régulation décide — inversion de dépendance.
///
/// Ici, les **cotes** font partie de l'offre : la feature Cotes est branchée et sa
/// fabrique de widget est injectée dans les rangées de Matchs.
List<Override> frProviders() => [
  ...matchs_data.bindRegulationProviders(
    countryByLeague: FrLeagueCatalog.countryByLeague,
    leagueIds: FrLeagueCatalog.leagueIds,
  ),
  ...odds_data.bindProviders(),
  ...odds_presentation.bindProviders(),
  ...matchs_presentation.bindRegulationProviders(oddsFactory: const OddsBadgeWidgetFactory()),
];
