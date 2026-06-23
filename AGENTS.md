# AGENTS.md

Instructions pour les agents IA travaillant sur ce repo. C'est un **template
d'exercice de live coding Flutter** qui reproduit l'architecture et les
conventions du repo de production `flutter-front` (Betclic). Les règles ci-dessous
sont celles à suivre quand on vibe-code des features dans ce template.

---

## Project Overview

Monorepo Flutter organisé en **Dart workspace + Melos**, architecture
**feature-first / Clean Architecture**.

### Tech Stack

- **Flutter 3.38.x** / **Dart SDK >=3.10.0 <4.0.0**
- **Riverpod V3** avec code generation pour le state management
- **Clean Architecture** feature-first
- **Melos** pour la gestion du workspace
- **Mason / Bricks** pour scaffolder les packages (`data`, `domain`, `presentation`)
- **auto_route** (routing), **freezed** (DTOs/entités), **theme_tailor** (thèmes)

### Repository Structure

```
apps/                    # Points d'entrée des apps (ex: foot_scores)
packages/
├── composition/         # DI et providers de composition (router racine, theme_manager…)
├── domain/              # Domaine partagé entre features
├── dsm/                 # Design System Manager (thèmes, composants)
├── features/            # Packages de features indépendants
├── utilities/           # Utilitaires réutilisables, agnostiques du produit
└── other/               # Custom lints, générateurs
bricks/                  # Templates Mason (data / domain / presentation)
```

---

## Build and Development Commands

| Commande | Description |
|----------|-------------|
| `dart pub get` | Résout les dépendances du workspace |
| `melos bootstrap` (`melos bs`) | Bootstrap de tous les packages |
| `mason make data` / `domain` / `presentation` | Scaffold une couche d'un package (voir bricks) |
| `dart run build_runner build --delete-conflicting-outputs` | Génère le code dans un package |
| `melos run generate` | Génère le code sur tout le workspace |
| `melos run analyze` | Analyse statique |
| `dart format .` | Formatage |
| `melos run test` | Lance les tests |
| `flutter run` (depuis `apps/<app>`) | Lance l'app |

### Création d'un package

On scaffolde via Mason, jamais à la main, pour garder la structure identique :

```bash
mason make domain        # couche domain
mason make data          # couche data
mason make presentation  # couche presentation
```

---

## Code Style Guidelines

### Linting

- Base **very_good_analysis** + mode strict : `strict-casts`, `strict-inference`, `strict-raw-types`
- **Largeur de ligne : 120 caractères**

### Naming Conventions

- Les fichiers avec code generation se terminent par `*.br.dart`
- Toujours inclure le `part` : `part 'filename.br.g.dart';`
- Enums de chemin de route : `{FeatureName}RoutePath`, colocalisé dans le fichier de route
- Organiser les variables par ordre alphabétique
- Null safety stricte — **ne jamais force-unwrap** (`!`)

### Widget Guidelines

- Ne jamais utiliser les widgets Material directement
- Garder les widgets petits, focalisés, atomiques
- Utiliser les constructeurs `const` dès que possible
- Utiliser `RepaintBoundary` quand c'est utile pour la performance

### Date/Time Handling

- **Ne jamais utiliser `DateTime.now()` / `DateTime.timestamp()` directement**
- Injecter une source de temps via un provider (en prod : utilitaire NTP `Kronos`)

### Import Policy

| Scénario | Règle |
|----------|-------|
| Cross-package | Toujours des imports `package:` |
| Interne (même package) | Imports relatifs |
| Isolation des features | NE JAMAIS importer `packages/features/X` dans `packages/features/Y` |
| Clean Architecture | La couche Presentation ne doit pas importer de fichiers de la couche Data |

---

## Architecture Rules

### Feature-First Architecture

Chaque feature est indépendante et suit la Clean Architecture en interne :

```
feature/
├── data/
│   ├── data_sources/    # APIs distantes/locales
│   ├── dtos/            # Data Transfer Objects
│   └── repositories/    # Implémentations de repository
├── domain/
│   ├── entities/        # Modèles métier purs
│   ├── repositories/    # Interfaces de repository
│   └── behaviors/       # Logique métier
└── presentation/
    ├── routing/         # Interface de routing + router + pages
    ├── providers/       # Notifiers / Providers Riverpod
    ├── widgets/         # Composants atomiques
    └── pages/           # Écrans complets
```

### Layer Dependencies

- **Domain** : toujours indépendant (aucun import de Data ni Presentation)
- **Data** : dépend uniquement de Domain
- **Presentation** : dépend uniquement de Domain

### Routing Architecture

Toute feature avec navigation expose une **interface de routing** (un *port*) :
la feature émet des **intentions**, **résultats** ou **fermetures**, et
l'implémentation du router (composition / app) les traduit en navigation
concrète. On nomme les méthodes par événement, jamais par impératif.

| Type | Quand | Pattern | Exemples |
|------|-------|---------|----------|
| Intent | L'utilisateur démarre/continue un flux | `on…Requested` | `onSignInRequested`, `onForgotPasswordRequested` |
| Outcome | Une étape réussit | `on…Successful`, `on…Sent` | `onAuthenticationSuccessful`, `onLinkSent` |
| Dismiss | L'utilisateur ferme/annule | `onDismiss…`, `onCancel` | `onDismissErrorModal` |

