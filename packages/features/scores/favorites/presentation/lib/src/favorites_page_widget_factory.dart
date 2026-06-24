import 'package:favorites_presentation/src/favorites_page.dart';
import 'package:flutter/widgets.dart';
import 'package:widget_factory_presentation/widget_factory_presentation.dart';

/// Expose la page Favoris à un host (le shell) sans dépendance directe.
class FavoritesPageWidgetFactory implements WidgetFactory<void> {
  const FavoritesPageWidgetFactory();

  @override
  Widget create(void data, {Key? key}) => FavoritesPage(key: key);
}
