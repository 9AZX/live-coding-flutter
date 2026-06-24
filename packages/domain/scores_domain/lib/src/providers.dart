import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scores_domain/src/behaviours/group_matches.dart';
import 'package:scores_domain/src/entities/match.dart';
import 'package:scores_domain/src/entities/match_day.dart';
import 'package:scores_domain/src/entities/match_filter.dart';
import 'package:scores_domain/src/entities/match_group.dart';
import 'package:scores_domain/src/providers_di.dart';

part 'providers.g.dart';

/// Flux des matchs d'un jour donné (une seule souscription par jour).
@riverpod
Stream<List<Match>> watchMatches(Ref ref, MatchDay day) => ref.watch(scoresRepositoryProvider).watchMatches(day);

/// Matchs filtrés et regroupés par compétition, dérivés de [watchMatches]
/// (pas de fetch supplémentaire). Utilisé par Matchs + En direct + les compteurs.
@riverpod
AsyncValue<List<MatchGroup>> watchMatchGroups(Ref ref, MatchFilter filter, MatchDay day) {
  const group = GroupMatches();

  return ref.watch(watchMatchesProvider(day)).whenData((matches) => group(matches, filter));
}

// WORKSHOP : provider `watchMatch(id)` (page détail) à reconstruire ici.

/// Ids des matchs favoris — partagé par toutes les features.
@riverpod
Stream<Set<String>> favoriteMatchIds(Ref ref) => ref.watch(favoritesRepositoryProvider).watchFavoriteMatchIds();
