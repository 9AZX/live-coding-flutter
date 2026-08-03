import 'package:odds_domain/src/behaviors/favourite_outcome.dart';
import 'package:odds_domain/src/entities/odds.br.dart';
import 'package:odds_domain/src/providers_di.br.dart';
import 'package:odds_domain/src/repositories/odds_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.br.g.dart';

List<Override> bindProviders({required ProviderListenable<OddsRepository> repository}) => [
  oddsRepositoryProvider.overrideWith((ref) => ref.watch(repository)),
];

@riverpod
FavouriteOutcome favouriteOutcome(Ref _) => const FavouriteOutcome();

@riverpod
Odds? oddsForMatch(Ref ref, String matchId) => ref.watch(oddsRepositoryProvider).oddsForMatch(matchId);
