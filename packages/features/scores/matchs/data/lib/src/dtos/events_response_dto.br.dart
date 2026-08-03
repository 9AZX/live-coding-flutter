import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:matchs_data/src/dtos/event_dto.br.dart';

part 'events_response_dto.br.freezed.dart';
part 'events_response_dto.br.g.dart';

/// Enveloppe de `/eventsday.php`. Modéliser la réponse plutôt que de piocher une
/// clé à la main : une API qui change de forme échoue au parsing, pas en silence.
/// `events` est `null` quand aucune rencontre n'est programmée ce jour-là.
@freezed
abstract class EventsResponseDto with _$EventsResponseDto {
  const factory EventsResponseDto({@JsonKey(name: 'events') List<EventDto>? events}) = _EventsResponseDto;

  factory EventsResponseDto.fromJson(Map<String, dynamic> json) => _$EventsResponseDtoFromJson(json);
}
