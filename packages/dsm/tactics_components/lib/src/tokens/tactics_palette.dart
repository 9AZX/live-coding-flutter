import 'package:flutter/painting.dart';

/// Tokens de marque Betclic (couleurs, ombres, polices).
///
/// Source : design system « Tactics » (tokens.css). Une feature ne lit jamais une
/// couleur brute : elle compose son propre `ThemeExtension` depuis cette palette,
/// dans son `providers_internal.br.dart`.
class TacticsPalette {
  final Color bgPage;
  final Color divider;
  final String fontBrand;
  final String fontExpanded;
  final Color n100;
  final Color n200;
  final Color n300;
  final Color n500;
  final Color night;
  final Color positive;
  final Color red;
  final List<BoxShadow> shadowCard;
  final Color white;
  final Color white55;

  const TacticsPalette({
    required this.bgPage,
    required this.divider,
    required this.fontBrand,
    required this.fontExpanded,
    required this.n100,
    required this.n200,
    required this.n300,
    required this.n500,
    required this.night,
    required this.positive,
    required this.red,
    required this.shadowCard,
    required this.white,
    required this.white55,
  });

  // Les polices sont empaquetées dans ce package → préfixe `packages/<pkg>/` obligatoire.
  factory TacticsPalette.light() => const TacticsPalette(
    bgPage: Color(0xFFEFF0F1),
    divider: Color(0xFFF1F2F4),
    fontBrand: 'packages/tactics_components/Betclic',
    fontExpanded: 'packages/tactics_components/Betclic Expanded',
    n100: Color(0xFFDEE2E6),
    n200: Color(0xFFAEB9CA),
    n300: Color(0xFF75849E),
    n500: Color(0xFF555B69),
    night: Color(0xFF050512),
    positive: Color(0xFF018C54),
    red: Color(0xFFE81E2B),
    shadowCard: [
      BoxShadow(color: Color(0x0F050512), blurRadius: 2, offset: Offset(0, 1)),
      BoxShadow(color: Color(0x0D050512), blurRadius: 8, offset: Offset(0, 2)),
    ],
    white: Color(0xFFFFFFFF),
    white55: Color(0x8CFFFFFF),
  );
}
