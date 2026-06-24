// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_tab_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectedTab)
final selectedTabProvider = SelectedTabProvider._();

final class SelectedTabProvider extends $NotifierProvider<SelectedTab, ScoresTab> {
  SelectedTabProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedTabProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedTabHash();

  @$internal
  @override
  SelectedTab create() => SelectedTab();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ScoresTab value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ScoresTab>(value),
    );
  }
}

String _$selectedTabHash() => r'5b120dc703dd238afa9eff965dc2aef639cac78b';

abstract class _$SelectedTab extends $Notifier<ScoresTab> {
  ScoresTab build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ScoresTab, ScoresTab>;
    final element =
        ref.element as $ClassProviderElement<AnyNotifier<ScoresTab, ScoresTab>, ScoresTab, Object?, Object?>;
    return element.handleCreate(ref, build);
  }
}
