import 'package:flutter/widgets.dart';

/// Tokens de marque Betclic (couleurs, espacements, rayons, polices).
///
/// Source : design system « Tactics » (tokens.css). Les features ne lisent
/// jamais des couleurs brutes : elles composent leur propre `ThemeExtension`
/// à partir de cette palette.
@immutable
class TacticsPalette {
  const TacticsPalette();

  // -------- BRAND --------
  Color get red => const Color(0xFFE81E2B);
  Color get redDark => const Color(0xFFD2161E);
  Color get yellow => const Color(0xFFFFCC00);
  Color get night => const Color(0xFF050512);
  Color get navy => const Color(0xFF161A2E);

  // -------- NEUTRALS --------
  Color get white => const Color(0xFFFFFFFF);
  Color get bgPage => const Color(0xFFEFF0F1);
  Color get n100 => const Color(0xFFDEE2E6);
  Color get n200 => const Color(0xFFAEB9CA);
  Color get n300 => const Color(0xFF75849E);
  Color get n400 => const Color(0xFF6A7488);
  Color get n500 => const Color(0xFF555B69);

  // -------- SEMANTIC --------
  Color get positive => const Color(0xFF018C54);
  Color get warning => const Color(0xFFFE8000);
  Color get info => const Color(0xFF186DDD);

  // -------- ALPHAS (sur fond coloré) --------
  Color get white16 => const Color(0x29FFFFFF);
  Color get white55 => const Color(0x8CFFFFFF);
  Color get white70 => const Color(0xB3FFFFFF);

  // -------- ELEVATION --------
  List<BoxShadow> get shadowCard => const [
    BoxShadow(color: Color(0x0F050512), blurRadius: 2, offset: Offset(0, 1)),
    BoxShadow(color: Color(0x0D050512), blurRadius: 8, offset: Offset(0, 2)),
  ];

  // -------- RADIUS (px) --------
  double get rSm => 6;
  double get rLg => 12;
  double get rXl => 16;
  double get rPill => 999;

  // -------- SPACING (grille 4pt) --------
  double get s1 => 4;
  double get s2 => 8;
  double get s3 => 12;
  double get s4 => 16;
  double get s5 => 20;
  double get s6 => 24;

  // -------- FONTS --------
  // Polices empaquetées dans tactics_theme → préfixe `packages/<pkg>/` obligatoire.
  String get fontBrand => 'packages/tactics_theme/Betclic';
  String get fontExpanded => 'packages/tactics_theme/Betclic Expanded';

  // -------- ASSETS (icônes tactics) --------
  String get assetPackage => 'tactics_theme';
  String get iconHome => 'assets/icons/home.webp';
  String get iconLive => 'assets/nav/live_on.webp';
  String get iconStarFull => 'assets/icons/star_full.webp';
  String get iconStarEmpty => 'assets/icons/star_empty.webp';
}
