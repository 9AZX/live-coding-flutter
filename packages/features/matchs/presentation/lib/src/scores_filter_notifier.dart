import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scores_domain/scores_domain.dart';

part 'scores_filter_notifier.g.dart';

/// Filtre sélectionné via les chips de la page Matchs.
@riverpod
class ScoresFilter extends _$ScoresFilter {
  @override
  MatchFilter build() => MatchFilter.all;

  // ignore: use_setters_to_change_properties
  void select(MatchFilter filter) => state = filter;
}
