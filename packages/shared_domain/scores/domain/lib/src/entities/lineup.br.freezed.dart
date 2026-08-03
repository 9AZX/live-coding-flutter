// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lineup.br.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Player {

 String get name; int get number;
/// Create a copy of Player
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerCopyWith<Player> get copyWith => _$PlayerCopyWithImpl<Player>(this as Player, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Player&&(identical(other.name, name) || other.name == name)&&(identical(other.number, number) || other.number == number));
}


@override
int get hashCode => Object.hash(runtimeType,name,number);

@override
String toString() {
  return 'Player(name: $name, number: $number)';
}


}

/// @nodoc
abstract mixin class $PlayerCopyWith<$Res>  {
  factory $PlayerCopyWith(Player value, $Res Function(Player) _then) = _$PlayerCopyWithImpl;
@useResult
$Res call({
 String name, int number
});




}
/// @nodoc
class _$PlayerCopyWithImpl<$Res>
    implements $PlayerCopyWith<$Res> {
  _$PlayerCopyWithImpl(this._self, this._then);

  final Player _self;
  final $Res Function(Player) _then;

/// Create a copy of Player
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? number = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Player].
extension PlayerPatterns on Player {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Player value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Player() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Player value)  $default,){
final _that = this;
switch (_that) {
case _Player():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Player value)?  $default,){
final _that = this;
switch (_that) {
case _Player() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int number)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Player() when $default != null:
return $default(_that.name,_that.number);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int number)  $default,) {final _that = this;
switch (_that) {
case _Player():
return $default(_that.name,_that.number);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int number)?  $default,) {final _that = this;
switch (_that) {
case _Player() when $default != null:
return $default(_that.name,_that.number);case _:
  return null;

}
}

}

/// @nodoc


class _Player implements Player {
  const _Player({required this.name, required this.number});
  

@override final  String name;
@override final  int number;

/// Create a copy of Player
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerCopyWith<_Player> get copyWith => __$PlayerCopyWithImpl<_Player>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Player&&(identical(other.name, name) || other.name == name)&&(identical(other.number, number) || other.number == number));
}


@override
int get hashCode => Object.hash(runtimeType,name,number);

@override
String toString() {
  return 'Player(name: $name, number: $number)';
}


}

/// @nodoc
abstract mixin class _$PlayerCopyWith<$Res> implements $PlayerCopyWith<$Res> {
  factory _$PlayerCopyWith(_Player value, $Res Function(_Player) _then) = __$PlayerCopyWithImpl;
@override @useResult
$Res call({
 String name, int number
});




}
/// @nodoc
class __$PlayerCopyWithImpl<$Res>
    implements _$PlayerCopyWith<$Res> {
  __$PlayerCopyWithImpl(this._self, this._then);

  final _Player _self;
  final $Res Function(_Player) _then;

/// Create a copy of Player
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? number = null,}) {
  return _then(_Player(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$Lineup {

 String get formation; List<Player> get players; Team get team;
/// Create a copy of Lineup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LineupCopyWith<Lineup> get copyWith => _$LineupCopyWithImpl<Lineup>(this as Lineup, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Lineup&&(identical(other.formation, formation) || other.formation == formation)&&const DeepCollectionEquality().equals(other.players, players)&&(identical(other.team, team) || other.team == team));
}


@override
int get hashCode => Object.hash(runtimeType,formation,const DeepCollectionEquality().hash(players),team);

@override
String toString() {
  return 'Lineup(formation: $formation, players: $players, team: $team)';
}


}

/// @nodoc
abstract mixin class $LineupCopyWith<$Res>  {
  factory $LineupCopyWith(Lineup value, $Res Function(Lineup) _then) = _$LineupCopyWithImpl;
@useResult
$Res call({
 String formation, List<Player> players, Team team
});


$TeamCopyWith<$Res> get team;

}
/// @nodoc
class _$LineupCopyWithImpl<$Res>
    implements $LineupCopyWith<$Res> {
  _$LineupCopyWithImpl(this._self, this._then);

  final Lineup _self;
  final $Res Function(Lineup) _then;

/// Create a copy of Lineup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? formation = null,Object? players = null,Object? team = null,}) {
  return _then(_self.copyWith(
formation: null == formation ? _self.formation : formation // ignore: cast_nullable_to_non_nullable
as String,players: null == players ? _self.players : players // ignore: cast_nullable_to_non_nullable
as List<Player>,team: null == team ? _self.team : team // ignore: cast_nullable_to_non_nullable
as Team,
  ));
}
/// Create a copy of Lineup
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamCopyWith<$Res> get team {
  
  return $TeamCopyWith<$Res>(_self.team, (value) {
    return _then(_self.copyWith(team: value));
  });
}
}


/// Adds pattern-matching-related methods to [Lineup].
extension LineupPatterns on Lineup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Lineup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Lineup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Lineup value)  $default,){
final _that = this;
switch (_that) {
case _Lineup():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Lineup value)?  $default,){
final _that = this;
switch (_that) {
case _Lineup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String formation,  List<Player> players,  Team team)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Lineup() when $default != null:
return $default(_that.formation,_that.players,_that.team);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String formation,  List<Player> players,  Team team)  $default,) {final _that = this;
switch (_that) {
case _Lineup():
return $default(_that.formation,_that.players,_that.team);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String formation,  List<Player> players,  Team team)?  $default,) {final _that = this;
switch (_that) {
case _Lineup() when $default != null:
return $default(_that.formation,_that.players,_that.team);case _:
  return null;

}
}

}

/// @nodoc


class _Lineup implements Lineup {
  const _Lineup({required this.formation, required final  List<Player> players, required this.team}): _players = players;
  

@override final  String formation;
 final  List<Player> _players;
@override List<Player> get players {
  if (_players is EqualUnmodifiableListView) return _players;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_players);
}

@override final  Team team;

/// Create a copy of Lineup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LineupCopyWith<_Lineup> get copyWith => __$LineupCopyWithImpl<_Lineup>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Lineup&&(identical(other.formation, formation) || other.formation == formation)&&const DeepCollectionEquality().equals(other._players, _players)&&(identical(other.team, team) || other.team == team));
}


@override
int get hashCode => Object.hash(runtimeType,formation,const DeepCollectionEquality().hash(_players),team);

@override
String toString() {
  return 'Lineup(formation: $formation, players: $players, team: $team)';
}


}

/// @nodoc
abstract mixin class _$LineupCopyWith<$Res> implements $LineupCopyWith<$Res> {
  factory _$LineupCopyWith(_Lineup value, $Res Function(_Lineup) _then) = __$LineupCopyWithImpl;
@override @useResult
$Res call({
 String formation, List<Player> players, Team team
});


@override $TeamCopyWith<$Res> get team;

}
/// @nodoc
class __$LineupCopyWithImpl<$Res>
    implements _$LineupCopyWith<$Res> {
  __$LineupCopyWithImpl(this._self, this._then);

  final _Lineup _self;
  final $Res Function(_Lineup) _then;

/// Create a copy of Lineup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? formation = null,Object? players = null,Object? team = null,}) {
  return _then(_Lineup(
formation: null == formation ? _self.formation : formation // ignore: cast_nullable_to_non_nullable
as String,players: null == players ? _self._players : players // ignore: cast_nullable_to_non_nullable
as List<Player>,team: null == team ? _self.team : team // ignore: cast_nullable_to_non_nullable
as Team,
  ));
}

/// Create a copy of Lineup
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamCopyWith<$Res> get team {
  
  return $TeamCopyWith<$Res>(_self.team, (value) {
    return _then(_self.copyWith(team: value));
  });
}
}

// dart format on
