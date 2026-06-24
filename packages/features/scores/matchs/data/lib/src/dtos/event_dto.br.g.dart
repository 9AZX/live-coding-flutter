// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_dto.br.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EventDto _$EventDtoFromJson(Map<String, dynamic> json) => _EventDto(
  id: json['idEvent'] as String?,
  leagueId: json['idLeague'] as String?,
  league: json['strLeague'] as String?,
  homeTeamId: json['idHomeTeam'] as String?,
  homeTeam: json['strHomeTeam'] as String?,
  awayTeamId: json['idAwayTeam'] as String?,
  awayTeam: json['strAwayTeam'] as String?,
  homeScore: json['intHomeScore'] as String?,
  awayScore: json['intAwayScore'] as String?,
  status: json['strStatus'] as String?,
  progress: json['strProgress'] as String?,
  timestamp: json['strTimestamp'] as String?,
  time: json['strTime'] as String?,
  homeFormation: json['strHomeFormation'] as String?,
  awayFormation: json['strAwayFormation'] as String?,
);

Map<String, dynamic> _$EventDtoToJson(_EventDto instance) => <String, dynamic>{
  'idEvent': instance.id,
  'idLeague': instance.leagueId,
  'strLeague': instance.league,
  'idHomeTeam': instance.homeTeamId,
  'strHomeTeam': instance.homeTeam,
  'idAwayTeam': instance.awayTeamId,
  'strAwayTeam': instance.awayTeam,
  'intHomeScore': instance.homeScore,
  'intAwayScore': instance.awayScore,
  'strStatus': instance.status,
  'strProgress': instance.progress,
  'strTimestamp': instance.timestamp,
  'strTime': instance.time,
  'strHomeFormation': instance.homeFormation,
  'strAwayFormation': instance.awayFormation,
};
