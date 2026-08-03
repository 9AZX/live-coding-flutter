import 'package:live_presentation/src/theme/live_theme.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tactics_providers/tactics_providers.dart';

part 'providers_internal.br.g.dart';

@riverpod
LiveTheme defaultLiveTheme(Ref ref) {
  final palette = ref.watch(tacticsPaletteProvider);

  return LiveTheme(backgroundColor: palette.bgPage);
}
