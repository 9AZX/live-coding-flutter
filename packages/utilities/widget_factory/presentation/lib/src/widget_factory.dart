import 'package:flutter/widgets.dart';

/// Fabrique de widget injectable : une feature expose un widget via cette
/// interface, un host le rend via `create()` sans dépendre de la feature.
abstract interface class WidgetFactory<T> {
  const WidgetFactory();

  const factory WidgetFactory.from(Widget Function(T data, {Key? key}) create) = _FunctionWidgetFactory;

  /// Raccourci pour un widget sans argument.
  static WidgetFactory<void> fromNoArg(Widget Function({Key? key}) create) =>
      WidgetFactory<void>.from((_, {Key? key}) => create(key: key));

  Widget create(T data, {Key? key});
}

class _FunctionWidgetFactory<T> implements WidgetFactory<T> {
  const _FunctionWidgetFactory(this._create);

  final Widget Function(T data, {Key? key}) _create;

  @override
  Widget create(T data, {Key? key}) => _create(data, key: key);
}
