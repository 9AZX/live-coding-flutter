import 'package:freezed_annotation/freezed_annotation.dart';

part 'lineup_entry_dto.br.freezed.dart';
part 'lineup_entry_dto.br.g.dart';

/// Un joueur d'une composition TheSportsDB (`/lookuplineup`).
@freezed
abstract class LineupEntryDto with _$LineupEntryDto {
  const factory LineupEntryDto({
    @JsonKey(name: 'strHome') String? home,
    @JsonKey(name: 'strPlayer') String? player,
    @JsonKey(name: 'intSquadNumber') String? squadNumber,
    @JsonKey(name: 'strSubstitute') String? substitute,
  }) = _LineupEntryDto;

  factory LineupEntryDto.fromJson(Map<String, dynamic> json) => _$LineupEntryDtoFromJson(json);
}
