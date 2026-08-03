import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:matchs_data/src/dtos/lineup_entry_dto.br.dart';

part 'lineup_response_dto.br.freezed.dart';
part 'lineup_response_dto.br.g.dart';

/// Enveloppe de `/lookuplineup.php` (clé au singulier, contrairement à la timeline).
@freezed
abstract class LineupResponseDto with _$LineupResponseDto {
  const factory LineupResponseDto({@JsonKey(name: 'lineup') List<LineupEntryDto>? lineup}) = _LineupResponseDto;

  factory LineupResponseDto.fromJson(Map<String, dynamic> json) => _$LineupResponseDtoFromJson(json);
}
