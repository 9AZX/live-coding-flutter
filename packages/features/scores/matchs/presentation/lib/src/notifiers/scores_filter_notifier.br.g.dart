// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scores_filter_notifier.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Filtre sélectionné via les chips de l'écran Matchs.

@ProviderFor(ScoresFilterNotifier)
final scoresFilterProvider = ScoresFilterNotifierProvider._();

/// Filtre sélectionné via les chips de l'écran Matchs.
final class ScoresFilterNotifierProvider
    extends $NotifierProvider<ScoresFilterNotifier, MatchFilter> {
  /// Filtre sélectionné via les chips de l'écran Matchs.
  ScoresFilterNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scoresFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scoresFilterNotifierHash();

  @$internal
  @override
  ScoresFilterNotifier create() => ScoresFilterNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MatchFilter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MatchFilter>(value),
    );
  }
}

String _$scoresFilterNotifierHash() =>
    r'bdad3298d3453efcc4ffd17de5d81a47ed742587';

/// Filtre sélectionné via les chips de l'écran Matchs.

abstract class _$ScoresFilterNotifier extends $Notifier<MatchFilter> {
  MatchFilter build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<MatchFilter, MatchFilter>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MatchFilter, MatchFilter>,
              MatchFilter,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
