// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_dto.br.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EventDto _$EventDtoFromJson(Map<String, dynamic> json) => _EventDto(
  awayTeamId: json['idAwayTeam'] as String?,
  awayFormation: json['strAwayFormation'] as String?,
  awayScore: json['intAwayScore'] as String?,
  awayTeam: json['strAwayTeam'] as String?,
  homeFormation: json['strHomeFormation'] as String?,
  homeScore: json['intHomeScore'] as String?,
  homeTeam: json['strHomeTeam'] as String?,
  homeTeamId: json['idHomeTeam'] as String?,
  id: json['idEvent'] as String?,
  league: json['strLeague'] as String?,
  leagueId: json['idLeague'] as String?,
  progress: json['strProgress'] as String?,
  status: json['strStatus'] as String?,
  time: json['strTime'] as String?,
  timestamp: json['strTimestamp'] as String?,
);

Map<String, dynamic> _$EventDtoToJson(_EventDto instance) => <String, dynamic>{
  'idAwayTeam': instance.awayTeamId,
  'strAwayFormation': instance.awayFormation,
  'intAwayScore': instance.awayScore,
  'strAwayTeam': instance.awayTeam,
  'strHomeFormation': instance.homeFormation,
  'intHomeScore': instance.homeScore,
  'strHomeTeam': instance.homeTeam,
  'idHomeTeam': instance.homeTeamId,
  'idEvent': instance.id,
  'strLeague': instance.league,
  'idLeague': instance.leagueId,
  'strProgress': instance.progress,
  'strStatus': instance.status,
  'strTime': instance.time,
  'strTimestamp': instance.timestamp,
};
