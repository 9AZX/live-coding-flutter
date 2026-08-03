// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timeline_entry_dto.br.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimelineEntryDto {

@JsonKey(name: 'strAssist') String? get assist;@JsonKey(name: 'strTimelineDetail') String? get detail;@JsonKey(name: 'strHome') String? get home;@JsonKey(name: 'intTime') String? get minute;@JsonKey(name: 'strPlayer') String? get player;@JsonKey(name: 'strTimeline') String? get type;
/// Create a copy of TimelineEntryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimelineEntryDtoCopyWith<TimelineEntryDto> get copyWith => _$TimelineEntryDtoCopyWithImpl<TimelineEntryDto>(this as TimelineEntryDto, _$identity);

  /// Serializes this TimelineEntryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimelineEntryDto&&(identical(other.assist, assist) || other.assist == assist)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.home, home) || other.home == home)&&(identical(other.minute, minute) || other.minute == minute)&&(identical(other.player, player) || other.player == player)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,assist,detail,home,minute,player,type);

@override
String toString() {
  return 'TimelineEntryDto(assist: $assist, detail: $detail, home: $home, minute: $minute, player: $player, type: $type)';
}


}

/// @nodoc
abstract mixin class $TimelineEntryDtoCopyWith<$Res>  {
  factory $TimelineEntryDtoCopyWith(TimelineEntryDto value, $Res Function(TimelineEntryDto) _then) = _$TimelineEntryDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'strAssist') String? assist,@JsonKey(name: 'strTimelineDetail') String? detail,@JsonKey(name: 'strHome') String? home,@JsonKey(name: 'intTime') String? minute,@JsonKey(name: 'strPlayer') String? player,@JsonKey(name: 'strTimeline') String? type
});




}
/// @nodoc
class _$TimelineEntryDtoCopyWithImpl<$Res>
    implements $TimelineEntryDtoCopyWith<$Res> {
  _$TimelineEntryDtoCopyWithImpl(this._self, this._then);

  final TimelineEntryDto _self;
  final $Res Function(TimelineEntryDto) _then;

/// Create a copy of TimelineEntryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? assist = freezed,Object? detail = freezed,Object? home = freezed,Object? minute = freezed,Object? player = freezed,Object? type = freezed,}) {
  return _then(_self.copyWith(
assist: freezed == assist ? _self.assist : assist // ignore: cast_nullable_to_non_nullable
as String?,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,home: freezed == home ? _self.home : home // ignore: cast_nullable_to_non_nullable
as String?,minute: freezed == minute ? _self.minute : minute // ignore: cast_nullable_to_non_nullable
as String?,player: freezed == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TimelineEntryDto].
extension TimelineEntryDtoPatterns on TimelineEntryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimelineEntryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimelineEntryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimelineEntryDto value)  $default,){
final _that = this;
switch (_that) {
case _TimelineEntryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimelineEntryDto value)?  $default,){
final _that = this;
switch (_that) {
case _TimelineEntryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'strAssist')  String? assist, @JsonKey(name: 'strTimelineDetail')  String? detail, @JsonKey(name: 'strHome')  String? home, @JsonKey(name: 'intTime')  String? minute, @JsonKey(name: 'strPlayer')  String? player, @JsonKey(name: 'strTimeline')  String? type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimelineEntryDto() when $default != null:
return $default(_that.assist,_that.detail,_that.home,_that.minute,_that.player,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'strAssist')  String? assist, @JsonKey(name: 'strTimelineDetail')  String? detail, @JsonKey(name: 'strHome')  String? home, @JsonKey(name: 'intTime')  String? minute, @JsonKey(name: 'strPlayer')  String? player, @JsonKey(name: 'strTimeline')  String? type)  $default,) {final _that = this;
switch (_that) {
case _TimelineEntryDto():
return $default(_that.assist,_that.detail,_that.home,_that.minute,_that.player,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'strAssist')  String? assist, @JsonKey(name: 'strTimelineDetail')  String? detail, @JsonKey(name: 'strHome')  String? home, @JsonKey(name: 'intTime')  String? minute, @JsonKey(name: 'strPlayer')  String? player, @JsonKey(name: 'strTimeline')  String? type)?  $default,) {final _that = this;
switch (_that) {
case _TimelineEntryDto() when $default != null:
return $default(_that.assist,_that.detail,_that.home,_that.minute,_that.player,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimelineEntryDto implements TimelineEntryDto {
  const _TimelineEntryDto({@JsonKey(name: 'strAssist') this.assist, @JsonKey(name: 'strTimelineDetail') this.detail, @JsonKey(name: 'strHome') this.home, @JsonKey(name: 'intTime') this.minute, @JsonKey(name: 'strPlayer') this.player, @JsonKey(name: 'strTimeline') this.type});
  factory _TimelineEntryDto.fromJson(Map<String, dynamic> json) => _$TimelineEntryDtoFromJson(json);

@override@JsonKey(name: 'strAssist') final  String? assist;
@override@JsonKey(name: 'strTimelineDetail') final  String? detail;
@override@JsonKey(name: 'strHome') final  String? home;
@override@JsonKey(name: 'intTime') final  String? minute;
@override@JsonKey(name: 'strPlayer') final  String? player;
@override@JsonKey(name: 'strTimeline') final  String? type;

/// Create a copy of TimelineEntryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimelineEntryDtoCopyWith<_TimelineEntryDto> get copyWith => __$TimelineEntryDtoCopyWithImpl<_TimelineEntryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimelineEntryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimelineEntryDto&&(identical(other.assist, assist) || other.assist == assist)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.home, home) || other.home == home)&&(identical(other.minute, minute) || other.minute == minute)&&(identical(other.player, player) || other.player == player)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,assist,detail,home,minute,player,type);

@override
String toString() {
  return 'TimelineEntryDto(assist: $assist, detail: $detail, home: $home, minute: $minute, player: $player, type: $type)';
}


}

/// @nodoc
abstract mixin class _$TimelineEntryDtoCopyWith<$Res> implements $TimelineEntryDtoCopyWith<$Res> {
  factory _$TimelineEntryDtoCopyWith(_TimelineEntryDto value, $Res Function(_TimelineEntryDto) _then) = __$TimelineEntryDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'strAssist') String? assist,@JsonKey(name: 'strTimelineDetail') String? detail,@JsonKey(name: 'strHome') String? home,@JsonKey(name: 'intTime') String? minute,@JsonKey(name: 'strPlayer') String? player,@JsonKey(name: 'strTimeline') String? type
});




}
/// @nodoc
class __$TimelineEntryDtoCopyWithImpl<$Res>
    implements _$TimelineEntryDtoCopyWith<$Res> {
  __$TimelineEntryDtoCopyWithImpl(this._self, this._then);

  final _TimelineEntryDto _self;
  final $Res Function(_TimelineEntryDto) _then;

/// Create a copy of TimelineEntryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? assist = freezed,Object? detail = freezed,Object? home = freezed,Object? minute = freezed,Object? player = freezed,Object? type = freezed,}) {
  return _then(_TimelineEntryDto(
assist: freezed == assist ? _self.assist : assist // ignore: cast_nullable_to_non_nullable
as String?,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,home: freezed == home ? _self.home : home // ignore: cast_nullable_to_non_nullable
as String?,minute: freezed == minute ? _self.minute : minute // ignore: cast_nullable_to_non_nullable
as String?,player: freezed == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
