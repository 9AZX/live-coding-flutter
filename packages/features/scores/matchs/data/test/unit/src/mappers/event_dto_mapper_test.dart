import 'package:flutter_test/flutter_test.dart';
import 'package:givn/givn.dart';
import 'package:matchs_data/src/dtos/event_dto.br.dart';
import 'package:matchs_data/src/mappers/event_dto_mapper.dart';
import 'package:shouldly/shouldly.dart';

void main() {
  group('Lecture du feed TheSportsDB', () {
    given(
      'un match dont l’arbitre a sifflé la fin',
      (context) => const EventDto(awayScore: '1', homeScore: '2', id: '1', status: 'Match Finished'),
    ).when('la rencontre est affichée', (sut, context) => sut.toEntity()).then(
      'elle devrait apparaître comme terminée, avec son score',
      (result, context) {
        result.isFinished.should.beTrue();
        result.hasScore.should.beTrue();
        result.homeScore.should.be(2);
        result.awayScore.should.be(1);
      },
    );

    given(
      'un match dont la minute de jeu est renseignée',
      (context) => const EventDto(id: '1', progress: '67'),
    ).when('la rencontre est affichée', (sut, context) => sut.toEntity()).then(
      'elle devrait apparaître en direct, à la minute reçue',
      (result, context) {
        result.isLive.should.beTrue();
        result.minute.should.be(67);
      },
    );

    given(
      'un match sans statut ni minute de jeu',
      (context) => const EventDto(id: '1', time: '20:45:00'),
    ).when('la rencontre est affichée', (sut, context) => sut.toEntity()).then(
      'elle devrait apparaître à venir, à son heure de coup d’envoi',
      (result, context) {
        result.isUpcoming.should.beTrue();
        result.hasScore.should.beFalse();
        result.kickoff.should.be('20:45');
      },
    );

    given(
      'une équipe au nom composé de plusieurs mots',
      (context) => const EventDto(homeTeam: 'Paris Saint Germain', id: '1'),
    ).when('la rencontre est affichée', (sut, context) => sut.toEntity()).then(
      'le sigle de l’équipe devrait reprendre ses initiales',
      (result, context) {
        result.home.shortName.should.be('PSG');
      },
    );

    given('un match dont les équipes sont absentes de la réponse', (context) => const EventDto(id: '1'))
        .when('la rencontre est affichée', (sut, context) => sut.toEntity())
        .then('un libellé de repli devrait être utilisé plutôt qu’un nom vide', (result, context) {
          result.home.name.should.be('?');
          result.away.name.should.be('?');
        });
  });
}
