# Feature Package Guidelines

## Creating a New Feature

Use the package creation script to scaffold a new feature:

```bash
mise create-package
```

Select `features` as the package type, then choose the layers you need (data, domain, presentation).

## Feature Structure

A feature follows Clean Architecture with three optional layers:

```
packages/features/{feature_name}/
├── data/
│   └── lib/
│       ├── {feature_name}_data.dart          # Public exports
│       └── src/
│           ├── data_sources/                  # Remote/Local data sources
│           ├── dtos/                          # Data Transfer Objects (*.br.dart for freezed)
│           ├── repositories/                  # Repository implementations (Rule B only; omit for single-source features)
│           ├── providers.br.dart              # DI overrides (buildXxxProviders function)
│           └── providers_internal.br.dart     # Internal only: data sources, clients, adapters (not public API)
├── domain/
│   └── lib/
│       ├── {feature_name}_domain.dart        # Public exports
│       └── src/
│           ├── entities/                      # Pure business models
│           ├── repositories/                  # Repository interfaces (abstract)
│           ├── behaviours/                   # Business logic (verb-named classes)
│           ├── providers_di.br.dart           # Incoming DI only: what this package needs from outside (stubs until overridden)
│           ├── providers.br.dart              # Public Riverpod API (use cases, proxies to composition/shared_domain when needed)
│           └── providers_internal.br.dart     # When needed: internal glue (behaviors ↔ repos); not for other packages
└── presentation/
    └── lib/
        ├── {feature_name}_presentation.dart  # Public exports
        └── src/
            ├── routing/
            │   ├── {feature_name}_routing.dart     # Navigation interface
            │   └── {feature_name}_router.br.dart   # AutoRoute router & page definition
            ├── theme/
            │   └── {feature_name}_theme.br.dart # Theme extension with @TailorMixinComponent
            ├── widgets/                         # Atomic UI components
            ├── pages/ or {feature_name}_screen.dart  # Full screens
            ├── notifiers/                       # Riverpod Notifiers/AsyncNotifiers
            ├── providers_di.br.dart             # Incoming DI only (routing, theme overrides, …)
            ├── providers_internal.br.dart       # Mandatory for theme: defaultTheme(), internal UI wiring (not public API)
            └── providers.br.dart                # Public providers (state, factories, proxies)

```

## Routing Interface

Every feature with navigation must expose a routing interface.

### Routing method naming (event-driven)

Methods on `{FeatureName}Routing` are a **port**: the feature emits **intents**, **outcomes**, or **dismissals**; the **router implementation** (composition / app) maps them to concrete navigation (`*Route`, stacks, tabs). Name methods as events, never as imperative navigation.

**Vocabulary** — pick the row that matches what happened, then follow its pattern:

| Kind | When to use | Pattern | Examples |
|------|-------------|---------|----------|
| Intent | User asks to start or continue a flow | `on…Requested` | `onForgotPasswordRequested`, `onSignInRequested` |
| Outcome | A step succeeded or produced a clear result | `on…Successful`, `on…Sent`, or an explicit past result | `onAuthenticationSuccessful`, `onLinkSent`, `onUserDidComplete` |
| Dismiss | User closes or cancels without completing | `onDismiss…`, `onCancel` | `onDismissErrorModal`, `onCancel` |

| Avoid | Why |
|-------|-----|
| `navigateTo…`, `goTo…`, `push…` | Destination and stack policy belong in the router, not the feature port |
| `onTap…`, `on…Clicked`, `on…Pressed` | Describe **intent** or **outcome**, not the gesture |
| Names that read like **state** (`onPasswordForgotten`, bare `onLoggedIn`) | Prefer an **Intent** (`onForgotPasswordRequested`) or a precise **Outcome** (`onAuthenticationSuccessful`) from the table above |

**File:** `presentation/lib/src/routing/{feature_name}_routing.dart`

```dart
import 'package:flutter/widgets.dart';

abstract interface class FeatureNameRouting {
  void onForgotPasswordRequested(BuildContext context);
}
```

**Export in:** `presentation/lib/{feature_name}_presentation.dart`

```dart
export 'src/routing/{feature_name}_routing.dart';
```

