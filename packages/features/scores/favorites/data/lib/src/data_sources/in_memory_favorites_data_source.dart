import 'dart:async';

import 'package:scores_domain/scores_domain.dart';

/// Favoris en mémoire : un `Set` mutable diffusé sur un flux broadcast, qui
/// réémet à chaque toggle. Source unique partagée par toutes les features.
final class InMemoryFavoritesDataSource implements FavoritesRepository {
  final Set<String> _ids = {'m3'};
  final StreamController<Set<String>> _controller = StreamController<Set<String>>.broadcast();

  @override
  void toggleMatch(String matchId) {
    if (!_ids.remove(matchId)) _ids.add(matchId);

    _controller.add({..._ids});
  }

  @override
  Stream<Set<String>> watchFavoriteMatchIds() async* {
    yield {..._ids};
    yield* _controller.stream;
  }
}
