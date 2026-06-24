import 'package:flutter/widgets.dart';
import 'package:live_presentation/src/live_page.dart';
import 'package:widget_factory_presentation/widget_factory_presentation.dart';

/// Expose la page En direct à un host (le shell) sans dépendance directe.
class LivePageWidgetFactory implements WidgetFactory<void> {
  const LivePageWidgetFactory();

  @override
  Widget create(void data, {Key? key}) => LivePage(key: key);
}
