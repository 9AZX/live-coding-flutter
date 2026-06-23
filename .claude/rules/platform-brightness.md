# Platform Brightness Centralization

**CRITICAL**: Platform brightness changes must be handled through a **single, centralized provider** to ensure consistency and prevent conflicts.

#### Rules

1. **Strict Centralization**: 
   - The `DeviceThemeModeStateNotifier` in `packages/dsm/theme/theme_application/lib/src/providers.br.dart` is the **ONLY** place where `onPlatformBrightnessChanged` may be directly assigned or accessed
   - This provider owns the lifecycle of the platform brightness callback

2. **Prohibited Direct Usage**:
   - **NEVER** directly assign to `WidgetsBinding.instance.platformDispatcher.onPlatformBrightnessChanged` outside of `DeviceThemeModeStateNotifier`
   - **NEVER** access `platformDispatcher.onPlatformBrightnessChanged` for reading or writing outside the provider
   - **NEVER** create duplicate listeners or handlers for platform brightness changes

3. **Access Pattern**:
   - To react to platform brightness changes, use `ref.watch(deviceThemeModeStateProvider)`