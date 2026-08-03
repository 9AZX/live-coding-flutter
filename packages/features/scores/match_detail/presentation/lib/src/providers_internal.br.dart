import 'package:flutter/material.dart';
import 'package:match_detail_presentation/src/theme/match_detail_theme.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tactics_providers/tactics_providers.dart';

part 'providers_internal.br.g.dart';

/// Thème par défaut de la feature, dérivé de la palette DSM. Aucune couleur brute :
/// la composition peut le surcharger sans toucher la feature.
@riverpod
MatchDetailTheme defaultMatchDetailTheme(Ref ref) {
  final palette = ref.watch(tacticsPaletteProvider);

  return MatchDetailTheme(
    backgroundColor: palette.bgPage,
    headerTheme: MatchDetailHeaderTheme(
      backgroundColor: palette.night,
      competitionTextStyle: TextStyle(color: palette.white55, fontFamily: palette.fontBrand, fontSize: 12),
      scoreTextStyle: TextStyle(
        color: palette.white,
        fontFamily: palette.fontExpanded,
        fontSize: 34,
        fontWeight: FontWeight.w700,
      ),
      statusTextStyle: TextStyle(color: palette.positive, fontFamily: palette.fontBrand, fontSize: 12),
      teamNameTextStyle: TextStyle(
        color: palette.white,
        fontFamily: palette.fontBrand,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    ),
    tabsTheme: MatchDetailTabsTheme(
      activeTabTextStyle: TextStyle(
        color: palette.night,
        fontFamily: palette.fontBrand,
        fontSize: 13,
        fontWeight: FontWeight.w600,
      ),
      dividerColor: palette.divider,
      emptyTextStyle: TextStyle(color: palette.n500, fontFamily: palette.fontBrand, fontSize: 13),
      goalColor: palette.positive,
      inactiveTabTextStyle: TextStyle(color: palette.n500, fontFamily: palette.fontBrand, fontSize: 13),
      minuteTextStyle: TextStyle(color: palette.n500, fontFamily: palette.fontBrand, fontSize: 12),
      playerTextStyle: TextStyle(color: palette.night, fontFamily: palette.fontBrand, fontSize: 14),
      redCardColor: palette.red,
      selectedTabColor: palette.n100,
      yellowCardColor: palette.n300,
    ),
  );
}