À éviter : `navigateTo…` / `goTo…` / `push…` (la destination appartient au
router), `onTap…` / `on…Clicked` / `on…Pressed` (décrire l'intention, pas le geste).

Les segments de chemin sont définis via des **enums colocalisés**
`{FeatureName}RoutePath` (valeurs triées alphabétiquement) — jamais de chaîne en dur.

### Riverpod Guidelines

1. Riverpod V3 avec code generation (annotation `@riverpod`)
2. `ref.select` pour n'écouter qu'une propriété et éviter les rebuilds
3. `AsyncValue` pour les états async (data, error, loading)
4. `overrideWith` pour l'injection de dépendances et les tests
5. Providers petits et à responsabilité unique
6. Patterns `Notifier` et `AsyncNotifier` pour le state
7. Accéder aux dimensions/config via des providers dédiés — jamais de hardcode
8. **Le triple de providers** :
   - `providers_di.br.dart` = dépendances **entrantes** uniquement (stubs qui throw jusqu'à override)
   - `providers_internal.br.dart` = câblage **interne** (data sources, theme par défaut) — pas l'API publique
   - `providers.br.dart` / `providers.dart` = **API publique** Riverpod (use cases, state, proxies)

---

## Testing Instructions

Les tests spécifient le **comportement**, pas l'implémentation. Un test unitaire
ne doit échouer que si le **comportement** change, pas lors d'un refactor.

### Structure Given / When / Then

| Phase | Sens |
|-------|------|
| **Given** | Contexte — scénario utilisateur / setup métier (stubs/mocks/fakes) |
| **When** | Action — ce qui se passe |
| **Then** | Résultat observable — ce qui doit être vrai ensuite |

Les chaînes `given` / `when` / `then` sont des **descriptions de comportement**
pour un humain : elles se lisent comme une spec, pas comme du code.

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

- **Tester** : use cases / services, repositories / data sources, mappers,
  state holders (providers/notifiers), fonctions avec vraie logique
- **Souvent ignorer** : constructeurs triviaux, DTOs sans logique, helpers privés
  isolés, comportement du framework, sérialisation générée
- **Asserter sur le comportement** : règles métier, branchements, effets de bord,
  gestion d'erreur, changements de state. Préférer asserter les **outputs et le State** ;
  réserver `verify` aux **effets de bord** (ex: analytics)
- **Un test, un comportement**

### Riverpod dans les tests

- N'overrider que les dépendances **directes** ; ne pas remplacer tout le graphe
- Riverpod déconseille de mocker les Notifiers : tester via les use cases /
  data sources, ou structurer l'API pour rendre le comportement observable

---

## Commit and Branch Conventions

### Branch Naming

Format : `<type>/TICKET_<brief_description>` — types : `feat/`, `fix/`, `hotfix/`,
`chore/`, `docs/`, `refactor/`, `perf/`, `test/`.

Exemple : `feat/ITFRARC-123_user_authentication`

### Commit Messages

Format : `<type>[optional scope]: <description>`

```
feat(auth): add OAuth2 authentication support
fix(ui): resolve login button alignment on iPhone SE
```

- Mode impératif : « add » pas « added »
- Pas de majuscule en début, pas de point final, garder court

---

## Security Considerations

### Logging

- **Ne jamais utiliser `print()` ou `debugPrint()`**
- Toujours passer par un logger injecté via provider (en prod : utilitaire `Timber`)

### Error Reporting

- Reporter les exceptions attrapées via les providers APM/Crashlytics
- Ne jamais implémenter de tracking brut dans les features

---

## Design System (DSM) Guidelines

### Token Usage

- **Jamais de couleur brute** (`0xFF...`, `Colors.red`) ni de valeur hardcodée
- Toujours utiliser les thèmes et composants du DSM
- Accéder aux tokens via `context.theme` ou les extensions équivalentes

### Components

- Préférer les molecules/organisms du DSM avant de construire un widget custom
- Principes de l'atomic design (atoms → molecules → organisms)

### Theming

Chaque feature avec du style propre expose un `ThemeExtension`
(`@TailorMixinComponent`), alimenté depuis les tokens globaux dans la couche de
composition — ce qui permet de surcharger le style sans toucher la feature.

```dart
// presentation/lib/src/theme/{feature}_theme.br.dart
@TailorMixinComponent()
class FeatureTheme extends ThemeExtension<FeatureTheme> with _$FeatureThemeTailorMixin {
  @override
  final Color backgroundColor;

  const FeatureTheme({required this.backgroundColor});
}
```

---

## AI Automation

- `CLAUDE.md` est le point d'entrée : il importe ce fichier et les règles de
  `.claude/rules/` à chaque session.
- `.claude/rules/` : `comments`, `dart-line-breaks`, `feature`, `local-storage`,
  `orientation`, `platform-brightness`, `translations`.
- `.mcp.json` enregistre le serveur **`dart`** (`dart mcp-server`) — préférer ses
  outils (analyse, hot reload, devices, tests, runtime errors) aux appels shell `flutter`/`dart`.
- `mason.yaml` + `bricks/` : les templates de scaffolding qui garantissent que
  chaque couche générée a la même structure que le repo de prod.
