import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scores_widgets/src/theme/scores_theme.dart';

part 'providers_di.g.dart';

/// Thème par défaut fourni par la composition (`theme_manager`).
@riverpod
ScoresTheme scoresTheme(Ref ref) {
  throw UnimplementedError('scoresThemeProvider must be overridden by theme_manager');
}
