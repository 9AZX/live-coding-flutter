// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fetchMatch)
final fetchMatchProvider = FetchMatchProvider._();

final class FetchMatchProvider
    extends $FunctionalProvider<FetchMatch, FetchMatch, FetchMatch>
    with $Provider<FetchMatch> {
  FetchMatchProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchMatchProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchMatchHash();

  @$internal
  @override
  $ProviderElement<FetchMatch> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FetchMatch create(Ref ref) {
    return fetchMatch(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FetchMatch value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FetchMatch>(value),
    );
  }
}

String _$fetchMatchHash() => r'5f7e11688b88e1e5b8792131acf78f06c0d7a81d';

@ProviderFor(fetchMatches)
final fetchMatchesProvider = FetchMatchesProvider._();

final class FetchMatchesProvider
    extends $FunctionalProvider<FetchMatches, FetchMatches, FetchMatches>
    with $Provider<FetchMatches> {
  FetchMatchesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchMatchesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchMatchesHash();

  @$internal
  @override
  $ProviderElement<FetchMatches> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FetchMatches create(Ref ref) {
    return fetchMatches(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FetchMatches value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FetchMatches>(value),
    );
  }
}

String _$fetchMatchesHash() => r'6f3c22e22fd89945c763d482c6d7b8e2353114f2';

@ProviderFor(groupMatches)
final groupMatchesProvider = GroupMatchesProvider._();

final class GroupMatchesProvider
    extends $FunctionalProvider<GroupMatches, GroupMatches, GroupMatches>
    with $Provider<GroupMatches> {
  GroupMatchesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'groupMatchesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$groupMatchesHash();

  @$internal
  @override
  $ProviderElement<GroupMatches> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GroupMatches create(Ref ref) {
    return groupMatches(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GroupMatches value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GroupMatches>(value),
    );
  }
}

String _$groupMatchesHash() => r'109ca6fc2e4a9ac885f4245a1769b5284e968307';

@ProviderFor(toggleFavoriteMatch)
final toggleFavoriteMatchProvider = ToggleFavoriteMatchProvider._();

final class ToggleFavoriteMatchProvider
    extends
        $FunctionalProvider<
          ToggleFavoriteMatch,
          ToggleFavoriteMatch,
          ToggleFavoriteMatch
        >
    with $Provider<ToggleFavoriteMatch> {
  ToggleFavoriteMatchProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'toggleFavoriteMatchProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$toggleFavoriteMatchHash();

  @$internal
  @override
  $ProviderElement<ToggleFavoriteMatch> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ToggleFavoriteMatch create(Ref ref) {
    return toggleFavoriteMatch(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ToggleFavoriteMatch value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ToggleFavoriteMatch>(value),
    );
  }
}

String _$toggleFavoriteMatchHash() =>
    r'13d3ee60305b102ba440304d1be2976bafa82bef';

/// Ids des matchs favoris — partagé par toutes les features.

@ProviderFor(favoriteMatchIds)
final favoriteMatchIdsProvider = FavoriteMatchIdsProvider._();

/// Ids des matchs favoris — partagé par toutes les features.

final class FavoriteMatchIdsProvider
    extends
        $FunctionalProvider<
          AsyncValue<Set<String>>,
          Set<String>,
          Stream<Set<String>>
        >
    with $FutureModifier<Set<String>>, $StreamProvider<Set<String>> {
  /// Ids des matchs favoris — partagé par toutes les features.
  FavoriteMatchIdsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoriteMatchIdsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoriteMatchIdsHash();

  @$internal
  @override
  $StreamProviderElement<Set<String>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Set<String>> create(Ref ref) {
    return favoriteMatchIds(ref);
  }
}

String _$favoriteMatchIdsHash() => r'5eee3ce7641aecd22932339509300ce0e46f6a74';

/// Matchs d'un jour donné (un seul appel par jour). `getOrThrow` reporte l'échec
/// du `Result` dans l'`AsyncValue` : la présentation lit un `AsyncError` typé.

@ProviderFor(matches)
final matchesProvider = MatchesFamily._();

/// Matchs d'un jour donné (un seul appel par jour). `getOrThrow` reporte l'échec
/// du `Result` dans l'`AsyncValue` : la présentation lit un `AsyncError` typé.

