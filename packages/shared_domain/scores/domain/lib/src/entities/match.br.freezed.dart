// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match.br.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Match {

 Team get away; int get awayScore; Competition get competition; Team get home; int get homeScore; String get id;/// Heure de coup d'envoi, déjà formatée (ex: « 20:45 »).
 String get kickoff; MatchStatus get status; List<MatchEvent> get events; List<Lineup> get lineups; int? get minute;
/// Create a copy of Match
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchCopyWith<Match> get copyWith => _$MatchCopyWithImpl<Match>(this as Match, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Match&&(identical(other.away, away) || other.away == away)&&(identical(other.awayScore, awayScore) || other.awayScore == awayScore)&&(identical(other.competition, competition) || other.competition == competition)&&(identical(other.home, home) || other.home == home)&&(identical(other.homeScore, homeScore) || other.homeScore == homeScore)&&(identical(other.id, id) || other.id == id)&&(identical(other.kickoff, kickoff) || other.kickoff == kickoff)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.events, events)&&const DeepCollectionEquality().equals(other.lineups, lineups)&&(identical(other.minute, minute) || other.minute == minute));
}


@override
int get hashCode => Object.hash(runtimeType,away,awayScore,competition,home,homeScore,id,kickoff,status,const DeepCollectionEquality().hash(events),const DeepCollectionEquality().hash(lineups),minute);

@override
String toString() {
  return 'Match(away: $away, awayScore: $awayScore, competition: $competition, home: $home, homeScore: $homeScore, id: $id, kickoff: $kickoff, status: $status, events: $events, lineups: $lineups, minute: $minute)';
}


}

/// @nodoc
abstract mixin class $MatchCopyWith<$Res>  {
  factory $MatchCopyWith(Match value, $Res Function(Match) _then) = _$MatchCopyWithImpl;
@useResult
$Res call({
 Team away, int awayScore, Competition competition, Team home, int homeScore, String id, String kickoff, MatchStatus status, List<MatchEvent> events, List<Lineup> lineups, int? minute
});


$TeamCopyWith<$Res> get away;$CompetitionCopyWith<$Res> get competition;$TeamCopyWith<$Res> get home;

}
/// @nodoc
class _$MatchCopyWithImpl<$Res>
    implements $MatchCopyWith<$Res> {
  _$MatchCopyWithImpl(this._self, this._then);

  final Match _self;
  final $Res Function(Match) _then;

/// Create a copy of Match
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? away = null,Object? awayScore = null,Object? competition = null,Object? home = null,Object? homeScore = null,Object? id = null,Object? kickoff = null,Object? status = null,Object? events = null,Object? lineups = null,Object? minute = freezed,}) {
  return _then(_self.copyWith(
away: null == away ? _self.away : away // ignore: cast_nullable_to_non_nullable
as Team,awayScore: null == awayScore ? _self.awayScore : awayScore // ignore: cast_nullable_to_non_nullable
as int,competition: null == competition ? _self.competition : competition // ignore: cast_nullable_to_non_nullable
as Competition,home: null == home ? _self.home : home // ignore: cast_nullable_to_non_nullable
as Team,homeScore: null == homeScore ? _self.homeScore : homeScore // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kickoff: null == kickoff ? _self.kickoff : kickoff // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MatchStatus,events: null == events ? _self.events : events // ignore: cast_nullable_to_non_nullable
as List<MatchEvent>,lineups: null == lineups ? _self.lineups : lineups // ignore: cast_nullable_to_non_nullable
as List<Lineup>,minute: freezed == minute ? _self.minute : minute // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of Match
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamCopyWith<$Res> get away {
  
  return $TeamCopyWith<$Res>(_self.away, (value) {
    return _then(_self.copyWith(away: value));
  });
}/// Create a copy of Match
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompetitionCopyWith<$Res> get competition {
  
  return $CompetitionCopyWith<$Res>(_self.competition, (value) {
    return _then(_self.copyWith(competition: value));
  });
}/// Create a copy of Match
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamCopyWith<$Res> get home {
  
  return $TeamCopyWith<$Res>(_self.home, (value) {
    return _then(_self.copyWith(home: value));
  });
}
}


/// Adds pattern-matching-related methods to [Match].
extension MatchPatterns on Match {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Match value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Match() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Match value)  $default,){
final _that = this;
switch (_that) {
case _Match():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Match value)?  $default,){
final _that = this;
switch (_that) {
case _Match() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Team away,  int awayScore,  Competition competition,  Team home,  int homeScore,  String id,  String kickoff,  MatchStatus status,  List<MatchEvent> events,  List<Lineup> lineups,  int? minute)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Match() when $default != null:
return $default(_that.away,_that.awayScore,_that.competition,_that.home,_that.homeScore,_that.id,_that.kickoff,_that.status,_that.events,_that.lineups,_that.minute);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Team away,  int awayScore,  Competition competition,  Team home,  int homeScore,  String id,  String kickoff,  MatchStatus status,  List<MatchEvent> events,  List<Lineup> lineups,  int? minute)  $default,) {final _that = this;
switch (_that) {
case _Match():
return $default(_that.away,_that.awayScore,_that.competition,_that.home,_that.homeScore,_that.id,_that.kickoff,_that.status,_that.events,_that.lineups,_that.minute);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Team away,  int awayScore,  Competition competition,  Team home,  int homeScore,  String id,  String kickoff,  MatchStatus status,  List<MatchEvent> events,  List<Lineup> lineups,  int? minute)?  $default,) {final _that = this;
switch (_that) {
case _Match() when $default != null:
return $default(_that.away,_that.awayScore,_that.competition,_that.home,_that.homeScore,_that.id,_that.kickoff,_that.status,_that.events,_that.lineups,_that.minute);case _:
  return null;

}
}

}

