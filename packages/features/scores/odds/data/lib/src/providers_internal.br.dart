import 'package:odds_data/src/data_sources/static_odds_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers_internal.br.g.dart';

@riverpod
StaticOddsDataSource oddsDataSource(Ref _) => const StaticOddsDataSource();
