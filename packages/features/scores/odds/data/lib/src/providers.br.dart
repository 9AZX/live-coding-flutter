import 'package:odds_data/src/providers_internal.br.dart';
import 'package:odds_domain/odds_domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.br.g.dart';

@riverpod
OddsRepository oddsRepository(Ref ref) => ref.watch(oddsDataSourceProvider);
