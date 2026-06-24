import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scores_domain/scores_domain.dart';

part 'selected_day_notifier.g.dart';

/// Jour sélectionné via les onglets Hier / Aujourd'hui / Demain.
@riverpod
class SelectedDay extends _$SelectedDay {
  @override
  MatchDay build() => MatchDay.today;

  // ignore: use_setters_to_change_properties
  void select(MatchDay day) => state = day;
}
