// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'odds_theme.br.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$OddsThemeTailorMixin on ThemeExtension<OddsTheme> {
  Color get backgroundColor;
  Color get favouriteBackgroundColor;
  TextStyle get favouriteQuoteTextStyle;
  TextStyle get labelTextStyle;
  TextStyle get quoteTextStyle;

  @override
  OddsTheme copyWith({
    Color? backgroundColor,
    Color? favouriteBackgroundColor,
    TextStyle? favouriteQuoteTextStyle,
    TextStyle? labelTextStyle,
    TextStyle? quoteTextStyle,
  }) {
    return OddsTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      favouriteBackgroundColor:
          favouriteBackgroundColor ?? this.favouriteBackgroundColor,
      favouriteQuoteTextStyle:
          favouriteQuoteTextStyle ?? this.favouriteQuoteTextStyle,
      labelTextStyle: labelTextStyle ?? this.labelTextStyle,
      quoteTextStyle: quoteTextStyle ?? this.quoteTextStyle,
    );
  }

  @override
  OddsTheme lerp(covariant ThemeExtension<OddsTheme>? other, double t) {
    if (other is! OddsTheme) return this as OddsTheme;
    return OddsTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      favouriteBackgroundColor: Color.lerp(
        favouriteBackgroundColor,
        other.favouriteBackgroundColor,
        t,
      )!,
      favouriteQuoteTextStyle: TextStyle.lerp(
        favouriteQuoteTextStyle,
        other.favouriteQuoteTextStyle,
        t,
      )!,
      labelTextStyle: TextStyle.lerp(labelTextStyle, other.labelTextStyle, t)!,
      quoteTextStyle: TextStyle.lerp(quoteTextStyle, other.quoteTextStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OddsTheme &&
            const DeepCollectionEquality().equals(
              backgroundColor,
              other.backgroundColor,
            ) &&
            const DeepCollectionEquality().equals(
              favouriteBackgroundColor,
              other.favouriteBackgroundColor,
            ) &&
            const DeepCollectionEquality().equals(
              favouriteQuoteTextStyle,
              other.favouriteQuoteTextStyle,
            ) &&
            const DeepCollectionEquality().equals(
              labelTextStyle,
              other.labelTextStyle,
            ) &&
            const DeepCollectionEquality().equals(
              quoteTextStyle,
              other.quoteTextStyle,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(favouriteBackgroundColor),
      const DeepCollectionEquality().hash(favouriteQuoteTextStyle),
      const DeepCollectionEquality().hash(labelTextStyle),
      const DeepCollectionEquality().hash(quoteTextStyle),
    );
  }
}
