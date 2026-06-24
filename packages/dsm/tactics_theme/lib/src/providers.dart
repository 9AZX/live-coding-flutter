import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tactics_theme/src/tactics_palette.dart';

part 'providers.g.dart';

@riverpod
TacticsPalette tacticsPalette(Ref ref) => const TacticsPalette();
