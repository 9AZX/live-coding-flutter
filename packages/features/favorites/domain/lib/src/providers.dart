import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scores_domain/scores_domain.dart';

part 'providers.g.dart';

/// Matchs favoris : croise les ids favoris (partagés) avec le flux des matchs.
/// Démontre une feature qui compose deux providers du common domain.
@riverpod
List<Match> favoriteMatches(Ref ref) {
  final ids = ref.watch(favoriteMatchIdsProvider).value ?? const <String>{};
  final matches = ref.watch(watchMatchesProvider).value ?? const <Match>[];

  return [
    for (final match in matches)
      if (ids.contains(match.id)) match,
  ];
}
