// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'odds.br.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Odds {

 double get away; double get draw; double get home;
/// Create a copy of Odds
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OddsCopyWith<Odds> get copyWith => _$OddsCopyWithImpl<Odds>(this as Odds, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Odds&&(identical(other.away, away) || other.away == away)&&(identical(other.draw, draw) || other.draw == draw)&&(identical(other.home, home) || other.home == home));
}


@override
int get hashCode => Object.hash(runtimeType,away,draw,home);

@override
String toString() {
  return 'Odds(away: $away, draw: $draw, home: $home)';
}


}

/// @nodoc
abstract mixin class $OddsCopyWith<$Res>  {
  factory $OddsCopyWith(Odds value, $Res Function(Odds) _then) = _$OddsCopyWithImpl;
@useResult
$Res call({
 double away, double draw, double home
});




}
/// @nodoc
class _$OddsCopyWithImpl<$Res>
    implements $OddsCopyWith<$Res> {
  _$OddsCopyWithImpl(this._self, this._then);

  final Odds _self;
  final $Res Function(Odds) _then;

/// Create a copy of Odds
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? away = null,Object? draw = null,Object? home = null,}) {
  return _then(_self.copyWith(
away: null == away ? _self.away : away // ignore: cast_nullable_to_non_nullable
as double,draw: null == draw ? _self.draw : draw // ignore: cast_nullable_to_non_nullable
as double,home: null == home ? _self.home : home // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [Odds].
extension OddsPatterns on Odds {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Odds value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Odds() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Odds value)  $default,){
final _that = this;
switch (_that) {
case _Odds():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Odds value)?  $default,){
final _that = this;
switch (_that) {
case _Odds() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double away,  double draw,  double home)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Odds() when $default != null:
return $default(_that.away,_that.draw,_that.home);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double away,  double draw,  double home)  $default,) {final _that = this;
switch (_that) {
case _Odds():
return $default(_that.away,_that.draw,_that.home);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double away,  double draw,  double home)?  $default,) {final _that = this;
switch (_that) {
case _Odds() when $default != null:
return $default(_that.away,_that.draw,_that.home);case _:
  return null;

}
}

}

/// @nodoc


class _Odds extends Odds {
  const _Odds({required this.away, required this.draw, required this.home}): super._();
  

@override final  double away;
@override final  double draw;
@override final  double home;

/// Create a copy of Odds
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OddsCopyWith<_Odds> get copyWith => __$OddsCopyWithImpl<_Odds>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Odds&&(identical(other.away, away) || other.away == away)&&(identical(other.draw, draw) || other.draw == draw)&&(identical(other.home, home) || other.home == home));
}


@override
int get hashCode => Object.hash(runtimeType,away,draw,home);

@override
String toString() {
  return 'Odds(away: $away, draw: $draw, home: $home)';
}


}

/// @nodoc
abstract mixin class _$OddsCopyWith<$Res> implements $OddsCopyWith<$Res> {
  factory _$OddsCopyWith(_Odds value, $Res Function(_Odds) _then) = __$OddsCopyWithImpl;
@override @useResult
$Res call({
 double away, double draw, double home
});




}
/// @nodoc
class __$OddsCopyWithImpl<$Res>
    implements _$OddsCopyWith<$Res> {
  __$OddsCopyWithImpl(this._self, this._then);

  final _Odds _self;
  final $Res Function(_Odds) _then;

/// Create a copy of Odds
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? away = null,Object? draw = null,Object? home = null,}) {
  return _then(_Odds(
away: null == away ? _self.away : away // ignore: cast_nullable_to_non_nullable
as double,draw: null == draw ? _self.draw : draw // ignore: cast_nullable_to_non_nullable
as double,home: null == home ? _self.home : home // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
