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

@JsonKey(name: 'idAwayTeam') String? get awayTeamId;@JsonKey(name: 'strAwayFormation') String? get awayFormation;@JsonKey(name: 'intAwayScore') String? get awayScore;@JsonKey(name: 'strAwayTeam') String? get awayTeam;@JsonKey(name: 'strHomeFormation') String? get homeFormation;@JsonKey(name: 'intHomeScore') String? get homeScore;@JsonKey(name: 'strHomeTeam') String? get homeTeam;@JsonKey(name: 'idHomeTeam') String? get homeTeamId;@JsonKey(name: 'idEvent') String? get id;@JsonKey(name: 'strLeague') String? get league;@JsonKey(name: 'idLeague') String? get leagueId;@JsonKey(name: 'strProgress') String? get progress;@JsonKey(name: 'strStatus') String? get status;@JsonKey(name: 'strTime') String? get time;@JsonKey(name: 'strTimestamp') String? get timestamp;
/// Create a copy of EventDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventDtoCopyWith<EventDto> get copyWith => _$EventDtoCopyWithImpl<EventDto>(this as EventDto, _$identity);

  /// Serializes this EventDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventDto&&(identical(other.awayTeamId, awayTeamId) || other.awayTeamId == awayTeamId)&&(identical(other.awayFormation, awayFormation) || other.awayFormation == awayFormation)&&(identical(other.awayScore, awayScore) || other.awayScore == awayScore)&&(identical(other.awayTeam, awayTeam) || other.awayTeam == awayTeam)&&(identical(other.homeFormation, homeFormation) || other.homeFormation == homeFormation)&&(identical(other.homeScore, homeScore) || other.homeScore == homeScore)&&(identical(other.homeTeam, homeTeam) || other.homeTeam == homeTeam)&&(identical(other.homeTeamId, homeTeamId) || other.homeTeamId == homeTeamId)&&(identical(other.id, id) || other.id == id)&&(identical(other.league, league) || other.league == league)&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.status, status) || other.status == status)&&(identical(other.time, time) || other.time == time)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,awayTeamId,awayFormation,awayScore,awayTeam,homeFormation,homeScore,homeTeam,homeTeamId,id,league,leagueId,progress,status,time,timestamp);

