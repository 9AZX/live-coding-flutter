import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'matchs_theme.br.tailor.dart';

/// Chips de filtre du feed.
@TailorMixinComponent()
class MatchsChipTheme extends ThemeExtension<MatchsChipTheme> with _$MatchsChipThemeTailorMixin {
  @override
  final Color borderColor;

  @override
  final Color selectedColor;

  @override
  final TextStyle selectedTextStyle;

  @override
  final TextStyle textStyle;

  @override
  final Color unselectedColor;

  const MatchsChipTheme({
    required this.borderColor,
    required this.selectedColor,
    required this.selectedTextStyle,
    required this.textStyle,
    required this.unselectedColor,
  });
}

/// Bandeau de titre commun aux écrans Scores.
@TailorMixinComponent()
class MatchsHeaderTheme extends ThemeExtension<MatchsHeaderTheme> with _$MatchsHeaderThemeTailorMixin {
  @override
  final Color backgroundColor;

  @override
  final TextStyle dayTabActiveTextStyle;

  @override
  final TextStyle dayTabInactiveTextStyle;

  @override
  final Color dayTabSelectedColor;

  @override
  final TextStyle subtitleTextStyle;

  @override
  final TextStyle titleTextStyle;

  const MatchsHeaderTheme({
    required this.backgroundColor,
    required this.dayTabActiveTextStyle,
    required this.dayTabInactiveTextStyle,
    required this.dayTabSelectedColor,
    required this.subtitleTextStyle,
    required this.titleTextStyle,
  });
}

/// État vide (aucun match, aucun favori).
@TailorMixinComponent()
class MatchsEmptyStateTheme extends ThemeExtension<MatchsEmptyStateTheme> with _$MatchsEmptyStateThemeTailorMixin {
  @override
  final Color iconColor;

  @override
  final TextStyle subtitleTextStyle;

  @override
  final TextStyle titleTextStyle;

  const MatchsEmptyStateTheme({
    required this.iconColor,
    required this.subtitleTextStyle,
    required this.titleTextStyle,
  });
}

/// Rangée de match (statut, équipes, score, étoile).
@TailorMixinComponent()
class MatchsRowTheme extends ThemeExtension<MatchsRowTheme> with _$MatchsRowThemeTailorMixin {
  @override
  final Color dividerColor;

  @override
  final TextStyle finishedTextStyle;

  @override
  final TextStyle kickoffTextStyle;

  @override
  final Color liveDotColor;

  @override
  final TextStyle liveMinuteTextStyle;

  @override
  final TextStyle liveScoreTextStyle;

  @override
  final TextStyle missingScoreTextStyle;

  @override
  final TextStyle scoreTextStyle;

  @override
  final TextStyle teamBadgeTextStyle;

  @override
  final TextStyle teamNameTextStyle;

  const MatchsRowTheme({
    required this.dividerColor,
    required this.finishedTextStyle,
    required this.kickoffTextStyle,
    required this.liveDotColor,
    required this.liveMinuteTextStyle,
    required this.liveScoreTextStyle,
    required this.missingScoreTextStyle,
    required this.scoreTextStyle,
    required this.teamBadgeTextStyle,
    required this.teamNameTextStyle,
  });
}

/// Thème de la feature Matchs. Ses widgets sont partagés avec En direct et
/// Favoris via des `WidgetFactory`, donc ce thème couvre les trois écrans.
@TailorMixinComponent()
class MatchsTheme extends ThemeExtension<MatchsTheme> with _$MatchsThemeTailorMixin {
  @override
  final Color backgroundColor;

  @override
  final Color cardColor;

  @override
  final double cardRadius;

  @override
  final List<BoxShadow> cardShadow;

  @override
  final MatchsChipTheme chipTheme;

  @override
  final TextStyle competitionCountryTextStyle;

  @override
  final TextStyle competitionNameTextStyle;

  @override
  final MatchsEmptyStateTheme emptyStateTheme;

  @override
  final MatchsHeaderTheme headerTheme;

  @override
  final MatchsRowTheme rowTheme;

  @override
  final TextStyle sectionTitleTextStyle;

  const MatchsTheme({
    required this.backgroundColor,
    required this.cardColor,
    required this.cardRadius,
    required this.cardShadow,
    required this.chipTheme,
    required this.competitionCountryTextStyle,
    required this.competitionNameTextStyle,
    required this.emptyStateTheme,
    required this.headerTheme,
    required this.rowTheme,
    required this.sectionTitleTextStyle,
  });
}
