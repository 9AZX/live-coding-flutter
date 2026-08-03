# Les conventions, en une page

Version courte d'`AGENTS.md`. Garde-la ouverte pendant l'exercice.

---

## Les couches

```
domain        →  entités, contrats (repositories), behaviors.  Ne dépend de RIEN.
data          →  implémente les contrats du domaine.  Dépend de SON domain, c'est tout.
presentation  →  écran, widgets, thème, port de routing.  Dépend de son domain, JAMAIS de data.
composition   →  app_providers, app_router, regulations/*.  La SEULE couche qui connaît
                 toutes les features, et la seule à appeler bindProviders().
```

Une feature n'importe jamais une autre feature. Ce qui est partagé passe par
`shared_domain` ou par injection.

---

## Le quadruplet de providers

Chaque package qui expose des providers a les mêmes quatre fichiers.

| Fichier | Rôle |
|---|---|
| `providers_di.br.dart` | **contrats entrants** : chaque provider `throw UnregisteredProviderException`. **Jamais exporté par le barrel.** |
| `providers_internal.br.dart` | câblage interne, valeurs par défaut (source de données, thème par défaut). Pas public. |
| `providers.br.dart` / `providers.dart` | l'API publique, plus `bindProviders({...})` qui retourne `List<Override>` |

La composition appelle `bindProviders(...)` et rien d'autre. Elle n'override jamais un
symbole de `providers_di` en direct.

Un contrat non fourni plante au premier build. Pas de `null` silencieux.

---

## Erreurs : un échec est une valeur

```dart
Future<Result<Match, ScoresError>> fetchMatch(String id);   //  Success | Failure
```

Trois traductions successives, pour qu'aucune feature ne dépende de la lib HTTP :

```
DioException  →  NetworkError  →  ScoresError
  (Dio)          (network_dio)     (la source de données)
```

Les exceptions couvrent les erreurs de programmation, comme
`UnregisteredProviderException`.

- Une source de données prend un **`HttpClient` injecté**. Jamais un `Dio`, jamais un
  client maison.
- Ses chemins sont des `static const String _xxxPath` sur la classe.
- L'enveloppe de la réponse est un **DTO**, pas un `json['clé']` écrit à la main. Une API
  qui change de forme doit échouer au parsing.
- Journalise une seule fois, dans la couche qui produit l'échec.
- Côté état, `getOrThrow()` fait atterrir l'échec dans l'`AsyncValue`, et l'écran affiche
  la copie utilisateur de son `l10n`. **Jamais `Text('$error')`.**

---

## Navigation : la feature émet, la composition décide

La feature déclare un **port** et nomme ses méthodes d'après l'évènement.

| Type | Forme | Exemple |
|---|---|---|
| Intention | `on…Requested` | `onMatchDetailRequested` |
| Résultat | `on…Successful` | `onAuthenticationSuccessful` |
| Fermeture | `onDismiss…` | `onDismissMatchDetail` |

À éviter : `navigateTo…` et `push…`, parce que la destination appartient au router.
`onTap…` et `on…Clicked` aussi : décris l'intention, pas le geste.

Les chemins sont des enums colocalisés `{Feature}RoutePath`. Aucune chaîne en dur.

---

## Riverpod

- `@riverpod` plus codegen. Le générateur retire le suffixe `Notifier` :
  `class ScoresFilterNotifier` donne `scoresFilterProvider`.
- `ref.watch(xProvider.select((x) => x.champ))` pour éviter les rebuilds.
- La présentation ne lit jamais un repository. Elle lit des providers d'état et appelle
  des **behaviors** : `ref.read(toggleFavoriteMatchProvider)(id)`.
- En test, override les dépendances directes, via les `bindProviders` publics. Pas tout
  le graphe.

---

## Style

- Tout fichier qui a besoin de codegen finit en **`.br.dart`**, avec le `part` qui va
  avec (`.br.g.dart`, `.br.freezed.dart`, `.br.tailor.dart`, `.br.gr.dart`).
- Ordre des membres : champs, puis constructeurs, puis méthodes.
- Ordre alphabétique partout : paramètres, champs, constantes d'enum, imports,
  dépendances.
- 120 colonnes. Pas de `!` (force-unwrap). Pas de `print()` ni de `debugPrint()`.
- Pas de `DateTime.now()` dans de la logique testable. Injecte une horloge.
- Aucune couleur brute (`0xFF…`, `Colors.red`) et aucune valeur en dur dans une feature :
  passe par le thème de la feature (`{feature}ThemeProvider`), alimenté depuis la palette
  DSM. N'importe **jamais** `tactics_providers` dans une feature.
- Les libellés utilisateur vivent dans `l10n/{feature}_strings.dart`, une `const` par
  libellé.
- Pas de widget Material brut dans une feature. Passe par `tactics_components`.

---

## Tests

`test/unit/src/` en miroir de `lib/src/`, avec **givn** et **shouldly** :

```dart
given('le backend renvoie deux rencontres', (context) => …)
  .when('l’utilisateur consulte les matchs du jour', (sut, _) => sut.fetchMatches(MatchDay.today))
  .then('elles devraient être présentées dans l’ordre des coups d’envoi', (result, _) => …);
```

- Les phrases décrivent un comportement utilisateur, pas une implémentation.
  « the user logs in » plutôt que « login is called ».
- Les mocks sont générés par mockito depuis `test/unit/src/<package>_mocks.dart`
  (`@GenerateMocks([HttpClient])`), et lus via `context.mockOf<MockHttpClient>()`.
- Aucun test ne touche le réseau. On mocke `HttpClient`, jamais Dio.
- Pour une source de données, couvre le cas nominal, la réponse vide, la forme inattendue
  et l'échec réseau.

---

## Les commandes

```bash
mise run generate   # après avoir touché un .br.dart
mise run format
mise run analyze    # objectif : "No issues found!"
mise run test
mise run bs         # après tout changement de pubspec, ou après Mason
```

Le réflexe : si `analyze` parle de `_$…`, `.g.dart`, `.freezed.dart`, `.tailor.dart` ou
`.gr.dart`, relance `build_runner` **dans ce package**.
