import 'package:flutter/widgets.dart';

const _grayscale = ColorFilter.matrix(<double>[
  0.2126, 0.7152, 0.0722, 0, 0, //
  0.2126, 0.7152, 0.0722, 0, 0,
  0.2126, 0.7152, 0.0722, 0, 0,
  0, 0, 0, 1, 0,
]);

/// Icône bitmap du design system (webp empaqueté dans tactics_theme).
///
/// `active: false` applique le traitement « inactif » du DSM (désaturation +
/// opacité réduite), comme la barre de navigation Betclic.
class TacticsIcon extends StatelessWidget {
  const TacticsIcon(this.asset, {this.size = 24, this.active = true, super.key});

  final String asset;
  final double size;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final image = Image.asset(asset, package: 'tactics_theme', width: size, height: size);

    if (active) return image;

    return Opacity(
      opacity: 0.4,
      child: ColorFiltered(colorFilter: _grayscale, child: image),
    );
  }
}