@override
String toString() {
  return 'EventDto(awayTeamId: $awayTeamId, awayFormation: $awayFormation, awayScore: $awayScore, awayTeam: $awayTeam, homeFormation: $homeFormation, homeScore: $homeScore, homeTeam: $homeTeam, homeTeamId: $homeTeamId, id: $id, league: $league, leagueId: $leagueId, progress: $progress, status: $status, time: $time, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $EventDtoCopyWith<$Res>  {
  factory $EventDtoCopyWith(EventDto value, $Res Function(EventDto) _then) = _$EventDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'idAwayTeam') String? awayTeamId,@JsonKey(name: 'strAwayFormation') String? awayFormation,@JsonKey(name: 'intAwayScore') String? awayScore,@JsonKey(name: 'strAwayTeam') String? awayTeam,@JsonKey(name: 'strHomeFormation') String? homeFormation,@JsonKey(name: 'intHomeScore') String? homeScore,@JsonKey(name: 'strHomeTeam') String? homeTeam,@JsonKey(name: 'idHomeTeam') String? homeTeamId,@JsonKey(name: 'idEvent') String? id,@JsonKey(name: 'strLeague') String? league,@JsonKey(name: 'idLeague') String? leagueId,@JsonKey(name: 'strProgress') String? progress,@JsonKey(name: 'strStatus') String? status,@JsonKey(name: 'strTime') String? time,@JsonKey(name: 'strTimestamp') String? timestamp
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
@pragma('vm:prefer-inline') @override $Res call({Object? awayTeamId = freezed,Object? awayFormation = freezed,Object? awayScore = freezed,Object? awayTeam = freezed,Object? homeFormation = freezed,Object? homeScore = freezed,Object? homeTeam = freezed,Object? homeTeamId = freezed,Object? id = freezed,Object? league = freezed,Object? leagueId = freezed,Object? progress = freezed,Object? status = freezed,Object? time = freezed,Object? timestamp = freezed,}) {
  return _then(_self.copyWith(
awayTeamId: freezed == awayTeamId ? _self.awayTeamId : awayTeamId // ignore: cast_nullable_to_non_nullable
as String?,awayFormation: freezed == awayFormation ? _self.awayFormation : awayFormation // ignore: cast_nullable_to_non_nullable
as String?,awayScore: freezed == awayScore ? _self.awayScore : awayScore // ignore: cast_nullable_to_non_nullable
as String?,awayTeam: freezed == awayTeam ? _self.awayTeam : awayTeam // ignore: cast_nullable_to_non_nullable
as String?,homeFormation: freezed == homeFormation ? _self.homeFormation : homeFormation // ignore: cast_nullable_to_non_nullable
as String?,homeScore: freezed == homeScore ? _self.homeScore : homeScore // ignore: cast_nullable_to_non_nullable
as String?,homeTeam: freezed == homeTeam ? _self.homeTeam : homeTeam // ignore: cast_nullable_to_non_nullable
as String?,homeTeamId: freezed == homeTeamId ? _self.homeTeamId : homeTeamId // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,league: freezed == league ? _self.league : league // ignore: cast_nullable_to_non_nullable
as String?,leagueId: freezed == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String?,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'idAwayTeam')  String? awayTeamId, @JsonKey(name: 'strAwayFormation')  String? awayFormation, @JsonKey(name: 'intAwayScore')  String? awayScore, @JsonKey(name: 'strAwayTeam')  String? awayTeam, @JsonKey(name: 'strHomeFormation')  String? homeFormation, @JsonKey(name: 'intHomeScore')  String? homeScore, @JsonKey(name: 'strHomeTeam')  String? homeTeam, @JsonKey(name: 'idHomeTeam')  String? homeTeamId, @JsonKey(name: 'idEvent')  String? id, @JsonKey(name: 'strLeague')  String? league, @JsonKey(name: 'idLeague')  String? leagueId, @JsonKey(name: 'strProgress')  String? progress, @JsonKey(name: 'strStatus')  String? status, @JsonKey(name: 'strTime')  String? time, @JsonKey(name: 'strTimestamp')  String? timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventDto() when $default != null:
return $default(_that.awayTeamId,_that.awayFormation,_that.awayScore,_that.awayTeam,_that.homeFormation,_that.homeScore,_that.homeTeam,_that.homeTeamId,_that.id,_that.league,_that.leagueId,_that.progress,_that.status,_that.time,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'idAwayTeam')  String? awayTeamId, @JsonKey(name: 'strAwayFormation')  String? awayFormation, @JsonKey(name: 'intAwayScore')  String? awayScore, @JsonKey(name: 'strAwayTeam')  String? awayTeam, @JsonKey(name: 'strHomeFormation')  String? homeFormation, @JsonKey(name: 'intHomeScore')  String? homeScore, @JsonKey(name: 'strHomeTeam')  String? homeTeam, @JsonKey(name: 'idHomeTeam')  String? homeTeamId, @JsonKey(name: 'idEvent')  String? id, @JsonKey(name: 'strLeague')  String? league, @JsonKey(name: 'idLeague')  String? leagueId, @JsonKey(name: 'strProgress')  String? progress, @JsonKey(name: 'strStatus')  String? status, @JsonKey(name: 'strTime')  String? time, @JsonKey(name: 'strTimestamp')  String? timestamp)  $default,) {final _that = this;
switch (_that) {
case _EventDto():
return $default(_that.awayTeamId,_that.awayFormation,_that.awayScore,_that.awayTeam,_that.homeFormation,_that.homeScore,_that.homeTeam,_that.homeTeamId,_that.id,_that.league,_that.leagueId,_that.progress,_that.status,_that.time,_that.timestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'idAwayTeam')  String? awayTeamId, @JsonKey(name: 'strAwayFormation')  String? awayFormation, @JsonKey(name: 'intAwayScore')  String? awayScore, @JsonKey(name: 'strAwayTeam')  String? awayTeam, @JsonKey(name: 'strHomeFormation')  String? homeFormation, @JsonKey(name: 'intHomeScore')  String? homeScore, @JsonKey(name: 'strHomeTeam')  String? homeTeam, @JsonKey(name: 'idHomeTeam')  String? homeTeamId, @JsonKey(name: 'idEvent')  String? id, @JsonKey(name: 'strLeague')  String? league, @JsonKey(name: 'idLeague')  String? leagueId, @JsonKey(name: 'strProgress')  String? progress, @JsonKey(name: 'strStatus')  String? status, @JsonKey(name: 'strTime')  String? time, @JsonKey(name: 'strTimestamp')  String? timestamp)?  $default,) {final _that = this;
switch (_that) {
case _EventDto() when $default != null:
return $default(_that.awayTeamId,_that.awayFormation,_that.awayScore,_that.awayTeam,_that.homeFormation,_that.homeScore,_that.homeTeam,_that.homeTeamId,_that.id,_that.league,_that.leagueId,_that.progress,_that.status,_that.time,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EventDto implements EventDto {
  const _EventDto({@JsonKey(name: 'idAwayTeam') this.awayTeamId, @JsonKey(name: 'strAwayFormation') this.awayFormation, @JsonKey(name: 'intAwayScore') this.awayScore, @JsonKey(name: 'strAwayTeam') this.awayTeam, @JsonKey(name: 'strHomeFormation') this.homeFormation, @JsonKey(name: 'intHomeScore') this.homeScore, @JsonKey(name: 'strHomeTeam') this.homeTeam, @JsonKey(name: 'idHomeTeam') this.homeTeamId, @JsonKey(name: 'idEvent') this.id, @JsonKey(name: 'strLeague') this.league, @JsonKey(name: 'idLeague') this.leagueId, @JsonKey(name: 'strProgress') this.progress, @JsonKey(name: 'strStatus') this.status, @JsonKey(name: 'strTime') this.time, @JsonKey(name: 'strTimestamp') this.timestamp});
  factory _EventDto.fromJson(Map<String, dynamic> json) => _$EventDtoFromJson(json);

@override@JsonKey(name: 'idAwayTeam') final  String? awayTeamId;
@override@JsonKey(name: 'strAwayFormation') final  String? awayFormation;
@override@JsonKey(name: 'intAwayScore') final  String? awayScore;
@override@JsonKey(name: 'strAwayTeam') final  String? awayTeam;
@override@JsonKey(name: 'strHomeFormation') final  String? homeFormation;
@override@JsonKey(name: 'intHomeScore') final  String? homeScore;
@override@JsonKey(name: 'strHomeTeam') final  String? homeTeam;
@override@JsonKey(name: 'idHomeTeam') final  String? homeTeamId;
@override@JsonKey(name: 'idEvent') final  String? id;
@override@JsonKey(name: 'strLeague') final  String? league;
@override@JsonKey(name: 'idLeague') final  String? leagueId;
@override@JsonKey(name: 'strProgress') final  String? progress;
@override@JsonKey(name: 'strStatus') final  String? status;
@override@JsonKey(name: 'strTime') final  String? time;
@override@JsonKey(name: 'strTimestamp') final  String? timestamp;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventDto&&(identical(other.awayTeamId, awayTeamId) || other.awayTeamId == awayTeamId)&&(identical(other.awayFormation, awayFormation) || other.awayFormation == awayFormation)&&(identical(other.awayScore, awayScore) || other.awayScore == awayScore)&&(identical(other.awayTeam, awayTeam) || other.awayTeam == awayTeam)&&(identical(other.homeFormation, homeFormation) || other.homeFormation == homeFormation)&&(identical(other.homeScore, homeScore) || other.homeScore == homeScore)&&(identical(other.homeTeam, homeTeam) || other.homeTeam == homeTeam)&&(identical(other.homeTeamId, homeTeamId) || other.homeTeamId == homeTeamId)&&(identical(other.id, id) || other.id == id)&&(identical(other.league, league) || other.league == league)&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.status, status) || other.status == status)&&(identical(other.time, time) || other.time == time)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,awayTeamId,awayFormation,awayScore,awayTeam,homeFormation,homeScore,homeTeam,homeTeamId,id,league,leagueId,progress,status,time,timestamp);

@override
String toString() {
  return 'EventDto(awayTeamId: $awayTeamId, awayFormation: $awayFormation, awayScore: $awayScore, awayTeam: $awayTeam, homeFormation: $homeFormation, homeScore: $homeScore, homeTeam: $homeTeam, homeTeamId: $homeTeamId, id: $id, league: $league, leagueId: $leagueId, progress: $progress, status: $status, time: $time, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$EventDtoCopyWith<$Res> implements $EventDtoCopyWith<$Res> {
  factory _$EventDtoCopyWith(_EventDto value, $Res Function(_EventDto) _then) = __$EventDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'idAwayTeam') String? awayTeamId,@JsonKey(name: 'strAwayFormation') String? awayFormation,@JsonKey(name: 'intAwayScore') String? awayScore,@JsonKey(name: 'strAwayTeam') String? awayTeam,@JsonKey(name: 'strHomeFormation') String? homeFormation,@JsonKey(name: 'intHomeScore') String? homeScore,@JsonKey(name: 'strHomeTeam') String? homeTeam,@JsonKey(name: 'idHomeTeam') String? homeTeamId,@JsonKey(name: 'idEvent') String? id,@JsonKey(name: 'strLeague') String? league,@JsonKey(name: 'idLeague') String? leagueId,@JsonKey(name: 'strProgress') String? progress,@JsonKey(name: 'strStatus') String? status,@JsonKey(name: 'strTime') String? time,@JsonKey(name: 'strTimestamp') String? timestamp
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
@override @pragma('vm:prefer-inline') $Res call({Object? awayTeamId = freezed,Object? awayFormation = freezed,Object? awayScore = freezed,Object? awayTeam = freezed,Object? homeFormation = freezed,Object? homeScore = freezed,Object? homeTeam = freezed,Object? homeTeamId = freezed,Object? id = freezed,Object? league = freezed,Object? leagueId = freezed,Object? progress = freezed,Object? status = freezed,Object? time = freezed,Object? timestamp = freezed,}) {
  return _then(_EventDto(
awayTeamId: freezed == awayTeamId ? _self.awayTeamId : awayTeamId // ignore: cast_nullable_to_non_nullable
as String?,awayFormation: freezed == awayFormation ? _self.awayFormation : awayFormation // ignore: cast_nullable_to_non_nullable
as String?,awayScore: freezed == awayScore ? _self.awayScore : awayScore // ignore: cast_nullable_to_non_nullable
as String?,awayTeam: freezed == awayTeam ? _self.awayTeam : awayTeam // ignore: cast_nullable_to_non_nullable
as String?,homeFormation: freezed == homeFormation ? _self.homeFormation : homeFormation // ignore: cast_nullable_to_non_nullable
as String?,homeScore: freezed == homeScore ? _self.homeScore : homeScore // ignore: cast_nullable_to_non_nullable
as String?,homeTeam: freezed == homeTeam ? _self.homeTeam : homeTeam // ignore: cast_nullable_to_non_nullable
as String?,homeTeamId: freezed == homeTeamId ? _self.homeTeamId : homeTeamId // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,league: freezed == league ? _self.league : league // ignore: cast_nullable_to_non_nullable
as String?,leagueId: freezed == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String?,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
