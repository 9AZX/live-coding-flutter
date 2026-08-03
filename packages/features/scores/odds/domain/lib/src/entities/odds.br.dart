import 'package:freezed_annotation/freezed_annotation.dart';

part 'odds.br.freezed.dart';

/// Cotes décimales d'une rencontre : victoire domicile (1), nul (N), extérieur (2).
@freezed
abstract class Odds with _$Odds {
  const factory Odds({
    required double away,
    required double draw,
    required double home,
  }) = _Odds;

  const Odds._();

  /// La cote la plus basse désigne le favori des bookmakers.
  double get shortest => [away, draw, home].reduce((a, b) => a < b ? a : b);
}
