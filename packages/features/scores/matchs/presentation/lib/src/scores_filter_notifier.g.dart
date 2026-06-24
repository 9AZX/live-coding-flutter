// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scores_filter_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Filtre sélectionné via les chips de la page Matchs.

@ProviderFor(ScoresFilter)
final scoresFilterProvider = ScoresFilterProvider._();

/// Filtre sélectionné via les chips de la page Matchs.
final class ScoresFilterProvider extends $NotifierProvider<ScoresFilter, MatchFilter> {
  /// Filtre sélectionné via les chips de la page Matchs.
  ScoresFilterProvider._()
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
  String debugGetCreateSourceHash() => _$scoresFilterHash();

  @$internal
  @override
  ScoresFilter create() => ScoresFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MatchFilter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MatchFilter>(value),
    );
  }
}

String _$scoresFilterHash() => r'04f14301d38dd2b48f32d1e22211812821a46ff5';

/// Filtre sélectionné via les chips de la page Matchs.

abstract class _$ScoresFilter extends $Notifier<MatchFilter> {
  MatchFilter build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<MatchFilter, MatchFilter>;
    final element =
        ref.element as $ClassProviderElement<AnyNotifier<MatchFilter, MatchFilter>, MatchFilter, Object?, Object?>;
    return element.handleCreate(ref, build);
  }
}
