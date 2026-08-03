import 'package:app_providers/app_providers.dart';
import 'package:app_router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scores_domain/scores_domain.dart' as scores_domain;
import 'package:shouldly/shouldly.dart';

/// Repository sans réseau : le test vérifie le câblage, pas l'API.
final class _EmptyScoresRepository implements scores_domain.ScoresRepository {
  @override
  Stream<List<scores_domain.Match>> watchMatches(scores_domain.MatchDay day) =>
      Stream.value(const <scores_domain.Match>[]);
}

void main() {
  testWidgets('l’app démarre sur le feed des matchs, avec ses trois onglets', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        // La composition réelle, avec la seule source réseau substituée.
        overrides: appProviders(
          scoresRepository: Provider<scores_domain.ScoresRepository>((_) => _EmptyScoresRepository()),
        ),
        child: const _TestApp(),
      ),
    );
    await tester.pumpAndSettle();

    // Tout le graphe d'injection doit être câblé : un contrat DI non fourni
    // lèverait UnregisteredProviderException au premier build.
    expect(tester.takeException(), isNull);
    find.text('Foot').evaluate().length.should.be(1);
    find.text('Matchs').evaluate().length.should.be(1);
    find.text('En direct').evaluate().length.should.be(1);
    find.text('Favoris').evaluate().length.should.be(1);
  });
}

class _TestApp extends ConsumerWidget {
  const _TestApp();

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      MaterialApp.router(routerConfig: ref.watch(appRouterProvider).config());
}
