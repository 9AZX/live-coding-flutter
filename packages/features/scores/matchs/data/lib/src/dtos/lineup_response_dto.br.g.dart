// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lineup_response_dto.br.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LineupResponseDto _$LineupResponseDtoFromJson(Map<String, dynamic> json) =>
    _LineupResponseDto(
      lineup: (json['lineup'] as List<dynamic>?)
          ?.map((e) => LineupEntryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LineupResponseDtoToJson(_LineupResponseDto instance) =>
    <String, dynamic>{'lineup': instance.lineup};
