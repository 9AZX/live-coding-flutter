import 'package:flutter_test/flutter_test.dart';
import 'package:givn/givn.dart';
import 'package:odds_domain/odds_domain.dart';
import 'package:shouldly/shouldly.dart';

void main() {
  group('Favori des bookmakers', () {
    given(
          'une rencontre où l’équipe à domicile est la mieux cotée',
          (context) => const Odds(away: 4.5, draw: 3.4, home: 1.8),
        )
        .when('l’utilisateur consulte les cotes', (sut, context) => const FavouriteOutcome()(sut))
        .then('le favori devrait être l’équipe à domicile', (result, context) => result.should.be(MatchOutcome.home));

    given(
          'une rencontre où l’équipe à l’extérieur est la mieux cotée',
          (context) => const Odds(away: 1.6, draw: 3.9, home: 5.2),
        )
        .when('l’utilisateur consulte les cotes', (sut, context) => const FavouriteOutcome()(sut))
        .then(
          'le favori devrait être l’équipe à l’extérieur',
          (result, context) => result.should.be(MatchOutcome.away),
        );

    given('une rencontre aux cotes équilibrées', (context) => const Odds(away: 2.5, draw: 2.5, home: 2.5))
        .when('l’utilisateur consulte les cotes', (sut, context) => const FavouriteOutcome()(sut))
        .then('aucune équipe ne devrait être favorite', (result, context) => result.should.be(MatchOutcome.draw));
  });
}
