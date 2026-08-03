import 'package:app_providers/app_providers.dart';
import 'package:app_router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fr_providers/fr_providers.dart';
import 'package:pl_providers/pl_providers.dart';
import 'package:riverpod/misc.dart';
import 'package:scores_domain/scores_domain.dart' as scores_domain;
import 'package:shouldly/shouldly.dart';
import 'package:types_result_domain/types_result_domain.dart';

scores_domain.Team _team(String id) => scores_domain.Team(colorValue: 0, id: id, name: 'Équipe $id', shortName: id);

/// Repository sans réseau : le test vérifie le câblage, pas l'API.
final class _SingleMatchScoresRepository implements scores_domain.ScoresRepository {
  @override
  Future<Result<List<scores_domain.Match>, scores_domain.ScoresError>> fetchMatches(scores_domain.MatchDay day) async =>
      Success([
        scores_domain.Match(
          away: _team('b'),
          awayScore: 0,
          competition: const scores_domain.Competition(
            colorValue: 0,
            country: 'France',
            id: '4334',
            name: 'Ligue 1',
          ),
          home: _team('a'),
          homeScore: 0,
          id: 'm1',
          kickoff: '20:45',
          status: scores_domain.MatchStatus.upcoming,
        ),
      ]);
}

/// Le service de scores est indisponible : l'écran doit le dire, pas afficher
/// « aucun match » ni le `toString()` de l'erreur.
final class _UnavailableScoresRepository implements scores_domain.ScoresRepository {
  @override
  Future<Result<List<scores_domain.Match>, scores_domain.ScoresError>> fetchMatches(scores_domain.MatchDay day) async =>
      const Failure(scores_domain.ScoresError.unavailable());
}

Future<void> _pumpMarket(
  WidgetTester tester,
  List<Override> regulation, {
  scores_domain.ScoresRepository? repository,
}) async {
  await tester.pumpWidget(
    ProviderScope(
      // La composition réelle, avec la seule source réseau substituée.
      overrides: appProviders(
        regulation: regulation,
        scoresRepository: Provider<scores_domain.ScoresRepository>(
          (_) => repository ?? _SingleMatchScoresRepository(),
        ),
      ),
      child: const _TestApp(),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('l’app démarre sur le feed des matchs, avec ses trois onglets', (tester) async {
    await _pumpMarket(tester, frProviders());

    // Tout le graphe d'injection doit être câblé : un contrat DI non fourni
    // lèverait UnregisteredProviderException au premier build.
    expect(tester.takeException(), isNull);
    find.text('Foot').evaluate().length.should.be(1);
    find.text('Matchs').evaluate().length.should.be(1);
    find.text('En direct').evaluate().length.should.be(1);
    find.text('Favoris').evaluate().length.should.be(1);
  });

  testWidgets('sur le marché français, les cotes s’affichent sur la rangée de match', (tester) async {
    await _pumpMarket(tester, frProviders());

    expect(tester.takeException(), isNull);
    // « N » n'est rendu que par le badge de cotes.
    find.text('N').evaluate().length.should.be(1);
  });

  testWidgets('sur le marché polonais, la même rangée de match n’a pas de cotes', (tester) async {
    await _pumpMarket(tester, plProviders());

    expect(tester.takeException(), isNull);
    find.text('N').evaluate().length.should.be(0);
    // La rangée elle-même est bien là : seule la feature optionnelle a disparu.
    find.text('Équipe a').evaluate().length.should.be(1);
  });

  testWidgets('quand les scores sont indisponibles, l’écran le dit au lieu d’afficher un feed vide', (tester) async {
    await _pumpMarket(tester, frProviders(), repository: _UnavailableScoresRepository());

    expect(tester.takeException(), isNull);
    find.text('Scores indisponibles').evaluate().length.should.be(1);
    find.text('Aucun match').evaluate().length.should.be(0);
  });
}

class _TestApp extends ConsumerWidget {
  const _TestApp();

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      MaterialApp.router(routerConfig: ref.watch(appRouterProvider).config());
}
