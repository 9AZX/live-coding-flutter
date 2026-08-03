import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:match_detail_presentation/src/l10n/match_detail_strings.dart';
import 'package:match_detail_presentation/src/match_detail_screen.dart';
import 'package:match_detail_presentation/src/providers_di.br.dart';
import 'package:match_detail_presentation/src/routing/match_detail_routing.dart';
import 'package:scores_domain/scores_domain.dart';
import 'package:scores_domain/scores_domain.dart' as scores_domain;
import 'package:shouldly/shouldly.dart';
import 'package:tactics_components/tactics_components.dart';
import 'package:tactics_providers/tactics_providers.dart';
import 'package:types_result_domain/types_result_domain.dart';

Team _team(String name) => Team(colorValue: 0, id: name, name: name, shortName: name);

Match _match({List<MatchEvent> events = const [], List<Lineup> lineups = const []}) => Match(
  away: _team('Paris Saint Germain'),
  awayScore: 1,
  competition: const Competition(colorValue: 0, country: 'France', id: '4334', name: 'Ligue 1'),
  events: events,
  home: _team('Olympique de Marseille'),
  homeScore: 2,
  id: 'm1',
  kickoff: '20:45',
  lineups: lineups,
  status: MatchStatus.finished,
);

final class _FakeScoresRepository implements ScoresRepository {
  final Result<Match, ScoresError> _result;

  const _FakeScoresRepository(this._result);

  @override
  Future<Result<Match, ScoresError>> fetchMatch(String id) async => _result;

  @override
  Future<Result<List<Match>, ScoresError>> fetchMatches(MatchDay day) async => const Success([]);
}

final class _NoopRouting implements MatchDetailRouting {
  const _NoopRouting();

  @override
  void onDismissMatchDetail() {}
}

Future<void> _pump(WidgetTester tester, Result<Match, ScoresError> result) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        // Seules les dépendances directes sont substituées, via les `bindProviders`
        // publics : le reste du graphe (behavior, provider d'état, thème) est le vrai.
        ...scores_domain.bindProviders(
          scoresRepository: Provider<ScoresRepository>((_) => _FakeScoresRepository(result)),
        ),
        matchDetailOddsFactoryProvider.overrideWithValue(null),
        matchDetailRoutingProvider.overrideWith((_) => const _NoopRouting()),
        tacticsPaletteProvider.overrideWith((_) => TacticsPalette.light()),
      ],
      child: const MaterialApp(home: MatchDetailScreen(matchId: 'm1')),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('l’utilisateur voit le score et les faits de jeu de la rencontre', (tester) async {
    await _pump(
      tester,
      Success(
        _match(
          events: const [
            MatchEvent(isHome: true, minute: 12, player: 'Mason Greenwood', type: MatchEventType.goal),
          ],
        ),
      ),
    );

    find.text('2 - 1').evaluate().length.should.be(1);
    find.text('Mason Greenwood').evaluate().length.should.be(1);
  });

  testWidgets('sans fait de jeu, l’onglet Résumé l’explique au lieu de rester blanc', (tester) async {
    await _pump(tester, Success(_match()));

    find.text(MatchDetailStrings.emptyTimeline).evaluate().length.should.be(1);
  });

  testWidgets('l’utilisateur peut basculer sur les compositions', (tester) async {
    await _pump(
      tester,
      Success(
        _match(
          lineups: [
            Lineup(
              formation: '4-3-3',
              players: const [Player(name: 'Geronimo Rulli', number: 1)],
              team: _team('OM'),
            ),
            Lineup(
              formation: '4-4-2',
              players: const [Player(name: 'Lucas Chevalier', number: 30)],
              team: _team('PSG'),
            ),
          ],
        ),
      ),
    );

    await tester.tap(find.text(MatchDetailStrings.tabLineups));
    await tester.pumpAndSettle();

    find.text('Geronimo Rulli').evaluate().length.should.be(1);
  });

  testWidgets('une rencontre introuvable est annoncée comme telle, pas comme une panne', (tester) async {
    await _pump(tester, const Failure(ScoresError.notFound()));

    find.text(MatchDetailStrings.notFoundTitle).evaluate().length.should.be(1);
    find.text(MatchDetailStrings.unavailableTitle).evaluate().length.should.be(0);
  });

  testWidgets('un service indisponible affiche de la copie utilisateur, pas l’erreur brute', (tester) async {
    await _pump(tester, const Failure(ScoresError.unavailable()));

    find.text(MatchDetailStrings.unavailableTitle).evaluate().length.should.be(1);
  });
}
