// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_dto.br.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EventDto {

@JsonKey(name: 'idEvent') String? get id;@JsonKey(name: 'idLeague') String? get leagueId;@JsonKey(name: 'strLeague') String? get league;@JsonKey(name: 'idHomeTeam') String? get homeTeamId;@JsonKey(name: 'strHomeTeam') String? get homeTeam;@JsonKey(name: 'idAwayTeam') String? get awayTeamId;@JsonKey(name: 'strAwayTeam') String? get awayTeam;@JsonKey(name: 'intHomeScore') String? get homeScore;@JsonKey(name: 'intAwayScore') String? get awayScore;@JsonKey(name: 'strStatus') String? get status;@JsonKey(name: 'strProgress') String? get progress;@JsonKey(name: 'strTimestamp') String? get timestamp;@JsonKey(name: 'strTime') String? get time;@JsonKey(name: 'strHomeFormation') String? get homeFormation;@JsonKey(name: 'strAwayFormation') String? get awayFormation;
/// Create a copy of EventDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventDtoCopyWith<EventDto> get copyWith => _$EventDtoCopyWithImpl<EventDto>(this as EventDto, _$identity);

  /// Serializes this EventDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventDto&&(identical(other.id, id) || other.id == id)&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.league, league) || other.league == league)&&(identical(other.homeTeamId, homeTeamId) || other.homeTeamId == homeTeamId)&&(identical(other.homeTeam, homeTeam) || other.homeTeam == homeTeam)&&(identical(other.awayTeamId, awayTeamId) || other.awayTeamId == awayTeamId)&&(identical(other.awayTeam, awayTeam) || other.awayTeam == awayTeam)&&(identical(other.homeScore, homeScore) || other.homeScore == homeScore)&&(identical(other.awayScore, awayScore) || other.awayScore == awayScore)&&(identical(other.status, status) || other.status == status)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.time, time) || other.time == time)&&(identical(other.homeFormation, homeFormation) || other.homeFormation == homeFormation)&&(identical(other.awayFormation, awayFormation) || other.awayFormation == awayFormation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,leagueId,league,homeTeamId,homeTeam,awayTeamId,awayTeam,homeScore,awayScore,status,progress,timestamp,time,homeFormation,awayFormation);

@override
String toString() {
  return 'EventDto(id: $id, leagueId: $leagueId, league: $league, homeTeamId: $homeTeamId, homeTeam: $homeTeam, awayTeamId: $awayTeamId, awayTeam: $awayTeam, homeScore: $homeScore, awayScore: $awayScore, status: $status, progress: $progress, timestamp: $timestamp, time: $time, homeFormation: $homeFormation, awayFormation: $awayFormation)';
}


}

