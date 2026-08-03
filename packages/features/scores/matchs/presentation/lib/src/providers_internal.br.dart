import 'package:flutter/material.dart';
import 'package:matchs_presentation/src/theme/matchs_theme.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tactics_components/tactics_components.dart';
import 'package:tactics_providers/tactics_providers.dart';

part 'providers_internal.br.g.dart';

/// Thème par défaut de la feature, dérivé de la palette DSM. L'app peut le
/// remplacer via `bindProviders(theme: …)` sans toucher à la feature.
@riverpod
MatchsTheme defaultMatchsTheme(Ref ref) {
  final palette = ref.watch(tacticsPaletteProvider);

  final brandTitle = TextStyle(
    fontFamily: palette.fontBrand,
    fontWeight: FontWeight.w800,
    fontSize: 14,
    color: palette.night,
  );

  final expandedScore = TextStyle(
    fontFamily: palette.fontExpanded,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w900,
    fontSize: 15,
    color: palette.night,
  );

  return MatchsTheme(
    backgroundColor: palette.bgPage,
    cardColor: palette.white,
    cardRadius: TacticsRadius.xl,
    cardShadow: palette.shadowCard,
    chipTheme: MatchsChipTheme(
      borderColor: palette.n100,
      selectedColor: palette.night,
      selectedTextStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: palette.white),
      textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: palette.n500),
      unselectedColor: palette.white,
    ),
    competitionCountryTextStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: palette.n300),
    competitionNameTextStyle: brandTitle,
    emptyStateTheme: MatchsEmptyStateTheme(
      iconColor: palette.n200,
      subtitleTextStyle: TextStyle(fontSize: 13, height: 1.5, color: palette.n300),
      titleTextStyle: brandTitle.copyWith(fontSize: 18),
    ),
    headerTheme: MatchsHeaderTheme(
      backgroundColor: palette.red,
      dayTabActiveTextStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w800, color: palette.night),
      dayTabInactiveTextStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: palette.white55),
      dayTabSelectedColor: palette.white,
      subtitleTextStyle: TextStyle(
        fontFamily: palette.fontBrand,
        fontWeight: FontWeight.w800,
        fontSize: 26,
        color: palette.white55,
        letterSpacing: -0.5,
      ),
      titleTextStyle: TextStyle(
        fontFamily: palette.fontBrand,
        fontWeight: FontWeight.w900,
        fontSize: 26,
        color: palette.white,
        letterSpacing: -0.5,
      ),
    ),
    rowTheme: MatchsRowTheme(
      dividerColor: palette.divider,
      finishedTextStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: palette.n300),
      kickoffTextStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: palette.night),
      liveDotColor: palette.red,
      liveMinuteTextStyle: TextStyle(
        fontFamily: palette.fontExpanded,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w700,
        fontSize: 12,
        color: palette.red,
      ),
      liveScoreTextStyle: expandedScore.copyWith(color: palette.red),
      missingScoreTextStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: palette.n200),
      scoreTextStyle: expandedScore,
      teamBadgeTextStyle: TextStyle(
        color: palette.white,
        fontWeight: FontWeight.w800,
        fontSize: 10,
        letterSpacing: -0.3,
      ),
      teamNameTextStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: palette.night),
    ),
    sectionTitleTextStyle: brandTitle,
  );
}
