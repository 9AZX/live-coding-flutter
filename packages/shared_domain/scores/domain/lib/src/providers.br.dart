import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scores_domain/src/behaviors/fetch_matches.dart';
import 'package:scores_domain/src/behaviors/group_matches.dart';
import 'package:scores_domain/src/behaviors/toggle_favorite_match.dart';
import 'package:scores_domain/src/entities/match.br.dart';
import 'package:scores_domain/src/entities/match_day.dart';
import 'package:scores_domain/src/entities/match_filter.dart';
import 'package:scores_domain/src/entities/match_group.br.dart';
import 'package:scores_domain/src/providers_di.br.dart';
import 'package:scores_domain/src/repositories/favorites_repository.dart';
import 'package:scores_domain/src/repositories/scores_repository.dart';

part 'providers.br.g.dart';

/// Les deux contrats sont optionnels : chaque couche data ne fournit que le sien
/// (matchs_data → scores, favorites_data → favoris).
List<Override> bindProviders({
  ProviderListenable<FavoritesRepository>? favoritesRepository,
  ProviderListenable<ScoresRepository>? scoresRepository,
}) => [
  if (favoritesRepository case final favoritesRepository?)
    favoritesRepositoryProvider.overrideWith((ref) => ref.watch(favoritesRepository)),
  if (scoresRepository case final scoresRepository?)
    scoresRepositoryProvider.overrideWith((ref) => ref.watch(scoresRepository)),
];

@riverpod
FetchMatches fetchMatches(Ref ref) => FetchMatches(repository: ref.watch(scoresRepositoryProvider));

@riverpod
GroupMatches groupMatches(Ref _) => const GroupMatches();

@riverpod
ToggleFavoriteMatch toggleFavoriteMatch(Ref ref) =>
    ToggleFavoriteMatch(repository: ref.watch(favoritesRepositoryProvider));

/// Ids des matchs favoris — partagé par toutes les features.
@riverpod
Stream<Set<String>> favoriteMatchIds(Ref ref) => ref.watch(favoritesRepositoryProvider).watchFavoriteMatchIds();

/// Matchs d'un jour donné (un seul appel par jour). `getOrThrow` reporte l'échec
/// du `Result` dans l'`AsyncValue` : la présentation lit un `AsyncError` typé.
@riverpod
Future<List<Match>> matches(Ref ref, MatchDay day) async =>
    (await ref.watch(fetchMatchesProvider).execute(day)).getOrThrow();

/// Matchs filtrés et regroupés par compétition, dérivés de [matches] (pas d'appel
/// supplémentaire). Utilisé par Matchs + En direct + les compteurs.
@riverpod
AsyncValue<List<MatchGroup>> matchGroups(Ref ref, MatchFilter filter, MatchDay day) {
  final group = ref.watch(groupMatchesProvider);

  return ref.watch(matchesProvider(day)).whenData((matches) => group(matches, filter));
}

// WORKSHOP : behavior `FetchMatch` + provider `match(id)` (écran détail) à
// reconstruire ici, sur le modèle de `fetchMatches` / `matches`.
