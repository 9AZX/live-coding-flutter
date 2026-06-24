// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_day_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Jour sélectionné via les onglets Hier / Aujourd'hui / Demain.

@ProviderFor(SelectedDay)
final selectedDayProvider = SelectedDayProvider._();

/// Jour sélectionné via les onglets Hier / Aujourd'hui / Demain.
final class SelectedDayProvider
    extends $NotifierProvider<SelectedDay, MatchDay> {
  /// Jour sélectionné via les onglets Hier / Aujourd'hui / Demain.
  SelectedDayProvider._()
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
  String debugGetCreateSourceHash() => _$selectedDayHash();

  @$internal
  @override
  SelectedDay create() => SelectedDay();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MatchDay value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MatchDay>(value),
    );
  }
}

String _$selectedDayHash() => r'1e8e0f6b6acce5812e59aad206e3ca7453163838';

/// Jour sélectionné via les onglets Hier / Aujourd'hui / Demain.

abstract class _$SelectedDay extends $Notifier<MatchDay> {
  MatchDay build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<MatchDay, MatchDay>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MatchDay, MatchDay>,
              MatchDay,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
