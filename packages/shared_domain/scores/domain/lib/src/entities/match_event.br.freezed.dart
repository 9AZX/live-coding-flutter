// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_event.br.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MatchEvent {

/// `true` si l'évènement concerne l'équipe à domicile.
 bool get isHome; int get minute; String get player; MatchEventType get type;/// Précision optionnelle (« Penalty », « Passe déc. X »…).
 String? get detail;
/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchEventCopyWith<MatchEvent> get copyWith => _$MatchEventCopyWithImpl<MatchEvent>(this as MatchEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchEvent&&(identical(other.isHome, isHome) || other.isHome == isHome)&&(identical(other.minute, minute) || other.minute == minute)&&(identical(other.player, player) || other.player == player)&&(identical(other.type, type) || other.type == type)&&(identical(other.detail, detail) || other.detail == detail));
}


@override
int get hashCode => Object.hash(runtimeType,isHome,minute,player,type,detail);

@override
String toString() {
  return 'MatchEvent(isHome: $isHome, minute: $minute, player: $player, type: $type, detail: $detail)';
}


}

/// @nodoc
abstract mixin class $MatchEventCopyWith<$Res>  {
  factory $MatchEventCopyWith(MatchEvent value, $Res Function(MatchEvent) _then) = _$MatchEventCopyWithImpl;
@useResult
$Res call({
 bool isHome, int minute, String player, MatchEventType type, String? detail
});




}
/// @nodoc
class _$MatchEventCopyWithImpl<$Res>
    implements $MatchEventCopyWith<$Res> {
  _$MatchEventCopyWithImpl(this._self, this._then);

  final MatchEvent _self;
  final $Res Function(MatchEvent) _then;

/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isHome = null,Object? minute = null,Object? player = null,Object? type = null,Object? detail = freezed,}) {
  return _then(_self.copyWith(
isHome: null == isHome ? _self.isHome : isHome // ignore: cast_nullable_to_non_nullable
as bool,minute: null == minute ? _self.minute : minute // ignore: cast_nullable_to_non_nullable
as int,player: null == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MatchEventType,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MatchEvent].
extension MatchEventPatterns on MatchEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchEvent value)  $default,){
final _that = this;
switch (_that) {
case _MatchEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchEvent value)?  $default,){
final _that = this;
switch (_that) {
case _MatchEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isHome,  int minute,  String player,  MatchEventType type,  String? detail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchEvent() when $default != null:
return $default(_that.isHome,_that.minute,_that.player,_that.type,_that.detail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isHome,  int minute,  String player,  MatchEventType type,  String? detail)  $default,) {final _that = this;
switch (_that) {
case _MatchEvent():
return $default(_that.isHome,_that.minute,_that.player,_that.type,_that.detail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isHome,  int minute,  String player,  MatchEventType type,  String? detail)?  $default,) {final _that = this;
switch (_that) {
case _MatchEvent() when $default != null:
return $default(_that.isHome,_that.minute,_that.player,_that.type,_that.detail);case _:
  return null;

}
}

}

/// @nodoc


class _MatchEvent extends MatchEvent {
  const _MatchEvent({required this.isHome, required this.minute, required this.player, required this.type, this.detail}): super._();
  

/// `true` si l'évènement concerne l'équipe à domicile.
@override final  bool isHome;
@override final  int minute;
@override final  String player;
@override final  MatchEventType type;
/// Précision optionnelle (« Penalty », « Passe déc. X »…).
@override final  String? detail;

/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchEventCopyWith<_MatchEvent> get copyWith => __$MatchEventCopyWithImpl<_MatchEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchEvent&&(identical(other.isHome, isHome) || other.isHome == isHome)&&(identical(other.minute, minute) || other.minute == minute)&&(identical(other.player, player) || other.player == player)&&(identical(other.type, type) || other.type == type)&&(identical(other.detail, detail) || other.detail == detail));
}


@override
int get hashCode => Object.hash(runtimeType,isHome,minute,player,type,detail);

@override
String toString() {
  return 'MatchEvent(isHome: $isHome, minute: $minute, player: $player, type: $type, detail: $detail)';
}


}

/// @nodoc
abstract mixin class _$MatchEventCopyWith<$Res> implements $MatchEventCopyWith<$Res> {
  factory _$MatchEventCopyWith(_MatchEvent value, $Res Function(_MatchEvent) _then) = __$MatchEventCopyWithImpl;
@override @useResult
$Res call({
 bool isHome, int minute, String player, MatchEventType type, String? detail
});




}
/// @nodoc
class __$MatchEventCopyWithImpl<$Res>
    implements _$MatchEventCopyWith<$Res> {
  __$MatchEventCopyWithImpl(this._self, this._then);

  final _MatchEvent _self;
  final $Res Function(_MatchEvent) _then;

/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isHome = null,Object? minute = null,Object? player = null,Object? type = null,Object? detail = freezed,}) {
  return _then(_MatchEvent(
isHome: null == isHome ? _self.isHome : isHome // ignore: cast_nullable_to_non_nullable
as bool,minute: null == minute ? _self.minute : minute // ignore: cast_nullable_to_non_nullable
as int,player: null == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MatchEventType,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
