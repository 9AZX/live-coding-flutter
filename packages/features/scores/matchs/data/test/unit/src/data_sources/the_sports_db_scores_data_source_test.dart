import 'package:flutter_test/flutter_test.dart';
import 'package:givn/givn.dart';
import 'package:matchs_data/src/data_sources/the_sports_db_scores_data_source.dart';
import 'package:mockito/mockito.dart';
import 'package:network_domain/network_domain.dart';
import 'package:scores_domain/scores_domain.dart';
import 'package:shouldly/shouldly.dart';

import '../matchs_data_mocks.mocks.dart';

const _eventsDayPath = '/eventsday.php';
const _ligue1 = '4334';
const _premierLeague = '4328';

/// Le 3 août 2026 est un lundi : les trois onglets tombent sur des dates fixes.
DateTime _monday() => DateTime(2026, 8, 3);

TheSportsDbScoresDataSource _dataSourceWithClient(HttpClient client, {List<String> leagueIds = const [_ligue1]}) =>
    TheSportsDbScoresDataSource(
      clock: _monday,
      client: client,
      countryByLeague: const {_ligue1: 'France', _premierLeague: 'Angleterre'},
      leagueIds: leagueIds,
    );

Map<String, dynamic> _eventJson({required String id, required String time, String homeTeam = 'Équipe'}) =>
    <String, dynamic>{
      'idEvent': id,
      'idLeague': _ligue1,
      'strHomeTeam': homeTeam,
      'strLeague': 'Ligue 1',
      'strTime': time,
    };

NetworkResponse<Map<String, dynamic>> _response(List<Map<String, dynamic>> events) =>
    NetworkResponse<Map<String, dynamic>>(data: <String, dynamic>{'events': events}, statusCode: 200);

/// Répond selon la ligue demandée, pour les scénarios multi-ligues.
void _stubByLeague(MockHttpClient client, Map<String, Object> byLeague) {
  when(client.get<Map<String, dynamic>>(any, queryParameters: anyNamed('queryParameters'))).thenAnswer((invocation) {
    final queryParameters = invocation.namedArguments[const Symbol('queryParameters')]! as Map<String, dynamic>;
    final answer = byLeague[queryParameters['l']];

    if (answer is Exception) throw answer;

    return Future.value(answer! as NetworkResponse<Map<String, dynamic>>);
  });
}

