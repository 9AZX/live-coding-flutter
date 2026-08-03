import 'package:favorites_data/src/providers_internal.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scores_domain/scores_domain.dart';

part 'providers.br.g.dart';

@riverpod
FavoritesRepository favoritesRepository(Ref ref) => ref.watch(favoritesDataSourceProvider);