final class MatchesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Match>>,
          List<Match>,
          FutureOr<List<Match>>
        >
    with $FutureModifier<List<Match>>, $FutureProvider<List<Match>> {
  /// Matchs d'un jour donné (un seul appel par jour). `getOrThrow` reporte l'échec
  /// du `Result` dans l'`AsyncValue` : la présentation lit un `AsyncError` typé.
  MatchesProvider._({
    required MatchesFamily super.from,
    required MatchDay super.argument,
  }) : super(
         retry: null,
         name: r'matchesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$matchesHash();

  @override
  String toString() {
    return r'matchesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Match>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Match>> create(Ref ref) {
    final argument = this.argument as MatchDay;
    return matches(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is MatchesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$matchesHash() => r'55d36ad5ef66ce421bd99717629a438bfbcb28ca';

/// Matchs d'un jour donné (un seul appel par jour). `getOrThrow` reporte l'échec
/// du `Result` dans l'`AsyncValue` : la présentation lit un `AsyncError` typé.

final class MatchesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Match>>, MatchDay> {
  MatchesFamily._()
    : super(
        retry: null,
        name: r'matchesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Matchs d'un jour donné (un seul appel par jour). `getOrThrow` reporte l'échec
  /// du `Result` dans l'`AsyncValue` : la présentation lit un `AsyncError` typé.

  MatchesProvider call(MatchDay day) =>
      MatchesProvider._(argument: day, from: this);

  @override
  String toString() => r'matchesProvider';
}

/// Matchs filtrés et regroupés par compétition, dérivés de [matches] (pas d'appel
/// supplémentaire). Utilisé par Matchs + En direct + les compteurs.

@ProviderFor(matchGroups)
final matchGroupsProvider = MatchGroupsFamily._();

/// Matchs filtrés et regroupés par compétition, dérivés de [matches] (pas d'appel
/// supplémentaire). Utilisé par Matchs + En direct + les compteurs.

final class MatchGroupsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<MatchGroup>>,
          AsyncValue<List<MatchGroup>>,
          AsyncValue<List<MatchGroup>>
        >
    with $Provider<AsyncValue<List<MatchGroup>>> {
  /// Matchs filtrés et regroupés par compétition, dérivés de [matches] (pas d'appel
  /// supplémentaire). Utilisé par Matchs + En direct + les compteurs.
  MatchGroupsProvider._({
    required MatchGroupsFamily super.from,
    required (MatchFilter, MatchDay) super.argument,
  }) : super(
         retry: null,
         name: r'matchGroupsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$matchGroupsHash();

  @override
  String toString() {
    return r'matchGroupsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<AsyncValue<List<MatchGroup>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AsyncValue<List<MatchGroup>> create(Ref ref) {
    final argument = this.argument as (MatchFilter, MatchDay);
    return matchGroups(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<MatchGroup>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<MatchGroup>>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MatchGroupsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$matchGroupsHash() => r'c09e6ead08566a9e89e68457137cf4a906fd789e';

/// Matchs filtrés et regroupés par compétition, dérivés de [matches] (pas d'appel
/// supplémentaire). Utilisé par Matchs + En direct + les compteurs.

final class MatchGroupsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          AsyncValue<List<MatchGroup>>,
          (MatchFilter, MatchDay)
        > {
  MatchGroupsFamily._()
    : super(
        retry: null,
        name: r'matchGroupsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Matchs filtrés et regroupés par compétition, dérivés de [matches] (pas d'appel
  /// supplémentaire). Utilisé par Matchs + En direct + les compteurs.

  MatchGroupsProvider call(MatchFilter filter, MatchDay day) =>
      MatchGroupsProvider._(argument: (filter, day), from: this);

  @override
  String toString() => r'matchGroupsProvider';
}

/// Une rencontre et son détail. Même conversion que [matches] : l'échec du `Result`
/// atterrit dans l'`AsyncValue`, l'écran détail lit un `AsyncError`.

@ProviderFor(match)
final matchProvider = MatchFamily._();

/// Une rencontre et son détail. Même conversion que [matches] : l'échec du `Result`
/// atterrit dans l'`AsyncValue`, l'écran détail lit un `AsyncError`.

final class MatchProvider
    extends $FunctionalProvider<AsyncValue<Match>, Match, FutureOr<Match>>
    with $FutureModifier<Match>, $FutureProvider<Match> {
  /// Une rencontre et son détail. Même conversion que [matches] : l'échec du `Result`
  /// atterrit dans l'`AsyncValue`, l'écran détail lit un `AsyncError`.
  MatchProvider._({
    required MatchFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'matchProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$matchHash();

  @override
  String toString() {
    return r'matchProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Match> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Match> create(Ref ref) {
    final argument = this.argument as String;
    return match(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is MatchProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$matchHash() => r'0f11b744a21e451a153ef57cbe53e4a20fd183c8';

/// Une rencontre et son détail. Même conversion que [matches] : l'échec du `Result`
/// atterrit dans l'`AsyncValue`, l'écran détail lit un `AsyncError`.

final class MatchFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Match>, String> {
  MatchFamily._()
    : super(
        retry: null,
        name: r'matchProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Une rencontre et son détail. Même conversion que [matches] : l'échec du `Result`
  /// atterrit dans l'`AsyncValue`, l'écran détail lit un `AsyncError`.

  MatchProvider call(String id) => MatchProvider._(argument: id, from: this);

  @override
  String toString() => r'matchProvider';
}
