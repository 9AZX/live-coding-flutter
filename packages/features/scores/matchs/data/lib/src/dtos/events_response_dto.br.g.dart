// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_response_dto.br.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EventsResponseDto _$EventsResponseDtoFromJson(Map<String, dynamic> json) =>
    _EventsResponseDto(
      events: (json['events'] as List<dynamic>?)
          ?.map((e) => EventDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EventsResponseDtoToJson(_EventsResponseDto instance) =>
    <String, dynamic>{'events': instance.events};
