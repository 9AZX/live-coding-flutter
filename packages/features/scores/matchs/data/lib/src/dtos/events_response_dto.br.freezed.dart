// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'events_response_dto.br.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EventsResponseDto {

@JsonKey(name: 'events') List<EventDto>? get events;
/// Create a copy of EventsResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventsResponseDtoCopyWith<EventsResponseDto> get copyWith => _$EventsResponseDtoCopyWithImpl<EventsResponseDto>(this as EventsResponseDto, _$identity);

  /// Serializes this EventsResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventsResponseDto&&const DeepCollectionEquality().equals(other.events, events));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(events));

@override
String toString() {
  return 'EventsResponseDto(events: $events)';
}


}

/// @nodoc
abstract mixin class $EventsResponseDtoCopyWith<$Res>  {
  factory $EventsResponseDtoCopyWith(EventsResponseDto value, $Res Function(EventsResponseDto) _then) = _$EventsResponseDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'events') List<EventDto>? events
});




}
/// @nodoc
class _$EventsResponseDtoCopyWithImpl<$Res>
    implements $EventsResponseDtoCopyWith<$Res> {
  _$EventsResponseDtoCopyWithImpl(this._self, this._then);

  final EventsResponseDto _self;
  final $Res Function(EventsResponseDto) _then;

/// Create a copy of EventsResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? events = freezed,}) {
  return _then(_self.copyWith(
events: freezed == events ? _self.events : events // ignore: cast_nullable_to_non_nullable
as List<EventDto>?,
  ));
}

}


/// Adds pattern-matching-related methods to [EventsResponseDto].
extension EventsResponseDtoPatterns on EventsResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EventsResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventsResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EventsResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _EventsResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EventsResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _EventsResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'events')  List<EventDto>? events)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventsResponseDto() when $default != null:
return $default(_that.events);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'events')  List<EventDto>? events)  $default,) {final _that = this;
switch (_that) {
case _EventsResponseDto():
return $default(_that.events);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'events')  List<EventDto>? events)?  $default,) {final _that = this;
switch (_that) {
case _EventsResponseDto() when $default != null:
return $default(_that.events);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EventsResponseDto implements EventsResponseDto {
  const _EventsResponseDto({@JsonKey(name: 'events') final  List<EventDto>? events}): _events = events;
  factory _EventsResponseDto.fromJson(Map<String, dynamic> json) => _$EventsResponseDtoFromJson(json);

 final  List<EventDto>? _events;
@override@JsonKey(name: 'events') List<EventDto>? get events {
  final value = _events;
  if (value == null) return null;
  if (_events is EqualUnmodifiableListView) return _events;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of EventsResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventsResponseDtoCopyWith<_EventsResponseDto> get copyWith => __$EventsResponseDtoCopyWithImpl<_EventsResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EventsResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventsResponseDto&&const DeepCollectionEquality().equals(other._events, _events));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_events));

@override
String toString() {
  return 'EventsResponseDto(events: $events)';
}


}

/// @nodoc
abstract mixin class _$EventsResponseDtoCopyWith<$Res> implements $EventsResponseDtoCopyWith<$Res> {
  factory _$EventsResponseDtoCopyWith(_EventsResponseDto value, $Res Function(_EventsResponseDto) _then) = __$EventsResponseDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'events') List<EventDto>? events
});




}
/// @nodoc
class __$EventsResponseDtoCopyWithImpl<$Res>
    implements _$EventsResponseDtoCopyWith<$Res> {
  __$EventsResponseDtoCopyWithImpl(this._self, this._then);

  final _EventsResponseDto _self;
  final $Res Function(_EventsResponseDto) _then;

/// Create a copy of EventsResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? events = freezed,}) {
  return _then(_EventsResponseDto(
events: freezed == events ? _self._events : events // ignore: cast_nullable_to_non_nullable
as List<EventDto>?,
  ));
}


}

// dart format on
