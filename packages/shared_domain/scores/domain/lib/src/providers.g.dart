// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Flux des matchs d'un jour donné (une seule souscription par jour).

@ProviderFor(watchMatches)
final watchMatchesProvider = WatchMatchesFamily._();

/// Flux des matchs d'un jour donné (une seule souscription par jour).

final class WatchMatchesProvider extends $FunctionalProvider<AsyncValue<List<Match>>, List<Match>, Stream<List<Match>>>
    with $FutureModifier<List<Match>>, $StreamProvider<List<Match>> {
  /// Flux des matchs d'un jour donné (une seule souscription par jour).
  WatchMatchesProvider._({
    required WatchMatchesFamily super.from,
    required MatchDay super.argument,
  }) : super(
         retry: null,
         name: r'watchMatchesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$watchMatchesHash();

  @override
  String toString() {
    return r'watchMatchesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<Match>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Match>> create(Ref ref) {
    final argument = this.argument as MatchDay;
    return watchMatches(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchMatchesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$watchMatchesHash() => r'6e37cfb3e21c8a654d5529be4c34e058b98e433e';

/// Flux des matchs d'un jour donné (une seule souscription par jour).

final class WatchMatchesFamily extends $Family with $FunctionalFamilyOverride<Stream<List<Match>>, MatchDay> {
  WatchMatchesFamily._()
    : super(
        retry: null,
        name: r'watchMatchesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Flux des matchs d'un jour donné (une seule souscription par jour).

  WatchMatchesProvider call(MatchDay day) => WatchMatchesProvider._(argument: day, from: this);

  @override
  String toString() => r'watchMatchesProvider';
}

/// Matchs filtrés et regroupés par compétition, dérivés de [watchMatches]
/// (pas de fetch supplémentaire). Utilisé par Matchs + En direct + les compteurs.

@ProviderFor(watchMatchGroups)
final watchMatchGroupsProvider = WatchMatchGroupsFamily._();

/// Matchs filtrés et regroupés par compétition, dérivés de [watchMatches]
/// (pas de fetch supplémentaire). Utilisé par Matchs + En direct + les compteurs.

final class WatchMatchGroupsProvider
    extends
        $FunctionalProvider<AsyncValue<List<MatchGroup>>, AsyncValue<List<MatchGroup>>, AsyncValue<List<MatchGroup>>>
    with $Provider<AsyncValue<List<MatchGroup>>> {
  /// Matchs filtrés et regroupés par compétition, dérivés de [watchMatches]
  /// (pas de fetch supplémentaire). Utilisé par Matchs + En direct + les compteurs.
  WatchMatchGroupsProvider._({
    required WatchMatchGroupsFamily super.from,
    required (MatchFilter, MatchDay) super.argument,
  }) : super(
         retry: null,
         name: r'watchMatchGroupsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$watchMatchGroupsHash();

  @override
  String toString() {
    return r'watchMatchGroupsProvider'
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
    return watchMatchGroups(ref, argument.$1, argument.$2);
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
    return other is WatchMatchGroupsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$watchMatchGroupsHash() => r'd6d6f8566ab240912a2e60fa6cc81ec3b87c4414';

/// Matchs filtrés et regroupés par compétition, dérivés de [watchMatches]
/// (pas de fetch supplémentaire). Utilisé par Matchs + En direct + les compteurs.

final class WatchMatchGroupsFamily extends $Family
    with $FunctionalFamilyOverride<AsyncValue<List<MatchGroup>>, (MatchFilter, MatchDay)> {
  WatchMatchGroupsFamily._()
    : super(
        retry: null,
        name: r'watchMatchGroupsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Matchs filtrés et regroupés par compétition, dérivés de [watchMatches]
  /// (pas de fetch supplémentaire). Utilisé par Matchs + En direct + les compteurs.

  WatchMatchGroupsProvider call(MatchFilter filter, MatchDay day) =>
      WatchMatchGroupsProvider._(argument: (filter, day), from: this);

  @override
  String toString() => r'watchMatchGroupsProvider';
}

/// Ids des matchs favoris — partagé par toutes les features.

@ProviderFor(favoriteMatchIds)
final favoriteMatchIdsProvider = FavoriteMatchIdsProvider._();

/// Ids des matchs favoris — partagé par toutes les features.

final class FavoriteMatchIdsProvider
    extends $FunctionalProvider<AsyncValue<Set<String>>, Set<String>, Stream<Set<String>>>
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
