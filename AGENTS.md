# AGENTS.md

Instructions pour les agents IA travaillant sur ce repo. C'est un **template
d'exercice de live coding Flutter** qui reproduit l'architecture et les
conventions du repo de production `flutter-front` (Betclic), à plus petite
échelle — même modèle que [`innovaxion_2026_app`](https://github.com/betclicgroup/innovaxion_2026_app).

---

## Project Overview

Monorepo Flutter organisé en **Dart workspace + Melos**, architecture
**feature-first / Clean Architecture**.

### Tech Stack

- **Flutter 3.38+** / **Dart SDK >=3.11.0 <4.0.0**
- **Riverpod V3** avec code generation pour le state management
- **auto_route** (routing), **freezed** (entités/DTOs), **theme_tailor** (thèmes)
- **Melos** pour le workspace, **Mason** pour scaffolder les couches
- **givn** + **shouldly** pour les tests

### Repository Structure

```
apps/
  foot_scores/                    # point d'entrée : main.dart + application/
packages/
  composition/
    app_providers/                # agrège tous les bindProviders() en une liste d'overrides
    app_router/                   # AppRouter (racine AutoRoute), shell à onglets, impls des ports de routing
    regulations/
      fr_providers/               # ce que le marché FR expose (catalogue de ligues + cotes)
      pl_providers/               # ce que le marché PL expose (catalogue polonais, sans cotes)
  dsm/
    tactics_components/           # tokens (palette, radius, spacing, icônes) + widgets DSM — pas de Riverpod
    tactics_providers/            # contrats DI du DSM : tacticsPaletteProvider (throw) + bindProviders
  shared_domain/
    scores/domain/                # domaine partagé entre features (pkg scores_domain)
  features/
    scores/matchs/    data|presentation      # feed des scores + widgets partagés
    scores/live/      presentation
    scores/favorites/ data|domain|presentation
    scores/odds/      data|domain|presentation      # feature exposée sur certains marchés seulement
  utilities/
    exceptions/                   # UnregisteredProviderException
    givn/                         # DSL de test given(...).when(...).then(...)
    widget_factory/presentation/  # WidgetFactory<T> : exposer un widget à un host sans couplage
bricks/                           # templates Mason (domain, data, presentation)
```

**Ces trois packages sont vendorés depuis `flutter-front` — signaler un problème
plutôt que les modifier** : `utilities/exceptions`, `utilities/givn`,
`utilities/widget_factory`.

---

## Build and Development Commands

Tout passe par **mise** (ou directement melos) :

| Commande | Description |
|----------|-------------|
| `mise run bs` | `dart pub get` + `melos bootstrap` (après tout changement de pubspec) |
| `mise run generate` | Codegen sur tout le workspace (après avoir touché un `.br.dart`) |
| `mise run analyze` | Analyse statique |
| `mise run test` | Tous les tests |
| `mise run format` | Formatage (120 colonnes) |
| `flutter run` (depuis `apps/foot_scores`) | Lance l'app |

**La barre verte avant tout commit** : `mise run generate && mise run format && mise run analyze && mise run test`.

Un seul package : `(cd packages/features/scores/<feature>/<layer> && flutter test)`.

### Création d'un package

On scaffolde via Mason, jamais à la main, pour garder la structure identique :

```bash
mason make domain       -o packages/features/<universe>/<feature>/domain       --name <feature>_domain       --classname <feature> --on-conflict overwrite
mason make data         -o packages/features/<universe>/<feature>/data         --name <feature>_data         --classname <feature> --domainPackage <feature>_domain --on-conflict overwrite
mason make presentation -o packages/features/<universe>/<feature>/presentation --name <feature>_presentation --classname <feature> --domainPackage <feature>_domain --on-conflict overwrite
```

Puis la checklist de câblage (§ *Wiring a new feature*).

---

## Code Style Guidelines

### Linting

- Base **very_good_analysis** + mode strict : `strict-casts`, `strict-inference`, `strict-raw-types`
- **Largeur de ligne : 120 caractères**

### Naming Conventions

- Tout fichier qui a besoin de `build_runner` se termine par **`.br.dart`**, avec le
  `part` correspondant : `part '<name>.br.g.dart'` (Riverpod),
  `part '<name>.br.freezed.dart'` (freezed), `part '<name>.br.tailor.dart'`
  (theme_tailor), `part '<name>.br.gr.dart'` (auto_route).
- Le `build.yaml` de chaque package restreint les générateurs à `**/*.br.dart`.
- Chaque package expose un `lib/src/package_name.dart` → `const packageName = '<pkg>';`
  (utilisé comme tag de log).
- Membres de classe : **champs d'abord, puis constructeur(s), puis méthodes** — widgets inclus.
- Ordre alphabétique partout : paramètres de constructeur, champs, constantes d'enum,
  imports, dépendances de pubspec.
- Enums de chemin de route : `{FeatureName}RoutePath`, colocalisé dans le fichier de route.
- Null safety stricte — **ne jamais force-unwrap** (`!`).

### Widget Guidelines

- Ne jamais utiliser les widgets Material directement dans une feature : passer par
  les primitives de `tactics_components`.
- Garder les widgets petits, focalisés, atomiques ; constructeurs `const` dès que possible.
- Utiliser `RepaintBoundary` quand c'est utile pour la performance.

### Date/Time Handling

- **Ne jamais utiliser `DateTime.now()` / `DateTime.timestamp()` directement** dans de
  la logique testable — injecter une source de temps via un provider (en prod :
  utilitaire NTP `Kronos`).

### Import Policy

| Scénario | Règle |
|----------|-------|
| Cross-package | Toujours des imports `package:` |
| Interne (même package) | Imports `package:<self>/src/...` (comme en prod) |
| Isolation des features | NE JAMAIS importer `packages/features/X` dans `packages/features/Y` |
| Clean Architecture | La couche Presentation ne doit pas importer de fichiers de la couche Data |

---

## Architecture Rules

### Feature-First Architecture

```
feature/
├── data/lib/src/
│   ├── data_sources/     # source unique → implémente directement le contrat du domaine
│   ├── dtos/             # *.br.dart (freezed + json_serializable)
│   ├── mappers/          # extension <Dto>Mapper on <Dto> { Entity toEntity() }
│   ├── providers_di.br.dart / providers_internal.br.dart / providers.br.dart / providers.dart
├── domain/lib/src/
│   ├── behaviors/        # logique métier, classes nommées par un verbe (GroupMatches, ToggleFavoriteMatch)
│   ├── entities/         # *.br.dart (freezed)
│   ├── repositories/     # contrats abstraits
│   ├── providers_di.br.dart / providers_internal.br.dart / providers.br.dart
└── presentation/lib/src/
    ├── {feature}_screen.dart         # l'écran ; la Page (@RoutePage) vit dans routing/
    ├── l10n/{feature}_strings.dart   # copie utilisateur (français), const par libellé
    ├── notifiers/        # *_notifier.br.dart
    ├── routing/          # {feature}_routing.dart (port) + {feature}_router.br.dart (pages + RoutePath)
    ├── theme/            # {feature}_theme.br.dart (@TailorMixinComponent)
    ├── widgets/
    ├── providers_di.br.dart / providers_internal.br.dart / providers.dart
```

### Layer Dependencies

- **Domain** : indépendant (aucun import de Data ni Presentation)
- **Data** : dépend uniquement de son domain
- **Presentation** : dépend uniquement de son domain, jamais de Data
- **Composition** (`app_providers`, `app_router`, `regulations/*`) : la seule couche
  autorisée à connaître toutes les features à la fois, et la seule à appeler
  `bindProviders(...)` / `bindRegulationProviders(...)`

### Le triplet de providers + `bindProviders`

Chaque package qui expose des providers suit la même forme :

- **`providers_di.br.dart`** — *contrats entrants*. Chaque provider `throw
  UnregisteredProviderException(...)` jusqu'à ce que la composition le fournisse.
  **Ce fichier n'est jamais exporté par le barrel du package.**
- **`providers_internal.br.dart`** — câblage interne / défauts (data sources, thème par
  défaut dérivé de la palette DSM). Pas l'API publique.
- **`providers.br.dart` / `providers.dart`** — l'API publique : les providers que les
  autres packages consomment, plus un `bindProviders({...})` qui retourne `List<Override>`.

La composition n'appelle que `bindProviders(...)` ; elle n'override jamais un symbole de
`providers_di` directement.

**La présentation ne lit jamais un contrat de repository.** Elle lit des providers d'état
(`watchMatchGroupsProvider`, `favoriteMatchIdsProvider`) et appelle des **behaviors**
exposés comme providers (`toggleFavoriteMatchProvider`). Pour toute nouvelle action
transverse : ajouter une petite classe dans `src/behaviors/` du domaine et l'exposer
depuis `providers.br.dart`, plutôt que d'exporter le repository brut.

### Routing Architecture

Toute feature **avec navigation** expose une **interface de routing** (un *port*) :
la feature émet des **intentions**, **résultats** ou **fermetures**, et
l'implémentation côté composition (`app_router`) les traduit en navigation concrète.
On nomme les méthodes par évènement, jamais par impératif.

| Type | Quand | Pattern | Exemples |
|------|-------|---------|----------|
| Intent | L'utilisateur démarre/continue un flux | `on…Requested` | `onMatchDetailRequested`, `onSignInRequested` |
| Outcome | Une étape réussit | `on…Successful`, `on…Sent` | `onAuthenticationSuccessful` |
| Dismiss | L'utilisateur ferme/annule | `onDismiss…`, `onCancel` | `onDismissErrorModal` |

À éviter : `navigateTo…` / `goTo…` / `push…` (la destination appartient au router),
`onTap…` / `on…Clicked` / `on…Pressed` (décrire l'intention, pas le geste).

Les segments de chemin sont définis via des **enums colocalisés**
`{FeatureName}RoutePath` (valeurs triées alphabétiquement) — jamais de chaîne en dur.
Le `RoutePath` de `app_router` ne contient que les chemins de premier niveau.

Une feature **sans** navigation propre (ici En direct et Favoris) n'a pas de port de
routing : seulement un `{feature}_router.br.dart` déclarant sa page et son chemin.

### Riverpod Guidelines

1. Riverpod V3 avec code generation (annotation `@riverpod`)
2. `ref.select` pour n'écouter qu'une propriété et éviter les rebuilds
3. `AsyncValue` pour les états async (data, error, loading)
4. `bindProviders` / `overrideWith` pour l'injection de dépendances et les tests
5. Providers petits et à responsabilité unique
6. Patterns `Notifier` et `AsyncNotifier` pour le state — le générateur **retire le
   suffixe `Notifier`** : `class ScoresFilterNotifier` → `scoresFilterProvider`
7. Accéder aux dimensions/config via des providers dédiés — jamais de hardcode

### Partage de widgets entre features

Pour exposer un widget à une autre feature sans import feature → feature :
`WidgetFactory<T>` (utilitaire `widget_factory`), déclarée en contrat dans le
`providers_di.br.dart` du **consommateur** et fournie par la composition via son
`bindProviders(...)`. Les arguments sont des types de `shared_domain` ou des records
structurels — jamais un type appartenant à une autre feature.

---

## Regulations : exposer des features par marché

C'est ici que l'**inversion de dépendance** devient concrète. Une feature ne sait pas
sur quel marché elle tourne : elle déclare un contrat, un package `regulations/*` y
répond. Deux marchés, deux réponses, **zéro ligne changée dans la feature**.

Chaque package de marché (`fr_providers`, `pl_providers`) expose une seule fonction
`{xx}Providers()` qui retourne des overrides, et le `main` de l'app choisit le marché.
En production chaque marché a son propre app (`apps/betclic_fr`, `apps/betclic_pl`) qui
ne dépend que de son package ; ici un binaire unique bascule via
`--dart-define=REGULATION=fr|pl`, pour pouvoir montrer la différence en direct.

### Deux formes de variation

| Ce qui varie | Contrat | Exemple |
|--------------|---------|---------|
| Une **valeur** de configuration | provider qui `throw`, alimenté par `bindRegulationProviders` | `leagueIdsProvider` : FR démarre sur la Ligue 1, PL sur l'Ekstraklasa |
| Une **feature entière** | `WidgetFactory<T>?` **nullable** qui `throw` | `matchOddsFactoryProvider` : FR injecte les cotes, PL passe `null` |

Le contrat nullable throw quand même : chaque marché doit répondre **explicitement**
oui (une fabrique) ou non (`null`). Un marché qu'on oublie de câbler plante au premier
build avec `UnregisteredProviderException` — jamais un écran silencieusement vide.

```dart
// features/scores/matchs/presentation — la feature hôte ignore ce qui s'affiche là
@riverpod
WidgetFactory<Match>? matchOddsFactory(Ref _) {
  throw UnregisteredProviderException(matchOddsFactoryProvider);
}

// composition/regulations/fr_providers — le marché FR vend des paris
...matchs_presentation.bindRegulationProviders(oddsFactory: const OddsBadgeWidgetFactory()),

// composition/regulations/pl_providers — pas de cotes ici
...matchs_presentation.bindRegulationProviders(oddsFactory: null),
```

`pl_providers` ne déclare même pas `odds_presentation` en dépendance : la feature
n'entre pas dans le binaire polonais. L'argument de la fabrique est un type de
`shared_domain` (`Match`), donc `matchs` et `odds` ne se connaissent jamais.

### Ajouter une feature propre à un marché

1. Créer le trio via Mason sous `packages/features/<universe>/<feature>/`.
2. Exposer son widget via une `WidgetFactory<T>` dans son `widget_factories.dart`.
3. Dans la feature **hôte**, déclarer le contrat nullable dans `providers_di.br.dart`
   et l'ouvrir dans `bindRegulationProviders(...)`.
4. Répondre dans **chaque** package de marché — une fabrique, ou `null`.

---

## Wiring a new feature

1. **Routes & pages** — dans `presentation`, `lib/src/routing/{feature}_router.br.dart`
   déclare l'enum `{Feature}RoutePath` et les widgets `@RoutePage`.
2. **Port de routing** — `lib/src/routing/{feature}_routing.dart` déclare les évènements
   de navigation, alimenté via `providers_di.br.dart` (`{feature}RoutingProvider`, qui throw).
3. **`app_router`** — ajouter le package presentation à son `pubspec.yaml`, ajouter les
   `AutoRoute(page: {Feature}Route.page, path: {Feature}RoutePath.x.path)` à
   `AppRouter.routes`, et créer `lib/src/routing/app_{feature}_routing.dart`.
4. **`app_providers`** — ajouter les packages domain/data/presentation à son `pubspec.yaml`,
   puis `...{feature}_data.bindProviders()` et
   `...{feature}_presentation.bindProviders(routing: (ref) => App{Feature}Routing(...))`.
5. **Thème** — rien à faire : chaque feature porte son propre thème par défaut dans son
   `providers_internal.br.dart`. Passer `theme:` à `bindProviders` seulement pour le
   surcharger (marque, dark mode, A/B).

---

## Testing Instructions

Les tests spécifient le **comportement**, pas l'implémentation. Un test unitaire ne doit
échouer que si le **comportement** change, pas lors d'un refactor.

Les tests vivent dans `test/unit/src/` en miroir de `lib/src/`, utilisent les assertions
**shouldly** (`.should.be(...)`, `.should.beTrue()`) et le DSL **givn**
`given(...).when(...).then(...)`.

### Structure Given / When / Then

| Phase | Sens |
|-------|------|
| **Given** | Contexte — scénario utilisateur / setup métier (stubs/mocks/fakes) |
| **When** | Action — ce qui se passe |
| **Then** | Résultat observable — ce qui doit être vrai ensuite |

Les chaînes `given` / `when` / `then` sont des **descriptions de comportement** pour un
humain : elles se lisent comme une spec, pas comme du code.

### Descriptions orientées comportement (BDD)

| Éviter (orienté implémentation) | Préférer (comportement / utilisateur) |
|---------------------------------|----------------------------------------|
| `login is called with valid credentials` | `the user logs in with valid credentials` |
| `it should return AuthenticationDetails.authenticated` | `the user should be successfully authenticated` |
| `refreshToken is called` | `the user's session is refreshed` |

- Préférer « the user … » à « the app / the system / the notifier »
- Pas de noms de méthodes ni de types dans les phrases
- Grouper par **comportement / scénario**, pas par nom de méthode

### Quoi tester

- **Tester** : behaviors, repositories / data sources, mappers, state holders
  (providers/notifiers), fonctions avec vraie logique
- **Souvent ignorer** : constructeurs triviaux, DTOs sans logique, helpers privés isolés,
  comportement du framework, sérialisation générée
- **Asserter sur le comportement** : règles métier, branchements, effets de bord, gestion
  d'erreur, changements de state. Préférer asserter les **outputs et le State** ; réserver
  `verify` aux **effets de bord** (ex: analytics)
- **Un test, un comportement**

### Riverpod dans les tests

- N'overrider que les dépendances **directes** ; ne pas remplacer tout le graphe
- Riverpod déconseille de mocker les Notifiers : tester via les behaviors / data sources,
  ou structurer l'API pour rendre le comportement observable

---

## Commit and Branch Conventions

### Branch Naming

Format : `<type>/TICKET_<brief_description>` — types : `feat/`, `fix/`, `hotfix/`,
`chore/`, `docs/`, `refactor/`, `perf/`, `test/`.

Exemple : `feat/ITFRARC-123_user_authentication`

### Commit Messages

Format : `<type>[optional scope]: <description>`

```
feat(matchs): add match detail route
fix(ui): resolve favorite star alignment on iPhone SE
```

- Mode impératif : « add » pas « added »
- Pas de majuscule en début, pas de point final, garder court

---

## Security Considerations

### Logging

- **Ne jamais utiliser `print()` ou `debugPrint()`**
- Passer par un logger, taggé avec le `packageName` du package (en prod : utilitaire `Timber`)

### Error Reporting

- Reporter les exceptions attrapées via les providers APM/Crashlytics
- Ne jamais implémenter de tracking brut dans les features
- Les exceptions sont réservées aux **erreurs de programmation**
  (`UnregisteredProviderException` = contrat DI jamais fourni)

---

## Design System (DSM) Guidelines

### Token Usage

- **Jamais de couleur brute** (`0xFF...`, `Colors.red`) ni de valeur hardcodée dans une feature
- Les tokens vivent dans `tactics_components` : `TacticsPalette`, `TacticsRadius`,
  `TacticsSpacing`, `TacticsIcons`

### Theming

Chaque feature expose un `ThemeExtension` généré par **theme_tailor**
(`@TailorMixinComponent`) dans `presentation/lib/src/theme/{feature}_theme.br.dart`, avec
des **tokens sémantiques concrets** (couleurs, `TextStyle`, doubles) — jamais la palette
brute. Le défaut est construit depuis la palette DSM dans `providers_internal.br.dart` ;
`providers_di.br.dart` expose le contrat `{feature}ThemeProvider` qui pointe dessus, ce qui
permet de le surcharger en composition sans toucher la feature.

- **`tactics_components`** : utilisable directement dans une feature (widgets, tokens)
- **`tactics_providers`** : à ne **JAMAIS** importer dans une feature — passer par le thème
  de la feature. Seule la composition lit `tacticsPaletteProvider`.
- Accès au thème : `ref.watch({feature}ThemeProvider.select((theme) => theme.xxx))`

---

## AI Automation

- `CLAUDE.md` est le point d'entrée : il importe ce fichier et les règles de
  `.claude/rules/` (`comments`, `dart-line-breaks`) à chaque session.
- `.mcp.json` enregistre le serveur **`dart`** (`dart mcp-server`) — préférer ses
  outils (analyse, hot reload, devices, tests, runtime errors) aux appels shell `flutter`/`dart`.
- `mason.yaml` + `bricks/` : les templates de scaffolding qui garantissent que chaque
  couche générée a la même structure que le repo de prod. **Ne pas les modifier à la
  légère** — ils affectent tous les scaffolds futurs.
- Le code généré (`*.g.dart`, `*.gr.dart`, `*.freezed.dart`, `*.tailor.dart`) est
  **commité** : lancer `mise run generate` et commiter le résultat dans le même
  changement que la source.
