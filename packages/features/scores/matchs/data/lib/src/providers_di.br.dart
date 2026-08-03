import 'package:exceptions/exceptions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers_di.br.g.dart';

// Contrats entrants alimentés par la couche de composition « regulations » : c'est
// le marché (FR, PL…) qui décide des compétitions affichées, pas la feature.
// Inversion de dépendance : `matchs_data` sait *comment* appeler l'API, jamais *quoi*.

/// Pays par ligue, pour l'affichage (l'endpoint events ne le renvoie pas toujours).
@riverpod
Map<int, String> countryByLeague(Ref _) {
  throw UnregisteredProviderException(countryByLeagueProvider);
}

/// Ids TheSportsDB des ligues du feed, dans l'ordre d'affichage des compétitions.
@riverpod
List<int> leagueIds(Ref _) {
  throw UnregisteredProviderException(leagueIdsProvider);
}
