import 'package:favorites_data/src/data_sources/in_memory_favorites_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shouldly/shouldly.dart';

void main() {
  test('mettre un match en favori le fait apparaître dans la liste suivie', () async {
    final source = InMemoryFavoritesDataSource();
    final emissions = <Set<String>>[];
    final subscription = source.watchFavoriteMatchIds().listen(emissions.add);

    source.toggleMatch('m1');
    await Future<void>.delayed(Duration.zero);

    emissions.last.contains('m1').should.beTrue();
    await subscription.cancel();
  });

  test('retirer un match déjà en favori le fait disparaître de la liste suivie', () async {
    final source = InMemoryFavoritesDataSource();
    final emissions = <Set<String>>[];
    final subscription = source.watchFavoriteMatchIds().listen(emissions.add);

    source.toggleMatch('m3');
    await Future<void>.delayed(Duration.zero);

    emissions.last.contains('m3').should.beFalse();
    await subscription.cancel();
  });
}
