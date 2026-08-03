import 'package:riverpod_annotation/riverpod_annotation.dart';
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
GroupMatches groupMatches(Ref _) => const GroupMatches();

@riverpod
ToggleFavoriteMatch toggleFavoriteMatch(Ref ref) =>
    ToggleFavoriteMatch(repository: ref.watch(favoritesRepositoryProvider));

/// Ids des matchs favoris — partagé par toutes les features.
@riverpod
Stream<Set<String>> favoriteMatchIds(Ref ref) => ref.watch(favoritesRepositoryProvider).watchFavoriteMatchIds();

/// Flux des matchs d'un jour donné (une seule souscription par jour).
@riverpod
Stream<List<Match>> watchMatches(Ref ref, MatchDay day) => ref.watch(scoresRepositoryProvider).watchMatches(day);

/// Matchs filtrés et regroupés par compétition, dérivés de [watchMatches]
/// (pas de fetch supplémentaire). Utilisé par Matchs + En direct + les compteurs.
@riverpod
AsyncValue<List<MatchGroup>> watchMatchGroups(Ref ref, MatchFilter filter, MatchDay day) {
  final group = ref.watch(groupMatchesProvider);

  return ref.watch(watchMatchesProvider(day)).whenData((matches) => group(matches, filter));
}

// WORKSHOP : provider `watchMatch(id)` (écran détail) à reconstruire ici.
