import 'package:exceptions/exceptions.dart';
import 'package:matchs_presentation/src/providers_internal.br.dart';
import 'package:matchs_presentation/src/routing/matchs_routing.dart';
import 'package:matchs_presentation/src/theme/matchs_theme.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers_di.br.g.dart';

@riverpod
MatchsRouting matchsRouting(Ref _) {
  throw UnregisteredProviderException(matchsRoutingProvider);
}

@riverpod
MatchsTheme matchsTheme(Ref ref) => ref.watch(defaultMatchsThemeProvider);
