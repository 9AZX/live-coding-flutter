// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timeline_response_dto.br.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimelineResponseDto {

@JsonKey(name: 'timeline') List<TimelineEntryDto>? get timeline;
/// Create a copy of TimelineResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimelineResponseDtoCopyWith<TimelineResponseDto> get copyWith => _$TimelineResponseDtoCopyWithImpl<TimelineResponseDto>(this as TimelineResponseDto, _$identity);

  /// Serializes this TimelineResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimelineResponseDto&&const DeepCollectionEquality().equals(other.timeline, timeline));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(timeline));

@override
String toString() {
  return 'TimelineResponseDto(timeline: $timeline)';
}


}

/// @nodoc
abstract mixin class $TimelineResponseDtoCopyWith<$Res>  {
  factory $TimelineResponseDtoCopyWith(TimelineResponseDto value, $Res Function(TimelineResponseDto) _then) = _$TimelineResponseDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'timeline') List<TimelineEntryDto>? timeline
});




}
/// @nodoc
class _$TimelineResponseDtoCopyWithImpl<$Res>
    implements $TimelineResponseDtoCopyWith<$Res> {
  _$TimelineResponseDtoCopyWithImpl(this._self, this._then);

  final TimelineResponseDto _self;
  final $Res Function(TimelineResponseDto) _then;

/// Create a copy of TimelineResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timeline = freezed,}) {
  return _then(_self.copyWith(
timeline: freezed == timeline ? _self.timeline : timeline // ignore: cast_nullable_to_non_nullable
as List<TimelineEntryDto>?,
  ));
}

}


/// Adds pattern-matching-related methods to [TimelineResponseDto].
extension TimelineResponseDtoPatterns on TimelineResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimelineResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimelineResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimelineResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _TimelineResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimelineResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _TimelineResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'timeline')  List<TimelineEntryDto>? timeline)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimelineResponseDto() when $default != null:
return $default(_that.timeline);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'timeline')  List<TimelineEntryDto>? timeline)  $default,) {final _that = this;
switch (_that) {
case _TimelineResponseDto():
return $default(_that.timeline);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'timeline')  List<TimelineEntryDto>? timeline)?  $default,) {final _that = this;
switch (_that) {
case _TimelineResponseDto() when $default != null:
return $default(_that.timeline);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimelineResponseDto implements TimelineResponseDto {
  const _TimelineResponseDto({@JsonKey(name: 'timeline') final  List<TimelineEntryDto>? timeline}): _timeline = timeline;
  factory _TimelineResponseDto.fromJson(Map<String, dynamic> json) => _$TimelineResponseDtoFromJson(json);

 final  List<TimelineEntryDto>? _timeline;
@override@JsonKey(name: 'timeline') List<TimelineEntryDto>? get timeline {
  final value = _timeline;
  if (value == null) return null;
  if (_timeline is EqualUnmodifiableListView) return _timeline;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of TimelineResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimelineResponseDtoCopyWith<_TimelineResponseDto> get copyWith => __$TimelineResponseDtoCopyWithImpl<_TimelineResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimelineResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimelineResponseDto&&const DeepCollectionEquality().equals(other._timeline, _timeline));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_timeline));

@override
String toString() {
  return 'TimelineResponseDto(timeline: $timeline)';
}


}

/// @nodoc
abstract mixin class _$TimelineResponseDtoCopyWith<$Res> implements $TimelineResponseDtoCopyWith<$Res> {
  factory _$TimelineResponseDtoCopyWith(_TimelineResponseDto value, $Res Function(_TimelineResponseDto) _then) = __$TimelineResponseDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'timeline') List<TimelineEntryDto>? timeline
});




}
/// @nodoc
class __$TimelineResponseDtoCopyWithImpl<$Res>
    implements _$TimelineResponseDtoCopyWith<$Res> {
  __$TimelineResponseDtoCopyWithImpl(this._self, this._then);

  final _TimelineResponseDto _self;
  final $Res Function(_TimelineResponseDto) _then;

/// Create a copy of TimelineResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timeline = freezed,}) {
  return _then(_TimelineResponseDto(
timeline: freezed == timeline ? _self._timeline : timeline // ignore: cast_nullable_to_non_nullable
as List<TimelineEntryDto>?,
  ));
}


}

// dart format on