**Provider in:** `presentation/lib/src/providers_di.br.dart`

```dart
import 'package:{feature_name}_presentation/{feature_name}_presentation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers_di.br.g.dart';

@riverpod
FeatureNameRouting featureNameRouting(Ref _) {
  throw Exception('featureNameRouting must be overridden by the app');
}
```

## Feature Router (AutoRoute)

Features define their own route pages using AutoRoute. This keeps route definitions co-located with the feature and generates the `{FeatureName}Route` class that can be used by the composition layer.

**File:** `presentation/lib/src/routing/{feature_name}_router.br.dart`

```dart
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{feature_name}_presentation/{feature_name}_presentation.dart';

part '{feature_name}_router.br.gr.dart';

@AutoRouterConfig()
abstract class FeatureNameRouter extends RootStackRouter {
}

@RoutePage(name: 'FeatureNameRoute')
class FeatureNamePage extends ConsumerWidget {
  const FeatureNamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => const FeatureNameScreen();
}
```

**Export in:** `presentation/lib/{feature_name}_presentation.dart`

```dart
export 'src/routing/{feature_name}_router.br.dart';
```

**Dependencies required in:** `presentation/pubspec.yaml`

```yaml
dependencies:
  auto_route: ^10.2.0

dev_dependencies:
  auto_route_generator: ^10.2.0
```

### Generated Output

Running `mise builder --scope {feature_name}_presentation` generates `{feature_name}_router.br.gr.dart` containing:

```dart
/// generated route for [FeatureNamePage]
class FeatureNameRoute extends PageRouteInfo<void> {
  const FeatureNameRoute({List<PageRouteInfo>? children})
    : super(FeatureNameRoute.name, initialChildren: children);

  static const String name = 'FeatureNameRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FeatureNamePage();
    },
  );
}
```

### Route Path Definitions

Each route definition file must define its own **colocated path enum** for the path segments it uses. This avoids a single monolithic enum and keeps paths close to their route definitions.

**Pattern:** `{FeatureName}RoutePath` enum colocated in the same file as the `{featureName}Routes()` function.

```dart
// In the route definition file (e.g. base_router/lib/src/routes/authentication_routes.br.dart)
enum AuthenticationRoutePath {
  digest('digest'),
  login('login'),
  requestResetPasswordLink('request_reset_password_link');

  const AuthenticationRoutePath(this.path);

  final String path;
}

List<AutoRoute> authenticationRoutes() => [
  AutoRoute(path: AuthenticationRoutePath.login.path, page: LoginRoute.page, initial: true),
  AutoRoute(path: AuthenticationRoutePath.requestResetPasswordLink.path, page: RequestResetPasswordLinkRoute.page),
  AutoRoute(path: AuthenticationRoutePath.digest.path, page: DigestRoute.page),
];
```

**Rules:**
- Enum values must be sorted alphabetically
- One enum per route definition file (never a shared/centralized path enum)
- The composition-level `RoutePath` enum in `base_router` only contains top-level shell paths (e.g. `splash`, `overallShell`, `authentication`, `register`)
- Feature-level enums contain sub-route paths within that feature's navigation tree

### Usage in base_router

Import the feature's route and use it in the composition layer:

```dart
// packages/composition/base_router/lib/src/presentation/base_router.br.dart
import 'package:{feature_name}_presentation/{feature_name}_presentation.dart';

@AutoRouterConfig()
class BaseRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    // ...
    AutoRoute(path: RoutePath.authentication.path, page: AuthenticationHeaderShellRoute.page, children: authenticationRoutes()),
  ];
}
```

## Theme Extension

Every feature with custom styling must expose a theme:

**File:** `presentation/lib/src/theme/{feature_name}_theme.br.dart`

```dart
import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part '{feature_name}_theme.br.tailor.dart';

@TailorMixinComponent()
class FeatureNameTheme extends ThemeExtension<FeatureNameTheme> with _$FeatureNameThemeTailorMixin {
  @override
  final Color backgroundColor;
  
  // Add more theme properties as needed

  const FeatureNameTheme({
    required this.backgroundColor,
  });
}
```

**Export in:** `presentation/lib/{feature_name}_presentation.dart`

