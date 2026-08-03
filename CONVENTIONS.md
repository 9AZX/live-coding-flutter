# 📋 Les conventions, en une page

Version courte d'`AGENTS.md`, à garder ouverte pendant l'exercice.

---

## Les couches

```
domain        →  entités, contrats (repositories), behaviors.  Ne dépend de RIEN.
data          →  implémente les contrats du domaine.  Dépend de SON domain, c'est tout.
presentation  →  écran, widgets, thème, port de routing.  Dépend de son domain, JAMAIS de data.
composition   →  app_providers, app_router, regulations/*.  La SEULE couche qui connaît
                 toutes les features, et la seule à appeler bindProviders().
```

**Une feature n'importe jamais une autre feature.** Ce qui est partagé passe par
`shared_domain` ou par **injection**.

---

## Le quadruplet de providers

Chaque package qui expose des providers a toujours les mêmes fichiers :

| Fichier | Rôle |
|---|---|
| `providers_di.br.dart` | **contrats entrants** : chaque provider `throw UnregisteredProviderException`. **Jamais exporté par le barrel.** |
| `providers_internal.br.dart` | câblage interne, valeurs par défaut (source de données, thème par défaut). Pas public. |
| `providers.br.dart` / `providers.dart` | l'API publique + `bindProviders({...})` qui retourne `List<Override>` |

La composition n'appelle que `bindProviders(...)`. Elle n'override jamais un symbole de
`providers_di` directement.

**Un contrat non fourni plante au premier build** — jamais un `null` silencieux.

---

## Erreurs : un échec est une valeur

```dart
Future<Result<Match, ScoresError>> fetchMatch(String id);   //  Success | Failure
```

Trois traductions, pour qu'aucune feature ne dépende de la lib HTTP :

```
DioException  →  NetworkError  →  ScoresError
  (Dio)          (network_dio)     (la source de données)
```

- Les **exceptions** sont réservées aux **erreurs de programmation** (`UnregisteredProviderException`).
- Une source de données prend un **`HttpClient` injecté** — jamais un `Dio`, jamais un client maison.
- Les chemins sont des `static const String _xxxPath` sur la source de données.
- L'enveloppe de la réponse est un **DTO** — pas un `json['clé']` à la main.
- Journaliser **une seule fois**, dans la couche qui produit l'échec.
- Côté état : `getOrThrow()` → l'échec arrive dans l'`AsyncValue`, l'écran affiche de la
  **copie utilisateur** de son `l10n`. **Jamais `Text('$error')`.**

---

## Navigation : la feature émet, la composition décide

La feature déclare un **port** et nomme les méthodes par **évènement** :

| Type | Forme | Exemple |
|---|---|---|
| Intention | `on…Requested` | `onMatchDetailRequested` |
| Résultat | `on…Successful` | `onAuthenticationSuccessful` |
| Fermeture | `onDismiss…` | `onDismissMatchDetail` |

À éviter : `navigateTo…`, `push…` (la destination appartient au router), `onTap…`,
`on…Clicked` (décrire l'intention, pas le geste).

Les chemins sont des enums colocalisés `{Feature}RoutePath` — jamais de chaîne en dur.

---

## Riverpod

- `@riverpod` + codegen. **Le générateur retire le suffixe `Notifier`** :
  `class ScoresFilterNotifier` → `scoresFilterProvider`.
- `ref.watch(xProvider.select((x) => x.champ))` pour éviter les rebuilds.
- La **présentation ne lit jamais un repository** : elle lit des providers d'état et
  appelle des **behaviors** (`ref.read(toggleFavoriteMatchProvider)(id)`).
- En test : n'overrider que les dépendances **directes**, via les `bindProviders` publics.

---

## Style

- Tout fichier qui a besoin de codegen finit en **`.br.dart`**, avec le `part` qui va avec
  (`.br.g.dart`, `.br.freezed.dart`, `.br.tailor.dart`, `.br.gr.dart`).
- Ordre des membres : **champs, puis constructeurs, puis méthodes**.
- **Ordre alphabétique** partout : paramètres, champs, constantes d'enum, imports, deps.
- 120 colonnes. Jamais de `!` (force-unwrap). Jamais de `print()` / `debugPrint()`.
- Jamais de `DateTime.now()` dans de la logique testable → injecter une horloge.
- **Jamais de couleur brute** (`0xFF…`, `Colors.red`) ni de valeur en dur dans une feature :
  passer par le **thème de la feature** (`{feature}ThemeProvider`), alimenté depuis la
  palette DSM. Ne **jamais** importer `tactics_providers` dans une feature.
- Les libellés utilisateur vont dans `l10n/{feature}_strings.dart`, une `const` par libellé.
- Pas de widget Material brut dans une feature : passer par `tactics_components`.

---

## Tests

`test/unit/src/` en miroir de `lib/src/`, **givn** + **shouldly** :

```dart
given('le backend renvoie deux rencontres', (context) => …)
  .when('l’utilisateur consulte les matchs du jour', (sut, _) => sut.fetchMatches(MatchDay.today))
  .then('elles devraient être présentées dans l’ordre des coups d’envoi', (result, _) => …);
```

- Les phrases décrivent un **comportement utilisateur**, pas une implémentation.
  « the user logs in » ✅ · « login is called » ❌
- Les mocks sont générés par mockito depuis `test/unit/src/<package>_mocks.dart`
  (`@GenerateMocks([HttpClient])`), lus via `context.mockOf<MockHttpClient>()`.
- **Aucun test ne touche le réseau** : on mocke `HttpClient`, jamais Dio.
- Pour une source de données, couvrir : nominal, réponse vide, forme inattendue, échec réseau.

---

## Les commandes

```bash
mise run generate   # après avoir touché un .br.dart
mise run format
mise run analyze    # objectif : "No issues found!"
mise run test
mise run bs         # après tout changement de pubspec (ou après Mason)
```

**Le réflexe** : `analyze` parle de `_$…`, `.g.dart`, `.freezed.dart`, `.tailor.dart` ou
`.gr.dart` ? → relance `build_runner` **dans ce package**.
