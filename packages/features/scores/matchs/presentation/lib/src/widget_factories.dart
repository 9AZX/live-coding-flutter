import 'package:flutter/widgets.dart';
import 'package:matchs_presentation/src/widgets/empty_state.dart';
import 'package:matchs_presentation/src/widgets/favorites_list.dart';
import 'package:matchs_presentation/src/widgets/match_groups_view.dart';
import 'package:matchs_presentation/src/widgets/scores_header.dart';
import 'package:scores_domain/scores_domain.dart';
import 'package:widget_factory_presentation/widget_factory_presentation.dart';

/// Données d'un état vide (record structurel → pas de type partagé à importer).
typedef EmptyStateData = ({IconData icon, String title, String subtitle});

/// Widgets de Matchs exposés aux autres features (Live, Favoris) via injection.
/// Les arguments sont des types de `shared_domain` ou Dart → aucun couplage
/// feature → feature.

class ScoresHeaderWidgetFactory implements WidgetFactory<String> {
  const ScoresHeaderWidgetFactory();

  @override
  Widget create(String title, {Key? key}) => ScoresHeader(title: title, key: key);
}

class MatchGroupsViewWidgetFactory implements WidgetFactory<List<MatchGroup>> {
  const MatchGroupsViewWidgetFactory();

  @override
  Widget create(List<MatchGroup> groups, {Key? key}) => MatchGroupsView(groups: groups, key: key);
}

class FavoritesListWidgetFactory implements WidgetFactory<List<Match>> {
  const FavoritesListWidgetFactory();

  @override
  Widget create(List<Match> matches, {Key? key}) => FavoritesList(matches: matches, key: key);
}

class EmptyStateWidgetFactory implements WidgetFactory<EmptyStateData> {
  const EmptyStateWidgetFactory();

  @override
  Widget create(EmptyStateData data, {Key? key}) =>
      EmptyState(icon: data.icon, title: data.title, subtitle: data.subtitle, key: key);
}