```dart
export 'src/theme/{feature_name}_theme.br.dart';
```

**Provider in:** `presentation/lib/src/providers_di.br.dart`

```dart
@riverpod
FeatureNameTheme featureNameTheme(Ref _) {
  throw Exception('featureNameTheme must be overridden by the app');
}
```

### Theme Manager Integration (Required)

After defining a feature theme, you **must** create a default theme provider in `theme_manager` and register it.

**Step 1:** Create default theme provider in `packages/composition/theme_manager/lib/src/presentation/theme/{feature_name}_theme_provider.br.dart`

```dart
import 'package:{feature_name}_presentation/{feature_name}_presentation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tactics_providers/tactics_providers.dart';

part '{feature_name}_theme_provider.br.g.dart';

@riverpod
FeatureNameTheme featureNameDefaultTheme(Ref ref) {
  final palette = ref.watch(tacticsPaletteProvider);

  return FeatureNameTheme(backgroundColor: palette.bgPrimary);
}
```

**Step 2:** Register the override in `packages/composition/theme_manager/lib/src/providers.dart`

Add the import and override to `buildThemeProviders()`:

```dart
import 'package:{feature_name}_presentation/{feature_name}_presentation.dart';
import 'package:theme_manager/src/presentation/theme/{feature_name}_theme_provider.br.dart';

List<Override> bindThemeProviders() => [
  // ... existing overrides ...
  featureNameThemeProvider.overrideWith((ref) => ref.watch(featureNameDefaultThemeProvider)),
];
```

**Step 3:** Run code generation for `theme_manager`:

```bash
mise builder --scope theme_manager
```

## Domain Layer Providers Pattern

**DI Providers** (`providers_di.br.dart`) - Abstract dependencies that must be overridden:

```dart
@riverpod
FeatureRepository featureRepository(Ref _) {
  throw Exception('featureRepository must be overridden by the app');
}
```

**Behaviour providers** (`<verb>.br.dart`) - Expose behaviours only; provider names are verbs (no "UseCase" or "Behaviour" suffix):

```dart
@riverpod
SomeResult verb(Ref ref, {required String param}) {
  final repository = ref.watch(featureRepositoryProvider);
  return SomeBehaviour(repository: repository).execute(param);
}
```

## Data Layer Providers Pattern

**Bind function** (`providers.br.dart`) - Returns list of overrides.

**Rule A — single source (data source implements the interface):** bind the repository provider
straight to the data-source provider, no repository class:

```dart
List<Override> bindFeatureProviders() => [
  fooRepositoryProvider.overrideWith((ref) => ref.watch(fooDataSourceProvider)),
];
```

**Rule B — coordination (`FeatureRepositorySingleSource` composes sources):**

```dart
List<Override> bindFeatureProviders({
  required ProviderListenable<Dio> dioProvider,
}) => [
  featureRepositoryProvider.overrideWith(
    (ref) => FeatureRepositorySingleSource(
      dataSource: ref.watch(featureDataSourceProvider),
    ),
  ),
];
```

See [naming_convention §7](../../documentation/naming_convention.md) for when each shape applies.

## File Naming Conventions

| File Type | Pattern | Example |
|-----------|---------|---------|
| Generated files | `*.br.dart` | `providers.br.dart` |
| Freezed DTOs | `*_dto.br.dart` | `user_dto.br.dart` |
| Theme files | `*_theme.br.dart` | `cashier_theme.br.dart` |
| Router files | `*_router.br.dart` | `preferences_router.br.dart` |
| Route definitions | `*_routes.dart` or `*_routes.br.dart` | `authentication_routes.br.dart` |
| Routing interface | `*_routing.dart` | `cashier_routing.dart` |
| Route path enum | Colocated in route definition file | `AuthenticationRoutePath` in `authentication_routes.br.dart` |
| Repository impl (Rule B only) | `*_single_source.dart` | `cashier_repository_single_source.dart` |
| Data-source-as-repository (Rule A — no repository file) | `*_data_source.dart implements {Feature}Repository` | `passkey_http_data_source.dart`, `app_rating_local_data_source.dart` |
| Data sources | `*_data_source.dart` | `cashier_http_data_source.dart` |
| Behaviours | Verb only (no suffix) | `get_user.dart`, `submit_bet.dart` (class: `GetUser`, `SubmitBet`) |

