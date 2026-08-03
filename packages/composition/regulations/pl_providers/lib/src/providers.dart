import 'package:matchs_data/matchs_data.dart' as matchs_data;
import 'package:matchs_presentation/matchs_presentation.dart' as matchs_presentation;
import 'package:pl_providers/src/pl_league_catalog.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

/// Ce que le marché polonais expose. Différence marquante avec `fr_providers` :
/// **pas de cotes**. `oddsFactory: null` suffit — aucun package `odds_*` n'est même
/// déclaré en dépendance, donc la feature n'entre pas dans le binaire.
///
/// C'est tout l'intérêt de l'inversion de dépendance : `matchs_presentation` n'a pas
/// changé d'une ligne entre les deux marchés.
List<Override> plProviders() => [
  ...matchs_data.bindRegulationProviders(
    countryByLeague: PlLeagueCatalog.countryByLeague,
    leagueIds: PlLeagueCatalog.leagueIds,
  ),
  ...matchs_presentation.bindRegulationProviders(oddsFactory: null),
  // WORKSHOP : répondre aussi pour l'écran détail (étape 7) — `null`, pas de cotes ici.
  // ...match_detail_presentation.bindRegulationProviders(oddsFactory: null),
];
