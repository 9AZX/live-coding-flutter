import 'package:odds_data/src/providers.br.dart';
import 'package:odds_domain/odds_domain.dart' as odds_domain;
import 'package:riverpod_annotation/riverpod_annotation.dart';

List<Override> bindProviders() => [
  ...odds_domain.bindProviders(repository: oddsRepositoryProvider),
];
