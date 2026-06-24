import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scores_router/src/app_scores_routing.dart';
import 'package:scores_widgets/scores_widgets.dart';

/// Override du port routing par l'implémentation de navigation de l'app.
List<Override> bindRouterProviders() => [
  scoresRoutingProvider.overrideWithValue(const AppScoresRouting()),
];
