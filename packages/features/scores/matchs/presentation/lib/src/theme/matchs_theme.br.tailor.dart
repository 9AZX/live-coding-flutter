// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matchs_theme.br.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$MatchsChipThemeTailorMixin on ThemeExtension<MatchsChipTheme> {
  Color get borderColor;
  Color get selectedColor;
  TextStyle get selectedTextStyle;
  TextStyle get textStyle;
  Color get unselectedColor;

  @override
  MatchsChipTheme copyWith({
    Color? borderColor,
    Color? selectedColor,
    TextStyle? selectedTextStyle,
    TextStyle? textStyle,
    Color? unselectedColor,
  }) {
    return MatchsChipTheme(
      borderColor: borderColor ?? this.borderColor,
      selectedColor: selectedColor ?? this.selectedColor,
      selectedTextStyle: selectedTextStyle ?? this.selectedTextStyle,
      textStyle: textStyle ?? this.textStyle,
      unselectedColor: unselectedColor ?? this.unselectedColor,
    );
  }

  @override
  MatchsChipTheme lerp(
    covariant ThemeExtension<MatchsChipTheme>? other,
    double t,
  ) {
    if (other is! MatchsChipTheme) return this as MatchsChipTheme;
    return MatchsChipTheme(
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      selectedColor: Color.lerp(selectedColor, other.selectedColor, t)!,
      selectedTextStyle: TextStyle.lerp(
        selectedTextStyle,
        other.selectedTextStyle,
        t,
      )!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
      unselectedColor: Color.lerp(unselectedColor, other.unselectedColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchsChipTheme &&
            const DeepCollectionEquality().equals(
              borderColor,
              other.borderColor,
            ) &&
            const DeepCollectionEquality().equals(
              selectedColor,
              other.selectedColor,
            ) &&
            const DeepCollectionEquality().equals(
              selectedTextStyle,
              other.selectedTextStyle,
            ) &&
            const DeepCollectionEquality().equals(textStyle, other.textStyle) &&
            const DeepCollectionEquality().equals(
              unselectedColor,
              other.unselectedColor,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(borderColor),
      const DeepCollectionEquality().hash(selectedColor),
      const DeepCollectionEquality().hash(selectedTextStyle),
      const DeepCollectionEquality().hash(textStyle),
      const DeepCollectionEquality().hash(unselectedColor),
    );
  }
}

mixin _$MatchsHeaderThemeTailorMixin on ThemeExtension<MatchsHeaderTheme> {
  Color get backgroundColor;
  TextStyle get dayTabActiveTextStyle;
  TextStyle get dayTabInactiveTextStyle;
  Color get dayTabSelectedColor;
  TextStyle get subtitleTextStyle;
  TextStyle get titleTextStyle;

  @override
  MatchsHeaderTheme copyWith({
    Color? backgroundColor,
    TextStyle? dayTabActiveTextStyle,
    TextStyle? dayTabInactiveTextStyle,
    Color? dayTabSelectedColor,
    TextStyle? subtitleTextStyle,
    TextStyle? titleTextStyle,
  }) {
    return MatchsHeaderTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      dayTabActiveTextStyle:
          dayTabActiveTextStyle ?? this.dayTabActiveTextStyle,
      dayTabInactiveTextStyle:
          dayTabInactiveTextStyle ?? this.dayTabInactiveTextStyle,
      dayTabSelectedColor: dayTabSelectedColor ?? this.dayTabSelectedColor,
      subtitleTextStyle: subtitleTextStyle ?? this.subtitleTextStyle,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
    );
  }

  @override
  MatchsHeaderTheme lerp(
    covariant ThemeExtension<MatchsHeaderTheme>? other,
    double t,
  ) {
    if (other is! MatchsHeaderTheme) return this as MatchsHeaderTheme;
    return MatchsHeaderTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      dayTabActiveTextStyle: TextStyle.lerp(
        dayTabActiveTextStyle,
        other.dayTabActiveTextStyle,
        t,
      )!,
      dayTabInactiveTextStyle: TextStyle.lerp(
        dayTabInactiveTextStyle,
        other.dayTabInactiveTextStyle,
        t,
      )!,
      dayTabSelectedColor: Color.lerp(
        dayTabSelectedColor,
        other.dayTabSelectedColor,
        t,
      )!,
      subtitleTextStyle: TextStyle.lerp(
        subtitleTextStyle,
        other.subtitleTextStyle,
        t,
      )!,
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchsHeaderTheme &&
            const DeepCollectionEquality().equals(
              backgroundColor,
              other.backgroundColor,
            ) &&
            const DeepCollectionEquality().equals(
              dayTabActiveTextStyle,
              other.dayTabActiveTextStyle,
            ) &&
            const DeepCollectionEquality().equals(
              dayTabInactiveTextStyle,
              other.dayTabInactiveTextStyle,
            ) &&
            const DeepCollectionEquality().equals(
              dayTabSelectedColor,
              other.dayTabSelectedColor,
            ) &&
            const DeepCollectionEquality().equals(
              subtitleTextStyle,
              other.subtitleTextStyle,
            ) &&
            const DeepCollectionEquality().equals(
              titleTextStyle,
              other.titleTextStyle,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(dayTabActiveTextStyle),
      const DeepCollectionEquality().hash(dayTabInactiveTextStyle),
      const DeepCollectionEquality().hash(dayTabSelectedColor),
      const DeepCollectionEquality().hash(subtitleTextStyle),
      const DeepCollectionEquality().hash(titleTextStyle),
    );
  }
}

