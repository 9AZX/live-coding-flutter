// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_day_notifier.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Jour sélectionné via les onglets Hier / Aujourd'hui / Demain.

@ProviderFor(SelectedDayNotifier)
final selectedDayProvider = SelectedDayNotifierProvider._();

/// Jour sélectionné via les onglets Hier / Aujourd'hui / Demain.
final class SelectedDayNotifierProvider
    extends $NotifierProvider<SelectedDayNotifier, MatchDay> {
  /// Jour sélectionné via les onglets Hier / Aujourd'hui / Demain.
  SelectedDayNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedDayProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedDayNotifierHash();

  @$internal
  @override
  SelectedDayNotifier create() => SelectedDayNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MatchDay value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MatchDay>(value),
    );
  }
}

String _$selectedDayNotifierHash() =>
    r'f8bc18a0fb03120470765d8685f37917b71e313f';

/// Jour sélectionné via les onglets Hier / Aujourd'hui / Demain.

abstract class _$SelectedDayNotifier extends $Notifier<MatchDay> {
  MatchDay build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<MatchDay, MatchDay>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MatchDay, MatchDay>,
              MatchDay,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
