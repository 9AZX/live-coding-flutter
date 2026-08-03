# foot_scores

App de démonstration (scores foot, Ligue 1) servant de **template
d'exercice de live coding Flutter**. Elle reproduit l'architecture et les
conventions du monorepo de production `flutter-front` (Betclic) à petite échelle :
Dart workspace + Melos, trios de packages `domain` / `data` / `presentation`,
injection par `bindProviders`, Riverpod 3 codegen, AutoRoute, freezed, theme_tailor.

## Démarrer

```bash
mise run bs         # dart pub get + melos bootstrap
mise run generate   # codegen (riverpod, freezed, auto_route, theme_tailor)
cd apps/foot_scores && flutter run
```

Deux marchés sont composables depuis le même binaire, pour illustrer l'inversion de
dépendance (la France vend des cotes, la Pologne non) :

```bash
flutter run                                  # marché FR (défaut)
flutter run --dart-define=REGULATION=pl      # marché PL
```

## Documentation

- [`AGENTS.md`](AGENTS.md) — architecture, conventions, règles de couches, tests
- [`WORKSHOP.md`](WORKSHOP.md) — l'exercice : reconstruire l'écran « Détail d'un match »
