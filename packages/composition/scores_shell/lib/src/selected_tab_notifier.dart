import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_tab_notifier.g.dart';

/// Onglets de la barre de navigation du bas.
enum ScoresTab { matchs, direct, favoris }

@riverpod
class SelectedTab extends _$SelectedTab {
  @override
  ScoresTab build() => ScoresTab.matchs;

  // ignore: use_setters_to_change_properties
  void select(ScoresTab tab) => state = tab;
}
