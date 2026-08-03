// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lineup_entry_dto.br.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LineupEntryDto _$LineupEntryDtoFromJson(Map<String, dynamic> json) =>
    _LineupEntryDto(
      home: json['strHome'] as String?,
      player: json['strPlayer'] as String?,
      squadNumber: json['intSquadNumber'] as String?,
      substitute: json['strSubstitute'] as String?,
    );

Map<String, dynamic> _$LineupEntryDtoToJson(_LineupEntryDto instance) =>
    <String, dynamic>{
      'strHome': instance.home,
      'strPlayer': instance.player,
      'intSquadNumber': instance.squadNumber,
      'strSubstitute': instance.substitute,
    };
