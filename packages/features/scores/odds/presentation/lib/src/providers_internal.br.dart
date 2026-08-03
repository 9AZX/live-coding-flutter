import 'package:flutter/material.dart';
import 'package:odds_presentation/src/theme/odds_theme.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tactics_providers/tactics_providers.dart';

part 'providers_internal.br.g.dart';

@riverpod
OddsTheme defaultOddsTheme(Ref ref) {
  final palette = ref.watch(tacticsPaletteProvider);

  final quote = TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: palette.night);

  return OddsTheme(
    backgroundColor: palette.bgPage,
    favouriteBackgroundColor: palette.night,
    favouriteQuoteTextStyle: quote.copyWith(color: palette.white),
    labelTextStyle: TextStyle(fontSize: 9, fontWeight: FontWeight.w600, color: palette.n300),
    quoteTextStyle: quote,
  );
}
