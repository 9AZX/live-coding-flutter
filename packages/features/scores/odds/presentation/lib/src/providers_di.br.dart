import 'package:odds_presentation/src/providers_internal.br.dart';
import 'package:odds_presentation/src/theme/odds_theme.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers_di.br.g.dart';

@riverpod
OddsTheme oddsTheme(Ref ref) => ref.watch(defaultOddsThemeProvider);
