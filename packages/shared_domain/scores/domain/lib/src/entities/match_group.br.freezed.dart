// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_group.br.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MatchGroup {

 Competition get competition; List<Match> get matches;
/// Create a copy of MatchGroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchGroupCopyWith<MatchGroup> get copyWith => _$MatchGroupCopyWithImpl<MatchGroup>(this as MatchGroup, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchGroup&&(identical(other.competition, competition) || other.competition == competition)&&const DeepCollectionEquality().equals(other.matches, matches));
}


@override
int get hashCode => Object.hash(runtimeType,competition,const DeepCollectionEquality().hash(matches));

@override
String toString() {
  return 'MatchGroup(competition: $competition, matches: $matches)';
}


}

/// @nodoc
abstract mixin class $MatchGroupCopyWith<$Res>  {
  factory $MatchGroupCopyWith(MatchGroup value, $Res Function(MatchGroup) _then) = _$MatchGroupCopyWithImpl;
@useResult
$Res call({
 Competition competition, List<Match> matches
});


$CompetitionCopyWith<$Res> get competition;

}
/// @nodoc
class _$MatchGroupCopyWithImpl<$Res>
    implements $MatchGroupCopyWith<$Res> {
  _$MatchGroupCopyWithImpl(this._self, this._then);

  final MatchGroup _self;
  final $Res Function(MatchGroup) _then;

/// Create a copy of MatchGroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? competition = null,Object? matches = null,}) {
  return _then(_self.copyWith(
competition: null == competition ? _self.competition : competition // ignore: cast_nullable_to_non_nullable
as Competition,matches: null == matches ? _self.matches : matches // ignore: cast_nullable_to_non_nullable
as List<Match>,
  ));
}
/// Create a copy of MatchGroup
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompetitionCopyWith<$Res> get competition {
  
  return $CompetitionCopyWith<$Res>(_self.competition, (value) {
    return _then(_self.copyWith(competition: value));
  });
}
}


/// Adds pattern-matching-related methods to [MatchGroup].
extension MatchGroupPatterns on MatchGroup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchGroup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchGroup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchGroup value)  $default,){
final _that = this;
switch (_that) {
case _MatchGroup():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchGroup value)?  $default,){
final _that = this;
switch (_that) {
case _MatchGroup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Competition competition,  List<Match> matches)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchGroup() when $default != null:
return $default(_that.competition,_that.matches);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Competition competition,  List<Match> matches)  $default,) {final _that = this;
switch (_that) {
case _MatchGroup():
return $default(_that.competition,_that.matches);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Competition competition,  List<Match> matches)?  $default,) {final _that = this;
switch (_that) {
case _MatchGroup() when $default != null:
return $default(_that.competition,_that.matches);case _:
  return null;

}
}

}

/// @nodoc


class _MatchGroup implements MatchGroup {
  const _MatchGroup({required this.competition, required final  List<Match> matches}): _matches = matches;
  

@override final  Competition competition;
 final  List<Match> _matches;
@override List<Match> get matches {
  if (_matches is EqualUnmodifiableListView) return _matches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_matches);
}


/// Create a copy of MatchGroup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchGroupCopyWith<_MatchGroup> get copyWith => __$MatchGroupCopyWithImpl<_MatchGroup>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchGroup&&(identical(other.competition, competition) || other.competition == competition)&&const DeepCollectionEquality().equals(other._matches, _matches));
}


@override
int get hashCode => Object.hash(runtimeType,competition,const DeepCollectionEquality().hash(_matches));

@override
String toString() {
  return 'MatchGroup(competition: $competition, matches: $matches)';
}


}

/// @nodoc
abstract mixin class _$MatchGroupCopyWith<$Res> implements $MatchGroupCopyWith<$Res> {
  factory _$MatchGroupCopyWith(_MatchGroup value, $Res Function(_MatchGroup) _then) = __$MatchGroupCopyWithImpl;
@override @useResult
$Res call({
 Competition competition, List<Match> matches
});


@override $CompetitionCopyWith<$Res> get competition;

}
/// @nodoc
class __$MatchGroupCopyWithImpl<$Res>
    implements _$MatchGroupCopyWith<$Res> {
  __$MatchGroupCopyWithImpl(this._self, this._then);

  final _MatchGroup _self;
  final $Res Function(_MatchGroup) _then;

/// Create a copy of MatchGroup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? competition = null,Object? matches = null,}) {
  return _then(_MatchGroup(
competition: null == competition ? _self.competition : competition // ignore: cast_nullable_to_non_nullable
as Competition,matches: null == matches ? _self._matches : matches // ignore: cast_nullable_to_non_nullable
as List<Match>,
  ));
}

/// Create a copy of MatchGroup
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompetitionCopyWith<$Res> get competition {
  
  return $CompetitionCopyWith<$Res>(_self.competition, (value) {
    return _then(_self.copyWith(competition: value));
  });
}
}

// dart format on
