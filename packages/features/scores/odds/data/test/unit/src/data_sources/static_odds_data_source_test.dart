import 'package:flutter_test/flutter_test.dart';
import 'package:odds_data/src/data_sources/static_odds_data_source.dart';
import 'package:shouldly/shouldly.dart';

void main() {
  const source = StaticOddsDataSource();

  test('les cotes d’un même match ne changent pas d’un affichage à l’autre', () {
    final first = source.oddsForMatch('2054321');
    final second = source.oddsForMatch('2054321');

    expect(first, isNotNull);
    expect(first, second);
  });

  test('les cotes proposées sont toujours des cotes décimales jouables', () {
    for (final id in ['1', '42', '2054321', '999999']) {
      final odds = source.oddsForMatch(id);
      if (odds == null) continue;

      odds.home.should.beGreaterOrEqualThan(1.2);
      odds.draw.should.beGreaterOrEqualThan(1.2);
      odds.away.should.beGreaterOrEqualThan(1.2);
    }
  });

  test('certaines rencontres n’ont pas de marché ouvert', () {
    final closed = [
      for (var i = 0; i < 40; i++) source.oddsForMatch('$i'),
    ].where((odds) => odds == null);

    closed.isNotEmpty.should.beTrue();
  });
}
