import 'package:exceptions/exceptions.dart';
import 'package:odds_domain/src/repositories/odds_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers_di.br.g.dart';

@riverpod
OddsRepository oddsRepository(Ref _) {
  throw UnregisteredProviderException(oddsRepositoryProvider);
}
