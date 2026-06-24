import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_dto.br.freezed.dart';
part 'event_dto.br.g.dart';

/// DTO d'un match TheSportsDB (`/eventsday`, `/lookupevent`). Les champs arrivent
/// en `String`/`null` ; le mapping vers le domaine se fait dans le mapper.
@freezed
abstract class EventDto with _$EventDto {
  const factory EventDto({
    @JsonKey(name: 'idEvent') String? id,
    @JsonKey(name: 'idLeague') String? leagueId,
    @JsonKey(name: 'strLeague') String? league,
    @JsonKey(name: 'idHomeTeam') String? homeTeamId,
    @JsonKey(name: 'strHomeTeam') String? homeTeam,
    @JsonKey(name: 'idAwayTeam') String? awayTeamId,
    @JsonKey(name: 'strAwayTeam') String? awayTeam,
    @JsonKey(name: 'intHomeScore') String? homeScore,
    @JsonKey(name: 'intAwayScore') String? awayScore,
    @JsonKey(name: 'strStatus') String? status,
    @JsonKey(name: 'strProgress') String? progress,
    @JsonKey(name: 'strTimestamp') String? timestamp,
    @JsonKey(name: 'strTime') String? time,
    @JsonKey(name: 'strHomeFormation') String? homeFormation,
    @JsonKey(name: 'strAwayFormation') String? awayFormation,
  }) = _EventDto;

  factory EventDto.fromJson(Map<String, dynamic> json) => _$EventDtoFromJson(json);
}
