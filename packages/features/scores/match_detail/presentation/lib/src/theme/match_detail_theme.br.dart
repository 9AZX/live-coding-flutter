import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'match_detail_theme.br.tailor.dart';

/// En-tête de la rencontre (équipes, score, statut).
@TailorMixinComponent()
class MatchDetailHeaderTheme extends ThemeExtension<MatchDetailHeaderTheme> with _$MatchDetailHeaderThemeTailorMixin {
  @override
  final Color backgroundColor;

  @override
  final TextStyle competitionTextStyle;

  @override
  final TextStyle scoreTextStyle;

  @override
  final TextStyle statusTextStyle;

  @override
  final TextStyle teamNameTextStyle;

  const MatchDetailHeaderTheme({
    required this.backgroundColor,
    required this.competitionTextStyle,
    required this.scoreTextStyle,
    required this.statusTextStyle,
    required this.teamNameTextStyle,
  });
}

/// Onglets Résumé / Compo et leur contenu.
@TailorMixinComponent()
class MatchDetailTabsTheme extends ThemeExtension<MatchDetailTabsTheme> with _$MatchDetailTabsThemeTailorMixin {
  @override
  final TextStyle activeTabTextStyle;

  @override
  final Color dividerColor;

  @override
  final TextStyle emptyTextStyle;

  @override
  final Color goalColor;

  @override
  final TextStyle inactiveTabTextStyle;

  @override
  final TextStyle minuteTextStyle;

  @override
  final TextStyle playerTextStyle;

  @override
  final Color redCardColor;

  @override
  final Color selectedTabColor;

  @override
  final Color yellowCardColor;

  const MatchDetailTabsTheme({
    required this.activeTabTextStyle,
    required this.dividerColor,
    required this.emptyTextStyle,
    required this.goalColor,
    required this.inactiveTabTextStyle,
    required this.minuteTextStyle,
    required this.playerTextStyle,
    required this.redCardColor,
    required this.selectedTabColor,
    required this.yellowCardColor,
  });
}

@TailorMixinComponent()
class MatchDetailTheme extends ThemeExtension<MatchDetailTheme> with _$MatchDetailThemeTailorMixin {
  @override
  final Color backgroundColor;

  @override
  final MatchDetailHeaderTheme headerTheme;

  @override
  final MatchDetailTabsTheme tabsTheme;

  const MatchDetailTheme({required this.backgroundColor, required this.headerTheme, required this.tabsTheme});
}
