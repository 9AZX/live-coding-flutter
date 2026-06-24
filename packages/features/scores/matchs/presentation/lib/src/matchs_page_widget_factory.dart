import 'package:flutter/widgets.dart';
import 'package:matchs_presentation/src/matchs_page.dart';
import 'package:widget_factory_presentation/widget_factory_presentation.dart';

/// Expose la page Matchs à un host (le shell) sans qu'il dépende de cette feature.
class MatchsPageWidgetFactory implements WidgetFactory<void> {
  const MatchsPageWidgetFactory();

  @override
  Widget create(void data, {Key? key}) => MatchsPage(key: key);
}