mixin _$MatchsEmptyStateThemeTailorMixin
    on ThemeExtension<MatchsEmptyStateTheme> {
  Color get iconColor;
  TextStyle get subtitleTextStyle;
  TextStyle get titleTextStyle;

  @override
  MatchsEmptyStateTheme copyWith({
    Color? iconColor,
    TextStyle? subtitleTextStyle,
    TextStyle? titleTextStyle,
  }) {
    return MatchsEmptyStateTheme(
      iconColor: iconColor ?? this.iconColor,
      subtitleTextStyle: subtitleTextStyle ?? this.subtitleTextStyle,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
    );
  }

  @override
  MatchsEmptyStateTheme lerp(
    covariant ThemeExtension<MatchsEmptyStateTheme>? other,
    double t,
  ) {
    if (other is! MatchsEmptyStateTheme) return this as MatchsEmptyStateTheme;
    return MatchsEmptyStateTheme(
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      subtitleTextStyle: TextStyle.lerp(
        subtitleTextStyle,
        other.subtitleTextStyle,
        t,
      )!,
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchsEmptyStateTheme &&
            const DeepCollectionEquality().equals(iconColor, other.iconColor) &&
            const DeepCollectionEquality().equals(
              subtitleTextStyle,
              other.subtitleTextStyle,
            ) &&
            const DeepCollectionEquality().equals(
              titleTextStyle,
              other.titleTextStyle,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(iconColor),
      const DeepCollectionEquality().hash(subtitleTextStyle),
      const DeepCollectionEquality().hash(titleTextStyle),
    );
  }
}

mixin _$MatchsRowThemeTailorMixin on ThemeExtension<MatchsRowTheme> {
  Color get dividerColor;
  TextStyle get finishedTextStyle;
  TextStyle get kickoffTextStyle;
  Color get liveDotColor;
  TextStyle get liveMinuteTextStyle;
  TextStyle get liveScoreTextStyle;
  TextStyle get missingScoreTextStyle;
  TextStyle get scoreTextStyle;
  TextStyle get teamBadgeTextStyle;
  TextStyle get teamNameTextStyle;

  @override
  MatchsRowTheme copyWith({
    Color? dividerColor,
    TextStyle? finishedTextStyle,
    TextStyle? kickoffTextStyle,
    Color? liveDotColor,
    TextStyle? liveMinuteTextStyle,
    TextStyle? liveScoreTextStyle,
    TextStyle? missingScoreTextStyle,
    TextStyle? scoreTextStyle,
    TextStyle? teamBadgeTextStyle,
    TextStyle? teamNameTextStyle,
  }) {
    return MatchsRowTheme(
      dividerColor: dividerColor ?? this.dividerColor,
      finishedTextStyle: finishedTextStyle ?? this.finishedTextStyle,
      kickoffTextStyle: kickoffTextStyle ?? this.kickoffTextStyle,
      liveDotColor: liveDotColor ?? this.liveDotColor,
      liveMinuteTextStyle: liveMinuteTextStyle ?? this.liveMinuteTextStyle,
      liveScoreTextStyle: liveScoreTextStyle ?? this.liveScoreTextStyle,
      missingScoreTextStyle:
          missingScoreTextStyle ?? this.missingScoreTextStyle,
      scoreTextStyle: scoreTextStyle ?? this.scoreTextStyle,
      teamBadgeTextStyle: teamBadgeTextStyle ?? this.teamBadgeTextStyle,
      teamNameTextStyle: teamNameTextStyle ?? this.teamNameTextStyle,
    );
  }

  @override
  MatchsRowTheme lerp(
    covariant ThemeExtension<MatchsRowTheme>? other,
    double t,
  ) {
    if (other is! MatchsRowTheme) return this as MatchsRowTheme;
    return MatchsRowTheme(
      dividerColor: Color.lerp(dividerColor, other.dividerColor, t)!,
      finishedTextStyle: TextStyle.lerp(
        finishedTextStyle,
        other.finishedTextStyle,
        t,
      )!,
      kickoffTextStyle: TextStyle.lerp(
        kickoffTextStyle,
        other.kickoffTextStyle,
        t,
      )!,
      liveDotColor: Color.lerp(liveDotColor, other.liveDotColor, t)!,
      liveMinuteTextStyle: TextStyle.lerp(
        liveMinuteTextStyle,
        other.liveMinuteTextStyle,
        t,
      )!,
      liveScoreTextStyle: TextStyle.lerp(
        liveScoreTextStyle,
        other.liveScoreTextStyle,
        t,
      )!,
      missingScoreTextStyle: TextStyle.lerp(
        missingScoreTextStyle,
        other.missingScoreTextStyle,
        t,
      )!,
      scoreTextStyle: TextStyle.lerp(scoreTextStyle, other.scoreTextStyle, t)!,
      teamBadgeTextStyle: TextStyle.lerp(
        teamBadgeTextStyle,
        other.teamBadgeTextStyle,
        t,
      )!,
      teamNameTextStyle: TextStyle.lerp(
        teamNameTextStyle,
        other.teamNameTextStyle,
        t,
      )!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchsRowTheme &&
            const DeepCollectionEquality().equals(
              dividerColor,
              other.dividerColor,
            ) &&
            const DeepCollectionEquality().equals(
              finishedTextStyle,
              other.finishedTextStyle,
            ) &&
            const DeepCollectionEquality().equals(
              kickoffTextStyle,
              other.kickoffTextStyle,
            ) &&
            const DeepCollectionEquality().equals(
              liveDotColor,
              other.liveDotColor,
            ) &&
            const DeepCollectionEquality().equals(
              liveMinuteTextStyle,
              other.liveMinuteTextStyle,
            ) &&
            const DeepCollectionEquality().equals(
              liveScoreTextStyle,
              other.liveScoreTextStyle,
            ) &&
            const DeepCollectionEquality().equals(
              missingScoreTextStyle,
              other.missingScoreTextStyle,
            ) &&
            const DeepCollectionEquality().equals(
              scoreTextStyle,
              other.scoreTextStyle,
            ) &&
            const DeepCollectionEquality().equals(
              teamBadgeTextStyle,
              other.teamBadgeTextStyle,
            ) &&
            const DeepCollectionEquality().equals(
              teamNameTextStyle,
              other.teamNameTextStyle,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(dividerColor),
      const DeepCollectionEquality().hash(finishedTextStyle),
      const DeepCollectionEquality().hash(kickoffTextStyle),
      const DeepCollectionEquality().hash(liveDotColor),
      const DeepCollectionEquality().hash(liveMinuteTextStyle),
      const DeepCollectionEquality().hash(liveScoreTextStyle),
      const DeepCollectionEquality().hash(missingScoreTextStyle),
      const DeepCollectionEquality().hash(scoreTextStyle),
      const DeepCollectionEquality().hash(teamBadgeTextStyle),
      const DeepCollectionEquality().hash(teamNameTextStyle),
    );
  }
}

mixin _$MatchsThemeTailorMixin on ThemeExtension<MatchsTheme> {
  Color get backgroundColor;
  Color get cardColor;
  double get cardRadius;
  List<BoxShadow> get cardShadow;
  MatchsChipTheme get chipTheme;
  TextStyle get competitionCountryTextStyle;
  TextStyle get competitionNameTextStyle;
  MatchsEmptyStateTheme get emptyStateTheme;
  MatchsHeaderTheme get headerTheme;
  MatchsRowTheme get rowTheme;
  TextStyle get sectionTitleTextStyle;

  @override
  MatchsTheme copyWith({
    Color? backgroundColor,
    Color? cardColor,
    double? cardRadius,
    List<BoxShadow>? cardShadow,
    MatchsChipTheme? chipTheme,
    TextStyle? competitionCountryTextStyle,
    TextStyle? competitionNameTextStyle,
    MatchsEmptyStateTheme? emptyStateTheme,
    MatchsHeaderTheme? headerTheme,
    MatchsRowTheme? rowTheme,
    TextStyle? sectionTitleTextStyle,
  }) {
    return MatchsTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      cardColor: cardColor ?? this.cardColor,
      cardRadius: cardRadius ?? this.cardRadius,
      cardShadow: cardShadow ?? this.cardShadow,
      chipTheme: chipTheme ?? this.chipTheme,
      competitionCountryTextStyle:
          competitionCountryTextStyle ?? this.competitionCountryTextStyle,
      competitionNameTextStyle:
          competitionNameTextStyle ?? this.competitionNameTextStyle,
      emptyStateTheme: emptyStateTheme ?? this.emptyStateTheme,
      headerTheme: headerTheme ?? this.headerTheme,
      rowTheme: rowTheme ?? this.rowTheme,
      sectionTitleTextStyle:
          sectionTitleTextStyle ?? this.sectionTitleTextStyle,
    );
  }

  @override
  MatchsTheme lerp(covariant ThemeExtension<MatchsTheme>? other, double t) {
    if (other is! MatchsTheme) return this as MatchsTheme;
    return MatchsTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      cardColor: Color.lerp(cardColor, other.cardColor, t)!,
      cardRadius: t < 0.5 ? cardRadius : other.cardRadius,
      cardShadow: t < 0.5 ? cardShadow : other.cardShadow,
      chipTheme: chipTheme.lerp(other.chipTheme, t),
      competitionCountryTextStyle: TextStyle.lerp(
        competitionCountryTextStyle,
        other.competitionCountryTextStyle,
        t,
      )!,
      competitionNameTextStyle: TextStyle.lerp(
        competitionNameTextStyle,
        other.competitionNameTextStyle,
        t,
      )!,
      emptyStateTheme: emptyStateTheme.lerp(other.emptyStateTheme, t),
      headerTheme: headerTheme.lerp(other.headerTheme, t),
      rowTheme: rowTheme.lerp(other.rowTheme, t),
      sectionTitleTextStyle: TextStyle.lerp(
        sectionTitleTextStyle,
        other.sectionTitleTextStyle,
        t,
      )!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchsTheme &&
            const DeepCollectionEquality().equals(
              backgroundColor,
              other.backgroundColor,
            ) &&
            const DeepCollectionEquality().equals(cardColor, other.cardColor) &&
            const DeepCollectionEquality().equals(
              cardRadius,
              other.cardRadius,
            ) &&
            const DeepCollectionEquality().equals(
              cardShadow,
              other.cardShadow,
            ) &&
            const DeepCollectionEquality().equals(chipTheme, other.chipTheme) &&
            const DeepCollectionEquality().equals(
              competitionCountryTextStyle,
              other.competitionCountryTextStyle,
            ) &&
            const DeepCollectionEquality().equals(
              competitionNameTextStyle,
              other.competitionNameTextStyle,
            ) &&
            const DeepCollectionEquality().equals(
              emptyStateTheme,
              other.emptyStateTheme,
            ) &&
            const DeepCollectionEquality().equals(
              headerTheme,
              other.headerTheme,
            ) &&
            const DeepCollectionEquality().equals(rowTheme, other.rowTheme) &&
            const DeepCollectionEquality().equals(
              sectionTitleTextStyle,
              other.sectionTitleTextStyle,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(cardColor),
      const DeepCollectionEquality().hash(cardRadius),
      const DeepCollectionEquality().hash(cardShadow),
      const DeepCollectionEquality().hash(chipTheme),
      const DeepCollectionEquality().hash(competitionCountryTextStyle),
      const DeepCollectionEquality().hash(competitionNameTextStyle),
      const DeepCollectionEquality().hash(emptyStateTheme),
      const DeepCollectionEquality().hash(headerTheme),
      const DeepCollectionEquality().hash(rowTheme),
      const DeepCollectionEquality().hash(sectionTitleTextStyle),
    );
  }
}