void main() {
  group('Consultation du feed des scores', () {
    given(
      'le feed du jour propose deux rencontres de Ligue 1',
      (context) {
        final mockClient = context.mockOf<MockHttpClient>();
        when(mockClient.get<Map<String, dynamic>>(any, queryParameters: anyNamed('queryParameters'))).thenAnswer(
          (_) async => _response([
            _eventJson(id: '1', time: '21:00:00', homeTeam: 'Olympique de Marseille'),
            _eventJson(id: '2', time: '17:00:00', homeTeam: 'Paris Saint Germain'),
          ]),
        );

        return _dataSourceWithClient(mockClient);
      },
      mocks: [MockHttpClient()],
    ).when('l’utilisateur consulte les matchs du jour', (sut, _) => sut.fetchMatches(MatchDay.today)).then(
      'les rencontres devraient être présentées dans l’ordre des coups d’envoi',
      (result, context) {
        result.isSuccess().should.beTrue();

        final matches = result.getOrThrow();
        matches.length.should.be(2);
        matches.first.kickoff.should.be('17:00');
        matches.last.kickoff.should.be('21:00');
        matches.first.competition.country.should.be('France');

        verify(
          context.mockOf<MockHttpClient>().get<Map<String, dynamic>>(
            _eventsDayPath,
            queryParameters: <String, dynamic>{'d': '2026-08-03', 'l': _ligue1},
          ),
        ).called(1);
      },
    );

    given(
      'l’utilisateur a basculé sur l’onglet de la veille',
      (context) {
        final mockClient = context.mockOf<MockHttpClient>();
        when(
          mockClient.get<Map<String, dynamic>>(any, queryParameters: anyNamed('queryParameters')),
        ).thenAnswer((_) async => _response([]));

        return _dataSourceWithClient(mockClient);
      },
      mocks: [MockHttpClient()],
    ).when('l’utilisateur consulte les matchs d’hier', (sut, _) => sut.fetchMatches(MatchDay.yesterday)).then(
      'ce sont bien les rencontres de la veille qui sont demandées',
      (result, context) {
        verify(
          context.mockOf<MockHttpClient>().get<Map<String, dynamic>>(
            _eventsDayPath,
            queryParameters: <String, dynamic>{'d': '2026-08-02', 'l': _ligue1},
          ),
        ).called(1);
      },
    );

    given(
      'aucune rencontre n’est programmée aujourd’hui',
      (context) {
        final mockClient = context.mockOf<MockHttpClient>();
        when(mockClient.get<Map<String, dynamic>>(any, queryParameters: anyNamed('queryParameters'))).thenAnswer(
          // L'API renvoie `events: null` les jours sans match.
          (_) async => const NetworkResponse<Map<String, dynamic>>(data: <String, dynamic>{}, statusCode: 200),
        );

        return _dataSourceWithClient(mockClient);
      },
      mocks: [MockHttpClient()],
    ).when('l’utilisateur consulte les matchs du jour', (sut, _) => sut.fetchMatches(MatchDay.today)).then(
      'le feed devrait être vide, sans être en erreur',
      (result, _) {
        result.isSuccess().should.beTrue();
        result.getOrThrow().should.beEmpty();
      },
    );

    given(
      'une seule des deux compétitions suivies répond',
      (context) {
        final mockClient = context.mockOf<MockHttpClient>();
        _stubByLeague(mockClient, {
          _ligue1: _response([_eventJson(id: '1', time: '21:00:00')]),
          _premierLeague: const NetworkConnectionError(reason: 'offline'),
        });

        return _dataSourceWithClient(mockClient, leagueIds: const [_ligue1, _premierLeague]);
      },
      mocks: [MockHttpClient()],
    ).when('l’utilisateur consulte les matchs du jour', (sut, _) => sut.fetchMatches(MatchDay.today)).then(
      'les rencontres de la compétition disponible devraient tout de même s’afficher',
      (result, _) {
        result.isSuccess().should.beTrue();
        result.getOrThrow().length.should.be(1);
      },
    );

    given(
      'le service de scores est injoignable',
      (context) {
        final mockClient = context.mockOf<MockHttpClient>();
        when(
          mockClient.get<Map<String, dynamic>>(any, queryParameters: anyNamed('queryParameters')),
        ).thenAnswer((_) async => throw const NetworkNoInternetError());

        return _dataSourceWithClient(mockClient, leagueIds: const [_ligue1, _premierLeague]);
      },
      mocks: [MockHttpClient()],
    ).when('l’utilisateur consulte les matchs du jour', (sut, _) => sut.fetchMatches(MatchDay.today)).then(
      'le feed devrait signaler une indisponibilité plutôt qu’une absence de match',
      (result, _) {
        result.isError().should.beTrue();
        result.exceptionOrNull().should.be(const ScoresError.unavailable());
      },
    );

    given(
      'le service de scores répond sans corps de réponse',
      (context) {
        final mockClient = context.mockOf<MockHttpClient>();
        when(
          mockClient.get<Map<String, dynamic>>(any, queryParameters: anyNamed('queryParameters')),
        ).thenAnswer((_) async => const NetworkResponse<Map<String, dynamic>>(statusCode: 200));

        return _dataSourceWithClient(mockClient);
      },
      mocks: [MockHttpClient()],
    ).when('l’utilisateur consulte les matchs du jour', (sut, _) => sut.fetchMatches(MatchDay.today)).then(
      'le feed devrait signaler une indisponibilité',
      (result, _) {
        result.isError().should.beTrue();
        result.exceptionOrNull().should.be(const ScoresError.unavailable());
      },
    );

    given(
      'le service de scores renvoie une réponse d’une forme inattendue',
      (context) {
        final mockClient = context.mockOf<MockHttpClient>();
        when(mockClient.get<Map<String, dynamic>>(any, queryParameters: anyNamed('queryParameters'))).thenAnswer(
          (_) async => const NetworkResponse<Map<String, dynamic>>(
            data: <String, dynamic>{'events': 'pas une liste'},
            statusCode: 200,
          ),
        );

        return _dataSourceWithClient(mockClient);
      },
      mocks: [MockHttpClient()],
    ).when('l’utilisateur consulte les matchs du jour', (sut, _) => sut.fetchMatches(MatchDay.today)).then(
      'le feed devrait signaler une indisponibilité plutôt qu’un feed vide',
      (result, _) {
        result.isError().should.beTrue();
        result.exceptionOrNull().should.be(const ScoresError.unavailable());
      },
    );
  });
}
