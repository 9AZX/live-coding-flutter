// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_detail_theme.br.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$MatchDetailHeaderThemeTailorMixin
    on ThemeExtension<MatchDetailHeaderTheme> {
  Color get backgroundColor;
  TextStyle get competitionTextStyle;
  TextStyle get scoreTextStyle;
  TextStyle get statusTextStyle;
  TextStyle get teamNameTextStyle;

  @override
  MatchDetailHeaderTheme copyWith({
    Color? backgroundColor,
    TextStyle? competitionTextStyle,
    TextStyle? scoreTextStyle,
    TextStyle? statusTextStyle,
    TextStyle? teamNameTextStyle,
  }) {
    return MatchDetailHeaderTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      competitionTextStyle: competitionTextStyle ?? this.competitionTextStyle,
      scoreTextStyle: scoreTextStyle ?? this.scoreTextStyle,
      statusTextStyle: statusTextStyle ?? this.statusTextStyle,
      teamNameTextStyle: teamNameTextStyle ?? this.teamNameTextStyle,
    );
  }

  @override
  MatchDetailHeaderTheme lerp(
    covariant ThemeExtension<MatchDetailHeaderTheme>? other,
    double t,
  ) {
    if (other is! MatchDetailHeaderTheme) return this as MatchDetailHeaderTheme;
    return MatchDetailHeaderTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      competitionTextStyle: TextStyle.lerp(
        competitionTextStyle,
        other.competitionTextStyle,
        t,
      )!,
      scoreTextStyle: TextStyle.lerp(scoreTextStyle, other.scoreTextStyle, t)!,
      statusTextStyle: TextStyle.lerp(
        statusTextStyle,
        other.statusTextStyle,
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
            other is MatchDetailHeaderTheme &&
            const DeepCollectionEquality().equals(
              backgroundColor,
              other.backgroundColor,
            ) &&
            const DeepCollectionEquality().equals(
              competitionTextStyle,
              other.competitionTextStyle,
            ) &&
            const DeepCollectionEquality().equals(
              scoreTextStyle,
              other.scoreTextStyle,
            ) &&
            const DeepCollectionEquality().equals(
              statusTextStyle,
              other.statusTextStyle,
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
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(competitionTextStyle),
      const DeepCollectionEquality().hash(scoreTextStyle),
      const DeepCollectionEquality().hash(statusTextStyle),
      const DeepCollectionEquality().hash(teamNameTextStyle),
    );
  }
}

