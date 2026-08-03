import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:matchs_data/src/dtos/timeline_entry_dto.br.dart';

part 'timeline_response_dto.br.freezed.dart';
part 'timeline_response_dto.br.g.dart';

/// Enveloppe de `/lookuptimeline.php`. `timeline` est `null` quand l'API n'a pas de
/// détail pour cette rencontre — cas courant avec la clé de test.
@freezed
abstract class TimelineResponseDto with _$TimelineResponseDto {
  const factory TimelineResponseDto({@JsonKey(name: 'timeline') List<TimelineEntryDto>? timeline}) =
      _TimelineResponseDto;

  factory TimelineResponseDto.fromJson(Map<String, dynamic> json) => _$TimelineResponseDtoFromJson(json);
}
