import 'package:favorites_data/src/providers.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scores_domain/scores_domain.dart' as scores_domain;

List<Override> bindProviders() => [
  ...scores_domain.bindProviders(favoritesRepository: favoritesRepositoryProvider),
];
