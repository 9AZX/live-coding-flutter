import 'package:freezed_annotation/freezed_annotation.dart';

part 'team.br.freezed.dart';

/// Équipe. `colorValue` est la couleur de marque (ARGB) fournie par la donnée.
@freezed
abstract class Team with _$Team {
  const factory Team({
    required int colorValue,
    required String id,
    required String name,
    required String shortName,
  }) = _Team;
}
