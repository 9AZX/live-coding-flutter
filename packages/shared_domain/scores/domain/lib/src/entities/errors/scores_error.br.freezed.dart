// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scores_error.br.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScoresError {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScoresError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ScoresError()';
}


}

/// @nodoc
class $ScoresErrorCopyWith<$Res>  {
$ScoresErrorCopyWith(ScoresError _, $Res Function(ScoresError) __);
}


/// Adds pattern-matching-related methods to [ScoresError].
extension ScoresErrorPatterns on ScoresError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NotFoundScoresError value)?  notFound,TResult Function( UnavailableScoresError value)?  unavailable,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NotFoundScoresError() when notFound != null:
return notFound(_that);case UnavailableScoresError() when unavailable != null:
return unavailable(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NotFoundScoresError value)  notFound,required TResult Function( UnavailableScoresError value)  unavailable,}){
final _that = this;
switch (_that) {
case NotFoundScoresError():
return notFound(_that);case UnavailableScoresError():
return unavailable(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NotFoundScoresError value)?  notFound,TResult? Function( UnavailableScoresError value)?  unavailable,}){
final _that = this;
switch (_that) {
case NotFoundScoresError() when notFound != null:
return notFound(_that);case UnavailableScoresError() when unavailable != null:
return unavailable(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  notFound,TResult Function()?  unavailable,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NotFoundScoresError() when notFound != null:
return notFound();case UnavailableScoresError() when unavailable != null:
return unavailable();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  notFound,required TResult Function()  unavailable,}) {final _that = this;
switch (_that) {
case NotFoundScoresError():
return notFound();case UnavailableScoresError():
return unavailable();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  notFound,TResult? Function()?  unavailable,}) {final _that = this;
switch (_that) {
case NotFoundScoresError() when notFound != null:
return notFound();case UnavailableScoresError() when unavailable != null:
return unavailable();case _:
  return null;

}
}

}

/// @nodoc


class NotFoundScoresError implements ScoresError {
  const NotFoundScoresError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotFoundScoresError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ScoresError.notFound()';
}


}




/// @nodoc


class UnavailableScoresError implements ScoresError {
  const UnavailableScoresError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnavailableScoresError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ScoresError.unavailable()';
}


}




// dart format on
