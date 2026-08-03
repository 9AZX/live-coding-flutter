// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorites_theme.br.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$FavoritesThemeTailorMixin on ThemeExtension<FavoritesTheme> {
  Color get backgroundColor;

  @override
  FavoritesTheme copyWith({Color? backgroundColor}) {
    return FavoritesTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  FavoritesTheme lerp(
    covariant ThemeExtension<FavoritesTheme>? other,
    double t,
  ) {
    if (other is! FavoritesTheme) return this as FavoritesTheme;
    return FavoritesTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FavoritesTheme &&
            const DeepCollectionEquality().equals(
              backgroundColor,
              other.backgroundColor,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
    );
  }
}
