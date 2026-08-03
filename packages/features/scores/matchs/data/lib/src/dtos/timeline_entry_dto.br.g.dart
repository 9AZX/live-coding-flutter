// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline_entry_dto.br.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimelineEntryDto _$TimelineEntryDtoFromJson(Map<String, dynamic> json) =>
    _TimelineEntryDto(
      assist: json['strAssist'] as String?,
      detail: json['strTimelineDetail'] as String?,
      home: json['strHome'] as String?,
      minute: json['intTime'] as String?,
      player: json['strPlayer'] as String?,
      type: json['strTimeline'] as String?,
    );

Map<String, dynamic> _$TimelineEntryDtoToJson(_TimelineEntryDto instance) =>
    <String, dynamic>{
      'strAssist': instance.assist,
      'strTimelineDetail': instance.detail,
      'strHome': instance.home,
      'intTime': instance.minute,
      'strPlayer': instance.player,
      'strTimeline': instance.type,
    };
