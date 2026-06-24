// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Flux brut de tous les matchs.

@ProviderFor(watchMatches)
final watchMatchesProvider = WatchMatchesProvider._();

/// Flux brut de tous les matchs.

final class WatchMatchesProvider extends $FunctionalProvider<AsyncValue<List<Match>>, List<Match>, Stream<List<Match>>>
    with $FutureModifier<List<Match>>, $StreamProvider<List<Match>> {
  /// Flux brut de tous les matchs.
  WatchMatchesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchMatchesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchMatchesHash();

  @$internal
  @override
  $StreamProviderElement<List<Match>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Match>> create(Ref ref) {
    return watchMatches(ref);
  }
}

String _$watchMatchesHash() => r'a73a7c8bb8fe3db43990e5b5d0c765025d0b6fbe';

/// Matchs filtrés et regroupés par compétition (Matchs + En direct).

@ProviderFor(watchMatchGroups)
final watchMatchGroupsProvider = WatchMatchGroupsFamily._();

/// Matchs filtrés et regroupés par compétition (Matchs + En direct).

final class WatchMatchGroupsProvider
    extends $FunctionalProvider<AsyncValue<List<MatchGroup>>, List<MatchGroup>, Stream<List<MatchGroup>>>
    with $FutureModifier<List<MatchGroup>>, $StreamProvider<List<MatchGroup>> {
  /// Matchs filtrés et regroupés par compétition (Matchs + En direct).
  WatchMatchGroupsProvider._({
    required WatchMatchGroupsFamily super.from,
    required MatchFilter super.argument,
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
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<MatchGroup>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<MatchGroup>> create(Ref ref) {
    final argument = this.argument as MatchFilter;
    return watchMatchGroups(ref, argument);
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

String _$watchMatchGroupsHash() => r'344ce02864fbf04d5f6cfb4ffc759203d26bd576';

/// Matchs filtrés et regroupés par compétition (Matchs + En direct).

final class WatchMatchGroupsFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<MatchGroup>>, MatchFilter> {
  WatchMatchGroupsFamily._()
    : super(
        retry: null,
        name: r'watchMatchGroupsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Matchs filtrés et regroupés par compétition (Matchs + En direct).

  WatchMatchGroupsProvider call(MatchFilter filter) => WatchMatchGroupsProvider._(argument: filter, from: this);

  @override
  String toString() => r'watchMatchGroupsProvider';
}

/// Flux d'un match précis (page détail).

@ProviderFor(watchMatch)
final watchMatchProvider = WatchMatchFamily._();

/// Flux d'un match précis (page détail).

final class WatchMatchProvider extends $FunctionalProvider<AsyncValue<Match?>, Match?, Stream<Match?>>
    with $FutureModifier<Match?>, $StreamProvider<Match?> {
  /// Flux d'un match précis (page détail).
  WatchMatchProvider._({
    required WatchMatchFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'watchMatchProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$watchMatchHash();

  @override
  String toString() {
    return r'watchMatchProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<Match?> $createElement($ProviderPointer pointer) => $StreamProviderElement(pointer);

  @override
  Stream<Match?> create(Ref ref) {
    final argument = this.argument as String;
    return watchMatch(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchMatchProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$watchMatchHash() => r'9d679cbfd9635148ca285c4b679337f4b0d38482';

/// Flux d'un match précis (page détail).

final class WatchMatchFamily extends $Family with $FunctionalFamilyOverride<Stream<Match?>, String> {
  WatchMatchFamily._()
    : super(
        retry: null,
        name: r'watchMatchProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Flux d'un match précis (page détail).

  WatchMatchProvider call(String id) => WatchMatchProvider._(argument: id, from: this);

  @override
  String toString() => r'watchMatchProvider';
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
