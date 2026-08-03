import 'package:favorites_presentation/src/theme/favorites_theme.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tactics_providers/tactics_providers.dart';

part 'providers_internal.br.g.dart';

@riverpod
FavoritesTheme defaultFavoritesTheme(Ref ref) {
  final palette = ref.watch(tacticsPaletteProvider);

  return FavoritesTheme(backgroundColor: palette.bgPage);
}
