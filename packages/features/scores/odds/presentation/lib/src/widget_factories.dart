import 'package:flutter/widgets.dart';
import 'package:odds_presentation/src/widgets/odds_badge.dart';
import 'package:scores_domain/scores_domain.dart';
import 'package:widget_factory_presentation/widget_factory_presentation.dart';

/// Expose le badge de cotes aux autres features (ici les rangées de Matchs) sans
/// qu'elles dépendent de ce package. L'argument est un type de `scores_domain`.
final class OddsBadgeWidgetFactory implements WidgetFactory<Match> {
  const OddsBadgeWidgetFactory();

  @override
  Widget create(Match match, {Key? key}) => OddsBadge(match: match, key: key);
}
