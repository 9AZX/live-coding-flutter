import 'package:flutter/widgets.dart';
import 'package:tactics_components/src/package_name.dart';

const _grayscale = ColorFilter.matrix(<double>[
  0.2126, 0.7152, 0.0722, 0, 0, //
  0.2126, 0.7152, 0.0722, 0, 0,
  0.2126, 0.7152, 0.0722, 0, 0,
  0, 0, 0, 1, 0,
]);

/// Icône bitmap du design system (webp empaqueté dans tactics_components).
///
/// `active: false` applique le traitement « inactif » du DSM (désaturation +
/// opacité réduite), comme la barre de navigation Betclic.
class TacticsIcon extends StatelessWidget {
  final String asset;
  final bool active;
  final double size;

  const TacticsIcon(
    this.asset, {
    this.active = true,
    this.size = 24,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final image = Image.asset(
      asset,
      package: packageName,
      width: size,
      height: size,
    );

    if (active) return image;

    return Opacity(
      opacity: 0.4,
      child: ColorFiltered(colorFilter: _grayscale, child: image),
    );
  }
}
