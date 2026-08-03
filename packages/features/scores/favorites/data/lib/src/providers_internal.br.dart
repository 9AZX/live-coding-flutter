import 'package:favorites_data/src/data_sources/in_memory_favorites_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers_internal.br.g.dart';

@Riverpod(keepAlive: true)
InMemoryFavoritesDataSource favoritesDataSource(Ref _) => InMemoryFavoritesDataSource();