/// @nodoc
abstract mixin class $EventDtoCopyWith<$Res>  {
  factory $EventDtoCopyWith(EventDto value, $Res Function(EventDto) _then) = _$EventDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'idEvent') String? id,@JsonKey(name: 'idLeague') String? leagueId,@JsonKey(name: 'strLeague') String? league,@JsonKey(name: 'idHomeTeam') String? homeTeamId,@JsonKey(name: 'strHomeTeam') String? homeTeam,@JsonKey(name: 'idAwayTeam') String? awayTeamId,@JsonKey(name: 'strAwayTeam') String? awayTeam,@JsonKey(name: 'intHomeScore') String? homeScore,@JsonKey(name: 'intAwayScore') String? awayScore,@JsonKey(name: 'strStatus') String? status,@JsonKey(name: 'strProgress') String? progress,@JsonKey(name: 'strTimestamp') String? timestamp,@JsonKey(name: 'strTime') String? time,@JsonKey(name: 'strHomeFormation') String? homeFormation,@JsonKey(name: 'strAwayFormation') String? awayFormation
});




}
/// @nodoc
class _$EventDtoCopyWithImpl<$Res>
    implements $EventDtoCopyWith<$Res> {
  _$EventDtoCopyWithImpl(this._self, this._then);

  final EventDto _self;
  final $Res Function(EventDto) _then;

/// Create a copy of EventDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? leagueId = freezed,Object? league = freezed,Object? homeTeamId = freezed,Object? homeTeam = freezed,Object? awayTeamId = freezed,Object? awayTeam = freezed,Object? homeScore = freezed,Object? awayScore = freezed,Object? status = freezed,Object? progress = freezed,Object? timestamp = freezed,Object? time = freezed,Object? homeFormation = freezed,Object? awayFormation = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,leagueId: freezed == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String?,league: freezed == league ? _self.league : league // ignore: cast_nullable_to_non_nullable
as String?,homeTeamId: freezed == homeTeamId ? _self.homeTeamId : homeTeamId // ignore: cast_nullable_to_non_nullable
as String?,homeTeam: freezed == homeTeam ? _self.homeTeam : homeTeam // ignore: cast_nullable_to_non_nullable
as String?,awayTeamId: freezed == awayTeamId ? _self.awayTeamId : awayTeamId // ignore: cast_nullable_to_non_nullable
as String?,awayTeam: freezed == awayTeam ? _self.awayTeam : awayTeam // ignore: cast_nullable_to_non_nullable
as String?,homeScore: freezed == homeScore ? _self.homeScore : homeScore // ignore: cast_nullable_to_non_nullable
as String?,awayScore: freezed == awayScore ? _self.awayScore : awayScore // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as String?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,homeFormation: freezed == homeFormation ? _self.homeFormation : homeFormation // ignore: cast_nullable_to_non_nullable
as String?,awayFormation: freezed == awayFormation ? _self.awayFormation : awayFormation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EventDto].
extension EventDtoPatterns on EventDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EventDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EventDto value)  $default,){
final _that = this;
switch (_that) {
case _EventDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EventDto value)?  $default,){
final _that = this;
switch (_that) {
case _EventDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'idEvent')  String? id, @JsonKey(name: 'idLeague')  String? leagueId, @JsonKey(name: 'strLeague')  String? league, @JsonKey(name: 'idHomeTeam')  String? homeTeamId, @JsonKey(name: 'strHomeTeam')  String? homeTeam, @JsonKey(name: 'idAwayTeam')  String? awayTeamId, @JsonKey(name: 'strAwayTeam')  String? awayTeam, @JsonKey(name: 'intHomeScore')  String? homeScore, @JsonKey(name: 'intAwayScore')  String? awayScore, @JsonKey(name: 'strStatus')  String? status, @JsonKey(name: 'strProgress')  String? progress, @JsonKey(name: 'strTimestamp')  String? timestamp, @JsonKey(name: 'strTime')  String? time, @JsonKey(name: 'strHomeFormation')  String? homeFormation, @JsonKey(name: 'strAwayFormation')  String? awayFormation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventDto() when $default != null:
return $default(_that.id,_that.leagueId,_that.league,_that.homeTeamId,_that.homeTeam,_that.awayTeamId,_that.awayTeam,_that.homeScore,_that.awayScore,_that.status,_that.progress,_that.timestamp,_that.time,_that.homeFormation,_that.awayFormation);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'idEvent')  String? id, @JsonKey(name: 'idLeague')  String? leagueId, @JsonKey(name: 'strLeague')  String? league, @JsonKey(name: 'idHomeTeam')  String? homeTeamId, @JsonKey(name: 'strHomeTeam')  String? homeTeam, @JsonKey(name: 'idAwayTeam')  String? awayTeamId, @JsonKey(name: 'strAwayTeam')  String? awayTeam, @JsonKey(name: 'intHomeScore')  String? homeScore, @JsonKey(name: 'intAwayScore')  String? awayScore, @JsonKey(name: 'strStatus')  String? status, @JsonKey(name: 'strProgress')  String? progress, @JsonKey(name: 'strTimestamp')  String? timestamp, @JsonKey(name: 'strTime')  String? time, @JsonKey(name: 'strHomeFormation')  String? homeFormation, @JsonKey(name: 'strAwayFormation')  String? awayFormation)  $default,) {final _that = this;
switch (_that) {
case _EventDto():
return $default(_that.id,_that.leagueId,_that.league,_that.homeTeamId,_that.homeTeam,_that.awayTeamId,_that.awayTeam,_that.homeScore,_that.awayScore,_that.status,_that.progress,_that.timestamp,_that.time,_that.homeFormation,_that.awayFormation);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'idEvent')  String? id, @JsonKey(name: 'idLeague')  String? leagueId, @JsonKey(name: 'strLeague')  String? league, @JsonKey(name: 'idHomeTeam')  String? homeTeamId, @JsonKey(name: 'strHomeTeam')  String? homeTeam, @JsonKey(name: 'idAwayTeam')  String? awayTeamId, @JsonKey(name: 'strAwayTeam')  String? awayTeam, @JsonKey(name: 'intHomeScore')  String? homeScore, @JsonKey(name: 'intAwayScore')  String? awayScore, @JsonKey(name: 'strStatus')  String? status, @JsonKey(name: 'strProgress')  String? progress, @JsonKey(name: 'strTimestamp')  String? timestamp, @JsonKey(name: 'strTime')  String? time, @JsonKey(name: 'strHomeFormation')  String? homeFormation, @JsonKey(name: 'strAwayFormation')  String? awayFormation)?  $default,) {final _that = this;
switch (_that) {
case _EventDto() when $default != null:
return $default(_that.id,_that.leagueId,_that.league,_that.homeTeamId,_that.homeTeam,_that.awayTeamId,_that.awayTeam,_that.homeScore,_that.awayScore,_that.status,_that.progress,_that.timestamp,_that.time,_that.homeFormation,_that.awayFormation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EventDto implements EventDto {
  const _EventDto({@JsonKey(name: 'idEvent') this.id, @JsonKey(name: 'idLeague') this.leagueId, @JsonKey(name: 'strLeague') this.league, @JsonKey(name: 'idHomeTeam') this.homeTeamId, @JsonKey(name: 'strHomeTeam') this.homeTeam, @JsonKey(name: 'idAwayTeam') this.awayTeamId, @JsonKey(name: 'strAwayTeam') this.awayTeam, @JsonKey(name: 'intHomeScore') this.homeScore, @JsonKey(name: 'intAwayScore') this.awayScore, @JsonKey(name: 'strStatus') this.status, @JsonKey(name: 'strProgress') this.progress, @JsonKey(name: 'strTimestamp') this.timestamp, @JsonKey(name: 'strTime') this.time, @JsonKey(name: 'strHomeFormation') this.homeFormation, @JsonKey(name: 'strAwayFormation') this.awayFormation});
  factory _EventDto.fromJson(Map<String, dynamic> json) => _$EventDtoFromJson(json);

@override@JsonKey(name: 'idEvent') final  String? id;
@override@JsonKey(name: 'idLeague') final  String? leagueId;
@override@JsonKey(name: 'strLeague') final  String? league;
@override@JsonKey(name: 'idHomeTeam') final  String? homeTeamId;
@override@JsonKey(name: 'strHomeTeam') final  String? homeTeam;
@override@JsonKey(name: 'idAwayTeam') final  String? awayTeamId;
@override@JsonKey(name: 'strAwayTeam') final  String? awayTeam;
@override@JsonKey(name: 'intHomeScore') final  String? homeScore;
@override@JsonKey(name: 'intAwayScore') final  String? awayScore;
@override@JsonKey(name: 'strStatus') final  String? status;
@override@JsonKey(name: 'strProgress') final  String? progress;
@override@JsonKey(name: 'strTimestamp') final  String? timestamp;
@override@JsonKey(name: 'strTime') final  String? time;
@override@JsonKey(name: 'strHomeFormation') final  String? homeFormation;
@override@JsonKey(name: 'strAwayFormation') final  String? awayFormation;

/// Create a copy of EventDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventDtoCopyWith<_EventDto> get copyWith => __$EventDtoCopyWithImpl<_EventDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EventDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventDto&&(identical(other.id, id) || other.id == id)&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.league, league) || other.league == league)&&(identical(other.homeTeamId, homeTeamId) || other.homeTeamId == homeTeamId)&&(identical(other.homeTeam, homeTeam) || other.homeTeam == homeTeam)&&(identical(other.awayTeamId, awayTeamId) || other.awayTeamId == awayTeamId)&&(identical(other.awayTeam, awayTeam) || other.awayTeam == awayTeam)&&(identical(other.homeScore, homeScore) || other.homeScore == homeScore)&&(identical(other.awayScore, awayScore) || other.awayScore == awayScore)&&(identical(other.status, status) || other.status == status)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.time, time) || other.time == time)&&(identical(other.homeFormation, homeFormation) || other.homeFormation == homeFormation)&&(identical(other.awayFormation, awayFormation) || other.awayFormation == awayFormation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,leagueId,league,homeTeamId,homeTeam,awayTeamId,awayTeam,homeScore,awayScore,status,progress,timestamp,time,homeFormation,awayFormation);

@override
String toString() {
  return 'EventDto(id: $id, leagueId: $leagueId, league: $league, homeTeamId: $homeTeamId, homeTeam: $homeTeam, awayTeamId: $awayTeamId, awayTeam: $awayTeam, homeScore: $homeScore, awayScore: $awayScore, status: $status, progress: $progress, timestamp: $timestamp, time: $time, homeFormation: $homeFormation, awayFormation: $awayFormation)';
}


}

/// @nodoc
abstract mixin class _$EventDtoCopyWith<$Res> implements $EventDtoCopyWith<$Res> {
  factory _$EventDtoCopyWith(_EventDto value, $Res Function(_EventDto) _then) = __$EventDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'idEvent') String? id,@JsonKey(name: 'idLeague') String? leagueId,@JsonKey(name: 'strLeague') String? league,@JsonKey(name: 'idHomeTeam') String? homeTeamId,@JsonKey(name: 'strHomeTeam') String? homeTeam,@JsonKey(name: 'idAwayTeam') String? awayTeamId,@JsonKey(name: 'strAwayTeam') String? awayTeam,@JsonKey(name: 'intHomeScore') String? homeScore,@JsonKey(name: 'intAwayScore') String? awayScore,@JsonKey(name: 'strStatus') String? status,@JsonKey(name: 'strProgress') String? progress,@JsonKey(name: 'strTimestamp') String? timestamp,@JsonKey(name: 'strTime') String? time,@JsonKey(name: 'strHomeFormation') String? homeFormation,@JsonKey(name: 'strAwayFormation') String? awayFormation
});




}
/// @nodoc
class __$EventDtoCopyWithImpl<$Res>
    implements _$EventDtoCopyWith<$Res> {
  __$EventDtoCopyWithImpl(this._self, this._then);

  final _EventDto _self;
  final $Res Function(_EventDto) _then;

/// Create a copy of EventDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? leagueId = freezed,Object? league = freezed,Object? homeTeamId = freezed,Object? homeTeam = freezed,Object? awayTeamId = freezed,Object? awayTeam = freezed,Object? homeScore = freezed,Object? awayScore = freezed,Object? status = freezed,Object? progress = freezed,Object? timestamp = freezed,Object? time = freezed,Object? homeFormation = freezed,Object? awayFormation = freezed,}) {
  return _then(_EventDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,leagueId: freezed == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String?,league: freezed == league ? _self.league : league // ignore: cast_nullable_to_non_nullable
as String?,homeTeamId: freezed == homeTeamId ? _self.homeTeamId : homeTeamId // ignore: cast_nullable_to_non_nullable
as String?,homeTeam: freezed == homeTeam ? _self.homeTeam : homeTeam // ignore: cast_nullable_to_non_nullable
as String?,awayTeamId: freezed == awayTeamId ? _self.awayTeamId : awayTeamId // ignore: cast_nullable_to_non_nullable
as String?,awayTeam: freezed == awayTeam ? _self.awayTeam : awayTeam // ignore: cast_nullable_to_non_nullable
as String?,homeScore: freezed == homeScore ? _self.homeScore : homeScore // ignore: cast_nullable_to_non_nullable
as String?,awayScore: freezed == awayScore ? _self.awayScore : awayScore // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as String?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,homeFormation: freezed == homeFormation ? _self.homeFormation : homeFormation // ignore: cast_nullable_to_non_nullable
as String?,awayFormation: freezed == awayFormation ? _self.awayFormation : awayFormation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