/// @nodoc


class _Match extends Match {
  const _Match({required this.away, required this.awayScore, required this.competition, required this.home, required this.homeScore, required this.id, required this.kickoff, required this.status, final  List<MatchEvent> events = const [], final  List<Lineup> lineups = const [], this.minute}): _events = events,_lineups = lineups,super._();
  

@override final  Team away;
@override final  int awayScore;
@override final  Competition competition;
@override final  Team home;
@override final  int homeScore;
@override final  String id;
/// Heure de coup d'envoi, déjà formatée (ex: « 20:45 »).
@override final  String kickoff;
@override final  MatchStatus status;
 final  List<MatchEvent> _events;
@override@JsonKey() List<MatchEvent> get events {
  if (_events is EqualUnmodifiableListView) return _events;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_events);
}

 final  List<Lineup> _lineups;
@override@JsonKey() List<Lineup> get lineups {
  if (_lineups is EqualUnmodifiableListView) return _lineups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lineups);
}

@override final  int? minute;

/// Create a copy of Match
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchCopyWith<_Match> get copyWith => __$MatchCopyWithImpl<_Match>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Match&&(identical(other.away, away) || other.away == away)&&(identical(other.awayScore, awayScore) || other.awayScore == awayScore)&&(identical(other.competition, competition) || other.competition == competition)&&(identical(other.home, home) || other.home == home)&&(identical(other.homeScore, homeScore) || other.homeScore == homeScore)&&(identical(other.id, id) || other.id == id)&&(identical(other.kickoff, kickoff) || other.kickoff == kickoff)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._events, _events)&&const DeepCollectionEquality().equals(other._lineups, _lineups)&&(identical(other.minute, minute) || other.minute == minute));
}


@override
int get hashCode => Object.hash(runtimeType,away,awayScore,competition,home,homeScore,id,kickoff,status,const DeepCollectionEquality().hash(_events),const DeepCollectionEquality().hash(_lineups),minute);

@override
String toString() {
  return 'Match(away: $away, awayScore: $awayScore, competition: $competition, home: $home, homeScore: $homeScore, id: $id, kickoff: $kickoff, status: $status, events: $events, lineups: $lineups, minute: $minute)';
}


}

/// @nodoc
abstract mixin class _$MatchCopyWith<$Res> implements $MatchCopyWith<$Res> {
  factory _$MatchCopyWith(_Match value, $Res Function(_Match) _then) = __$MatchCopyWithImpl;
@override @useResult
$Res call({
 Team away, int awayScore, Competition competition, Team home, int homeScore, String id, String kickoff, MatchStatus status, List<MatchEvent> events, List<Lineup> lineups, int? minute
});


@override $TeamCopyWith<$Res> get away;@override $CompetitionCopyWith<$Res> get competition;@override $TeamCopyWith<$Res> get home;

}
/// @nodoc
class __$MatchCopyWithImpl<$Res>
    implements _$MatchCopyWith<$Res> {
  __$MatchCopyWithImpl(this._self, this._then);

  final _Match _self;
  final $Res Function(_Match) _then;

/// Create a copy of Match
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? away = null,Object? awayScore = null,Object? competition = null,Object? home = null,Object? homeScore = null,Object? id = null,Object? kickoff = null,Object? status = null,Object? events = null,Object? lineups = null,Object? minute = freezed,}) {
  return _then(_Match(
away: null == away ? _self.away : away // ignore: cast_nullable_to_non_nullable
as Team,awayScore: null == awayScore ? _self.awayScore : awayScore // ignore: cast_nullable_to_non_nullable
as int,competition: null == competition ? _self.competition : competition // ignore: cast_nullable_to_non_nullable
as Competition,home: null == home ? _self.home : home // ignore: cast_nullable_to_non_nullable
as Team,homeScore: null == homeScore ? _self.homeScore : homeScore // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kickoff: null == kickoff ? _self.kickoff : kickoff // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MatchStatus,events: null == events ? _self._events : events // ignore: cast_nullable_to_non_nullable
as List<MatchEvent>,lineups: null == lineups ? _self._lineups : lineups // ignore: cast_nullable_to_non_nullable
as List<Lineup>,minute: freezed == minute ? _self.minute : minute // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of Match
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamCopyWith<$Res> get away {
  
  return $TeamCopyWith<$Res>(_self.away, (value) {
    return _then(_self.copyWith(away: value));
  });
}/// Create a copy of Match
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompetitionCopyWith<$Res> get competition {
  
  return $CompetitionCopyWith<$Res>(_self.competition, (value) {
    return _then(_self.copyWith(competition: value));
  });
}/// Create a copy of Match
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamCopyWith<$Res> get home {
  
  return $TeamCopyWith<$Res>(_self.home, (value) {
    return _then(_self.copyWith(home: value));
  });
}
}

// dart format on
