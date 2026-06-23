# Orientation Centralization

Orientation is centralized through `OrientationManager` in `packages/utilities/orientation/domain`. See `documentation/orientation.md` for the full model.

#### Rules

1. **Declare intent via `OrientationWidget` or `OrientationManager`**:
   - Wrap a subtree with `OrientationWidget(mode: ...)` to apply an `OrientationMode` while mounted (preferred for widgets).
   - Call `orientationManagerProvider.notifier.push(mode)` / `release(token)` directly only when lifecycle-based mounting is insufficient (e.g. delayed or imperative transitions).

2. **Prohibited direct usage**:
   - **NEVER** call `SystemChrome.setPreferredOrientations` outside `orientation_domain`'s `OrientationEnforcer` implementation.
   - **NEVER** create a second `OrientationEnforcer` — override `orientationEnforcerProvider` instead.

3. **Enforcer swap-point**:
   - To replace the SystemChrome enforcer (e.g. native splash-proof implementation), override `orientationEnforcerProvider` in the app's composition layer. No other code changes.
