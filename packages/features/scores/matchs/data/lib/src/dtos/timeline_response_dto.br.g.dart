// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline_response_dto.br.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimelineResponseDto _$TimelineResponseDtoFromJson(Map<String, dynamic> json) =>
    _TimelineResponseDto(
      timeline: (json['timeline'] as List<dynamic>?)
          ?.map((e) => TimelineEntryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TimelineResponseDtoToJson(
  _TimelineResponseDto instance,
) => <String, dynamic>{'timeline': instance.timeline};
