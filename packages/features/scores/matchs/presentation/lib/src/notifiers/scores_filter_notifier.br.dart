import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scores_domain/scores_domain.dart';

part 'scores_filter_notifier.br.g.dart';

/// Filtre sélectionné via les chips de l'écran Matchs.
@riverpod
class ScoresFilterNotifier extends _$ScoresFilterNotifier {
  @override
  MatchFilter build() => MatchFilter.all;

  // ignore: use_setters_to_change_properties
  void select(MatchFilter filter) => state = filter;
}