mixin _$MatchDetailTabsThemeTailorMixin
    on ThemeExtension<MatchDetailTabsTheme> {
  TextStyle get activeTabTextStyle;
  Color get dividerColor;
  TextStyle get emptyTextStyle;
  Color get goalColor;
  TextStyle get inactiveTabTextStyle;
  TextStyle get minuteTextStyle;
  TextStyle get playerTextStyle;
  Color get redCardColor;
  Color get selectedTabColor;
  Color get yellowCardColor;

  @override
  MatchDetailTabsTheme copyWith({
    TextStyle? activeTabTextStyle,
    Color? dividerColor,
    TextStyle? emptyTextStyle,
    Color? goalColor,
    TextStyle? inactiveTabTextStyle,
    TextStyle? minuteTextStyle,
    TextStyle? playerTextStyle,
    Color? redCardColor,
    Color? selectedTabColor,
    Color? yellowCardColor,
  }) {
    return MatchDetailTabsTheme(
      activeTabTextStyle: activeTabTextStyle ?? this.activeTabTextStyle,
      dividerColor: dividerColor ?? this.dividerColor,
      emptyTextStyle: emptyTextStyle ?? this.emptyTextStyle,
      goalColor: goalColor ?? this.goalColor,
      inactiveTabTextStyle: inactiveTabTextStyle ?? this.inactiveTabTextStyle,
      minuteTextStyle: minuteTextStyle ?? this.minuteTextStyle,
      playerTextStyle: playerTextStyle ?? this.playerTextStyle,
      redCardColor: redCardColor ?? this.redCardColor,
      selectedTabColor: selectedTabColor ?? this.selectedTabColor,
      yellowCardColor: yellowCardColor ?? this.yellowCardColor,
    );
  }

  @override
  MatchDetailTabsTheme lerp(
    covariant ThemeExtension<MatchDetailTabsTheme>? other,
    double t,
  ) {
    if (other is! MatchDetailTabsTheme) return this as MatchDetailTabsTheme;
    return MatchDetailTabsTheme(
      activeTabTextStyle: TextStyle.lerp(
        activeTabTextStyle,
        other.activeTabTextStyle,
        t,
      )!,
      dividerColor: Color.lerp(dividerColor, other.dividerColor, t)!,
      emptyTextStyle: TextStyle.lerp(emptyTextStyle, other.emptyTextStyle, t)!,
      goalColor: Color.lerp(goalColor, other.goalColor, t)!,
      inactiveTabTextStyle: TextStyle.lerp(
        inactiveTabTextStyle,
        other.inactiveTabTextStyle,
        t,
      )!,
      minuteTextStyle: TextStyle.lerp(
        minuteTextStyle,
        other.minuteTextStyle,
        t,
      )!,
      playerTextStyle: TextStyle.lerp(
        playerTextStyle,
        other.playerTextStyle,
        t,
      )!,
      redCardColor: Color.lerp(redCardColor, other.redCardColor, t)!,
      selectedTabColor: Color.lerp(
        selectedTabColor,
        other.selectedTabColor,
        t,
      )!,
      yellowCardColor: Color.lerp(yellowCardColor, other.yellowCardColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchDetailTabsTheme &&
            const DeepCollectionEquality().equals(
              activeTabTextStyle,
              other.activeTabTextStyle,
            ) &&
            const DeepCollectionEquality().equals(
              dividerColor,
              other.dividerColor,
            ) &&
            const DeepCollectionEquality().equals(
              emptyTextStyle,
              other.emptyTextStyle,
            ) &&
            const DeepCollectionEquality().equals(goalColor, other.goalColor) &&
            const DeepCollectionEquality().equals(
              inactiveTabTextStyle,
              other.inactiveTabTextStyle,
            ) &&
            const DeepCollectionEquality().equals(
              minuteTextStyle,
              other.minuteTextStyle,
            ) &&
            const DeepCollectionEquality().equals(
              playerTextStyle,
              other.playerTextStyle,
            ) &&
            const DeepCollectionEquality().equals(
              redCardColor,
              other.redCardColor,
            ) &&
            const DeepCollectionEquality().equals(
              selectedTabColor,
              other.selectedTabColor,
            ) &&
            const DeepCollectionEquality().equals(
              yellowCardColor,
              other.yellowCardColor,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(activeTabTextStyle),
      const DeepCollectionEquality().hash(dividerColor),
      const DeepCollectionEquality().hash(emptyTextStyle),
      const DeepCollectionEquality().hash(goalColor),
      const DeepCollectionEquality().hash(inactiveTabTextStyle),
      const DeepCollectionEquality().hash(minuteTextStyle),
      const DeepCollectionEquality().hash(playerTextStyle),
      const DeepCollectionEquality().hash(redCardColor),
      const DeepCollectionEquality().hash(selectedTabColor),
      const DeepCollectionEquality().hash(yellowCardColor),
    );
  }
}

mixin _$MatchDetailThemeTailorMixin on ThemeExtension<MatchDetailTheme> {
  Color get backgroundColor;
  MatchDetailHeaderTheme get headerTheme;
  MatchDetailTabsTheme get tabsTheme;

  @override
  MatchDetailTheme copyWith({
    Color? backgroundColor,
    MatchDetailHeaderTheme? headerTheme,
    MatchDetailTabsTheme? tabsTheme,
  }) {
    return MatchDetailTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      headerTheme: headerTheme ?? this.headerTheme,
      tabsTheme: tabsTheme ?? this.tabsTheme,
    );
  }

  @override
  MatchDetailTheme lerp(
    covariant ThemeExtension<MatchDetailTheme>? other,
    double t,
  ) {
    if (other is! MatchDetailTheme) return this as MatchDetailTheme;
    return MatchDetailTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      headerTheme: headerTheme.lerp(other.headerTheme, t),
      tabsTheme: tabsTheme.lerp(other.tabsTheme, t),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchDetailTheme &&
            const DeepCollectionEquality().equals(
              backgroundColor,
              other.backgroundColor,
            ) &&
            const DeepCollectionEquality().equals(
              headerTheme,
              other.headerTheme,
            ) &&
            const DeepCollectionEquality().equals(tabsTheme, other.tabsTheme));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(headerTheme),
      const DeepCollectionEquality().hash(tabsTheme),
    );
  }
}
