import 'package:flutter/widgets.dart';
import 'package:matchs_presentation/src/widgets/empty_state.dart';
import 'package:matchs_presentation/src/widgets/favorites_list.dart';
import 'package:matchs_presentation/src/widgets/match_groups_view.dart';
import 'package:matchs_presentation/src/widgets/scores_header.dart';
import 'package:scores_domain/scores_domain.dart';
import 'package:widget_factory_presentation/widget_factory_presentation.dart';

/// Données d'un état vide (record structurel → pas de type partagé à importer).
typedef EmptyStateData = ({IconData icon, String subtitle, String title});

/// Widgets de Matchs exposés aux autres features (En direct, Favoris) via
/// injection. Les arguments sont des types de `scores_domain` ou de Dart, donc
/// aucune feature n'a besoin d'importer une autre feature.

final class ScoresHeaderWidgetFactory implements WidgetFactory<String> {
  const ScoresHeaderWidgetFactory();

  @override
  Widget create(String title, {Key? key}) => ScoresHeader(title: title, key: key);
}

final class MatchGroupsViewWidgetFactory implements WidgetFactory<List<MatchGroup>> {
  const MatchGroupsViewWidgetFactory();

  @override
  Widget create(List<MatchGroup> groups, {Key? key}) => MatchGroupsView(groups: groups, key: key);
}

final class FavoritesListWidgetFactory implements WidgetFactory<List<Match>> {
  const FavoritesListWidgetFactory();

  @override
  Widget create(List<Match> matches, {Key? key}) => FavoritesList(matches: matches, key: key);
}

final class EmptyStateWidgetFactory implements WidgetFactory<EmptyStateData> {
  const EmptyStateWidgetFactory();

  @override
  Widget create(EmptyStateData data, {Key? key}) =>
      EmptyState(icon: data.icon, subtitle: data.subtitle, title: data.title, key: key);
}
