import 'package:flutter_test/flutter_test.dart';
import 'package:givn/givn.dart';
import 'package:scores_domain/scores_domain.dart';
import 'package:shouldly/shouldly.dart';

Competition _competition(String id) => Competition(colorValue: 0, country: 'Monde', id: id, name: 'Ligue $id');

Team _team(String id) => Team(colorValue: 0, id: id, name: 'Équipe $id', shortName: id);

Match _match(String id, {required String competitionId, MatchStatus status = MatchStatus.upcoming}) => Match(
  away: _team('b'),
  awayScore: 0,
  competition: _competition(competitionId),
  home: _team('a'),
  homeScore: 0,
  id: id,
  kickoff: '20:45',
  status: status,
);

void main() {
  group('Regroupement du feed des matchs', () {
    given(
      'des matchs de deux compétitions différentes',
      (context) => [
        _match('1', competitionId: 'ligue1'),
        _match('2', competitionId: 'liga'),
        _match('3', competitionId: 'ligue1'),
      ],
    ).when('l’utilisateur consulte le feed complet', (sut, context) => const GroupMatches()(sut, MatchFilter.all)).then(
      'les matchs devraient être regroupés par compétition, dans leur ordre d’apparition',
      (result, context) {
        result.map((group) => group.competition.id).toList().should.be(['ligue1', 'liga']);
        result.first.matches.map((match) => match.id).toList().should.be(['1', '3']);
      },
    );

    given(
          'un feed mêlant matchs en direct et matchs à venir',
          (context) => [
            _match('1', competitionId: 'ligue1', status: MatchStatus.live),
            _match('2', competitionId: 'ligue1'),
            _match('3', competitionId: 'liga', status: MatchStatus.finished),
          ],
        )
        .when(
          'l’utilisateur filtre sur les matchs en direct',
          (sut, context) => const GroupMatches()(sut, MatchFilter.live),
        )
        .then('seule la compétition qui a un match en direct devrait rester', (result, context) {
          result.length.should.be(1);
          result.single.matches.map((match) => match.id).toList().should.be(['1']);
        });

    given('un feed vide', (context) => <Match>[])
        .when('l’utilisateur consulte le feed', (sut, context) => const GroupMatches()(sut, MatchFilter.all))
        .then('aucun groupe ne devrait être produit', (result, context) => result.should.beEmpty());
  });
}