## Public Exports

Each layer exposes a single barrel file:

- `{feature_name}_data.dart` → Exports `providers.br.dart`
- `{feature_name}_domain.dart` → Exports entities, repositories, DI providers, use case providers
- `{feature_name}_presentation.dart` → Exports screens, DI providers, routing interface, router, theme

## Key Principles

1. **Feature Isolation**: Features must NOT import from other features directly. Use `packages/shared_domain/` for shared logic.
2. **Layer Dependencies**: 
   - Domain: Independent (no imports from Data or Presentation)
   - Data: Depends on Domain
   - Presentation: Depends on Domain
3. **Dependency Injection**: Use `overrideWith` pattern for all external dependencies
4. **Theme Access**: Use `ref.watch(featureThemeProvider.select((t) => t.property))` to minimize rebuilds
5. **Routing Abstraction**: Navigation is handled via routing interfaces, not direct router access
6. **DSM Usage in Presentation**: 
   - **`tactics_components`**: Can be used directly in feature presentation for UI components (e.g., `RadioButton`, `Button`)
   - **`tactics_providers`**: Must **NEVER** be imported directly. Use the feature's own theme provider instead
   - **Component Styles**: When using `tactics_components`, pass styles from the feature theme (not from `tactics_providers`)

### ❌ Incorrect (Direct DSM Provider Usage)

```dart
// BAD: Direct import of tactics_providers in feature presentation
import 'package:tactics_providers/tactics_providers.dart';

class MyWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = ref.watch(tacticsPaletteProvider); // ❌ Wrong!
    return Container(color: palette.bgPrimary);
  }
}
```

### ✅ Correct (Feature Theme with DSM Components)

```dart
// GOOD: Use tactics_components with styles from feature theme
import 'package:preferences_presentation/preferences_presentation.dart';
import 'package:tactics_components/tactics_components.dart';

class ThemeModeWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(preferencesThemeProvider);
    
    return RadioButton(
      isSelected: true,
      style: theme.radioButtonStyle, // ✅ Style comes from feature theme
      onPressed: () {},
    );
  }
}
```

### Feature Theme with Component Styles

Include component styles in your feature theme:

```dart
// presentation/lib/src/theme/{feature_name}_theme.br.dart
import 'package:tactics_components/tactics_components.dart';

@TailorMixinComponent()
class PreferencesTheme extends ThemeExtension<PreferencesTheme> with _$PreferencesThemeTailorMixin {
  @override
  final Color backgroundColor;
  
  @override
  final RadioButtonStyle radioButtonStyle; // Component style from tactics_components

  const PreferencesTheme({
    required this.backgroundColor,
    required this.radioButtonStyle,
  });
}
```

Then in `theme_manager`, map DSM tokens to the component style:

```dart
// theme_manager/lib/src/presentation/theme/{feature_name}_theme_provider.br.dart
@riverpod
PreferencesTheme preferencesDefaultTheme(Ref ref) {
  final palette = ref.watch(tacticsPaletteProvider);
  final tacticsTheme = ref.watch(tacticsThemeProvider);

  return PreferencesTheme(
    backgroundColor: palette.bgPrimary,
    radioButtonStyle: tacticsTheme.radioButtonStyle, // Map from DSM theme
  );
}
```

This pattern ensures:
- Features can use DSM components directly for consistent UI
- Styles are provided through the feature theme (not direct DSM provider access)
- Component styles can be overridden per brand/regulation in `theme_manager`
- Features remain decoupled from DSM provider implementation

## After Creating a Feature

1. Run `mise bs` to bootstrap the workspace
2. Run `mise builder --scope {feature_name}_{layer}` to generate code
3. Add providers to composition layer (`base_providers` or brand/regulation specific)
4. Add the feature's route to `base_router` using `FeatureNameRoute.page` (see [Feature Router](#feature-router-autoroute))
5. **If feature has a theme**: Create default theme provider in `theme_manager` and register it in `buildThemeProviders()` (see [Theme Manager Integration](#theme-manager-integration-required))
