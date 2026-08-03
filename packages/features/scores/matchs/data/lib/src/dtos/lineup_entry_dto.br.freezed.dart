// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lineup_entry_dto.br.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LineupEntryDto {

@JsonKey(name: 'strHome') String? get home;@JsonKey(name: 'strPlayer') String? get player;@JsonKey(name: 'intSquadNumber') String? get squadNumber;@JsonKey(name: 'strSubstitute') String? get substitute;
/// Create a copy of LineupEntryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LineupEntryDtoCopyWith<LineupEntryDto> get copyWith => _$LineupEntryDtoCopyWithImpl<LineupEntryDto>(this as LineupEntryDto, _$identity);

  /// Serializes this LineupEntryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LineupEntryDto&&(identical(other.home, home) || other.home == home)&&(identical(other.player, player) || other.player == player)&&(identical(other.squadNumber, squadNumber) || other.squadNumber == squadNumber)&&(identical(other.substitute, substitute) || other.substitute == substitute));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,home,player,squadNumber,substitute);

@override
String toString() {
  return 'LineupEntryDto(home: $home, player: $player, squadNumber: $squadNumber, substitute: $substitute)';
}


}

/// @nodoc
abstract mixin class $LineupEntryDtoCopyWith<$Res>  {
  factory $LineupEntryDtoCopyWith(LineupEntryDto value, $Res Function(LineupEntryDto) _then) = _$LineupEntryDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'strHome') String? home,@JsonKey(name: 'strPlayer') String? player,@JsonKey(name: 'intSquadNumber') String? squadNumber,@JsonKey(name: 'strSubstitute') String? substitute
});




}
/// @nodoc
class _$LineupEntryDtoCopyWithImpl<$Res>
    implements $LineupEntryDtoCopyWith<$Res> {
  _$LineupEntryDtoCopyWithImpl(this._self, this._then);

  final LineupEntryDto _self;
  final $Res Function(LineupEntryDto) _then;

/// Create a copy of LineupEntryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? home = freezed,Object? player = freezed,Object? squadNumber = freezed,Object? substitute = freezed,}) {
  return _then(_self.copyWith(
home: freezed == home ? _self.home : home // ignore: cast_nullable_to_non_nullable
as String?,player: freezed == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as String?,squadNumber: freezed == squadNumber ? _self.squadNumber : squadNumber // ignore: cast_nullable_to_non_nullable
as String?,substitute: freezed == substitute ? _self.substitute : substitute // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LineupEntryDto].
extension LineupEntryDtoPatterns on LineupEntryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LineupEntryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LineupEntryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LineupEntryDto value)  $default,){
final _that = this;
switch (_that) {
case _LineupEntryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LineupEntryDto value)?  $default,){
final _that = this;
switch (_that) {
case _LineupEntryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'strHome')  String? home, @JsonKey(name: 'strPlayer')  String? player, @JsonKey(name: 'intSquadNumber')  String? squadNumber, @JsonKey(name: 'strSubstitute')  String? substitute)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LineupEntryDto() when $default != null:
return $default(_that.home,_that.player,_that.squadNumber,_that.substitute);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'strHome')  String? home, @JsonKey(name: 'strPlayer')  String? player, @JsonKey(name: 'intSquadNumber')  String? squadNumber, @JsonKey(name: 'strSubstitute')  String? substitute)  $default,) {final _that = this;
switch (_that) {
case _LineupEntryDto():
return $default(_that.home,_that.player,_that.squadNumber,_that.substitute);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'strHome')  String? home, @JsonKey(name: 'strPlayer')  String? player, @JsonKey(name: 'intSquadNumber')  String? squadNumber, @JsonKey(name: 'strSubstitute')  String? substitute)?  $default,) {final _that = this;
switch (_that) {
case _LineupEntryDto() when $default != null:
return $default(_that.home,_that.player,_that.squadNumber,_that.substitute);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LineupEntryDto implements LineupEntryDto {
  const _LineupEntryDto({@JsonKey(name: 'strHome') this.home, @JsonKey(name: 'strPlayer') this.player, @JsonKey(name: 'intSquadNumber') this.squadNumber, @JsonKey(name: 'strSubstitute') this.substitute});
  factory _LineupEntryDto.fromJson(Map<String, dynamic> json) => _$LineupEntryDtoFromJson(json);

@override@JsonKey(name: 'strHome') final  String? home;
@override@JsonKey(name: 'strPlayer') final  String? player;
@override@JsonKey(name: 'intSquadNumber') final  String? squadNumber;
@override@JsonKey(name: 'strSubstitute') final  String? substitute;

/// Create a copy of LineupEntryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LineupEntryDtoCopyWith<_LineupEntryDto> get copyWith => __$LineupEntryDtoCopyWithImpl<_LineupEntryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LineupEntryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LineupEntryDto&&(identical(other.home, home) || other.home == home)&&(identical(other.player, player) || other.player == player)&&(identical(other.squadNumber, squadNumber) || other.squadNumber == squadNumber)&&(identical(other.substitute, substitute) || other.substitute == substitute));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,home,player,squadNumber,substitute);

@override
String toString() {
  return 'LineupEntryDto(home: $home, player: $player, squadNumber: $squadNumber, substitute: $substitute)';
}


}

/// @nodoc
abstract mixin class _$LineupEntryDtoCopyWith<$Res> implements $LineupEntryDtoCopyWith<$Res> {
  factory _$LineupEntryDtoCopyWith(_LineupEntryDto value, $Res Function(_LineupEntryDto) _then) = __$LineupEntryDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'strHome') String? home,@JsonKey(name: 'strPlayer') String? player,@JsonKey(name: 'intSquadNumber') String? squadNumber,@JsonKey(name: 'strSubstitute') String? substitute
});




}
/// @nodoc
class __$LineupEntryDtoCopyWithImpl<$Res>
    implements _$LineupEntryDtoCopyWith<$Res> {
  __$LineupEntryDtoCopyWithImpl(this._self, this._then);

  final _LineupEntryDto _self;
  final $Res Function(_LineupEntryDto) _then;

/// Create a copy of LineupEntryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? home = freezed,Object? player = freezed,Object? squadNumber = freezed,Object? substitute = freezed,}) {
  return _then(_LineupEntryDto(
home: freezed == home ? _self.home : home // ignore: cast_nullable_to_non_nullable
as String?,player: freezed == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as String?,squadNumber: freezed == squadNumber ? _self.squadNumber : squadNumber // ignore: cast_nullable_to_non_nullable
as String?,substitute: freezed == substitute ? _self.substitute : substitute // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
