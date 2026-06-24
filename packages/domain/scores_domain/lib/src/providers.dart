import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scores_domain/src/behaviours/group_matches.dart';
import 'package:scores_domain/src/entities/match.dart';
import 'package:scores_domain/src/entities/match_filter.dart';
import 'package:scores_domain/src/entities/match_group.dart';
import 'package:scores_domain/src/providers_di.dart';

part 'providers.g.dart';

/// Flux brut de tous les matchs.
@riverpod
Stream<List<Match>> watchMatches(Ref ref) => ref.watch(scoresRepositoryProvider).watchMatches();

/// Matchs filtrés et regroupés par compétition (Matchs + En direct).
@riverpod
Stream<List<MatchGroup>> watchMatchGroups(Ref ref, MatchFilter filter) {
  const group = GroupMatches();

  return ref.watch(scoresRepositoryProvider).watchMatches().map((matches) => group(matches, filter));
}

/// Flux d'un match précis (page détail).
@riverpod
Stream<Match?> watchMatch(Ref ref, String id) => ref.watch(scoresRepositoryProvider).watchMatch(id);

/// Ids des matchs favoris — partagé par toutes les features.
@riverpod
Stream<Set<String>> favoriteMatchIds(Ref ref) => ref.watch(favoritesRepositoryProvider).watchFavoriteMatchIds();
