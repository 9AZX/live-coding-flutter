# 🏟️ Workshop Flutter — Reconstruire la page « Détail d'un match »

Bienvenue ! Ce dépôt est une app de scores foot (Ligue 1) déjà
fonctionnelle… **sauf une chose** : quand tu tapes sur un match, rien ne se
passe. La page de détail a été retirée. **À toi de la reconstruire**, couche par
couche.

C'est un exercice guidé : suis les étapes dans l'ordre, vérifie à chaque fois
que ça compile, et pose des questions.

---

## 🎯 Ce que tu vas construire

Taper une ligne de match → une page **Détail** s'ouvre, avec :
- un en-tête (les 2 équipes, le score ou « VS », le statut) ;
- un onglet **Résumé** (la timeline : buts, cartons) ;
- un onglet **Compo** (les compositions des deux équipes).

Puis, en bonus d'archi : afficher les **cotes** sur cet écran… mais **seulement sur
le marché français**, sans que l'écran sache qu'un marché existe.

Au passage tu vas toucher **toutes les couches** d'une vraie archi Flutter :
domaine, data (+ DTO), présentation, navigation, injection de dépendances,
composition par marché.

---

## 🗺️ L'architecture en un coup d'œil

```
shared_domain/scores/domain   →  les "règles" : entités (Match…) + contrats + behaviors
features/scores/
  matchs/data                 →  l'implémentation réelle (API TheSportsDB)
  matchs/presentation         →  l'UI partagée (widgets, thème) + l'écran Matchs
  live / favorites            →  les autres onglets
  odds                        →  les cotes 1 N 2, exposées sur certains marchés seulement
  match_detail/presentation   →  ⛔ À CRÉER (l'écran de détail)
composition/
  app_providers               →  agrège tous les bindProviders()
  app_router                  →  AppRouter (AutoRoute) + impls des ports de routing
  regulations/fr_providers    →  ce que le marché FR expose
  regulations/pl_providers    →  ce que le marché PL expose
utilities/
  network/shared/domain       →  le contrat HttpClient (+ NetworkError) : personne ne connaît Dio
  network/dio/data            →  l'implémentation Dio, branchée par la composition
  types/result/domain         →  Result<T, E> : un appel réussit ou échoue, il ne "throw" pas
```

**Règle d'or** : une feature **n'importe jamais** une autre feature. Ce qui est
partagé passe soit par `shared_domain`, soit par **injection** (on verra).

**Deux marchés** tournent sur le même code : la France vend des cotes, la Pologne
non, et `matchs/presentation` est identique dans les deux cas. Tu exploiteras ce
mécanisme à l'étape 7.

---

## 🧰 Avant de commencer

Commandes que tu vas répéter :

```bash
# (re)générer le code après avoir touché un fichier .br.dart (@riverpod / @freezed / …)
mise run generate                  # tout le workspace
cd <le_package_modifié> && dart run build_runner build   # ou juste un package

# vérifier — c'est ta boucle de retour, pas besoin de lancer l'app
mise run analyze && mise run test

# lancer l'app (marché FR par défaut)
cd apps/foot_scores && flutter run -d macos

# lancer le marché polonais (mêmes features, sans les cotes)
cd apps/foot_scores && flutter run -d macos --dart-define=REGULATION=pl
```

> 💡 À chaque étape, des commentaires `// WORKSHOP` dans le code te montrent
> exactement où écrire. Pour tous les lister :
> ```bash
> grep -rn "WORKSHOP" packages
> ```

> 📋 Garde **`CONVENTIONS.md`** ouvert à côté : c'est la version une page des règles
> d'archi. C'est là que tu trouveras la réponse à « où est-ce que ça va, ça ? ».

---

## ⏱️ Le périmètre du jour

3 heures, donc on coupe volontairement tout ce qui n'est pas de l'architecture :

| Hors périmètre | Pourquoi |
|---|---|
| **Le look de l'écran** | Une `Column` de `Text`, c'est très bien. On ne fait pas d'UI aujourd'hui. |
| **`LineupEntryDto`** (compos) | Un seul DTO suffit à comprendre ce qu'est un DTO. Bonus si tu as le temps. |
| **Les tests** (étape 2.5) | À lire et à commenter, à écrire seulement si ton trio est en avance. |

Ce qui compte, à chaque étape : **savoir dans quelle couche va la chose que tu écris,
et pourquoi**. Le code, l'IA le tape en 30 secondes.

---

## Étape 1 — Le contrat 📜  (`shared_domain/scores/domain`)

**Objectif** : déclarer *quoi* on veut, sans dire *comment*.

**Fichier** `lib/src/repositories/scores_repository.dart`
Ajoute une méthode à l'interface (remplace le `// WORKSHOP`) :
```dart
Future<Result<Match, ScoresError>> fetchMatch(String id);
```

> 🔑 **`Result<T, E>`, pas d'exception.** Un appel réussit (`Success`) ou échoue
> (`Failure`) : l'échec est une **valeur de retour**, visible dans la signature, que
> le compilateur t'oblige à traiter. Les exceptions restent réservées aux **bugs**
> (`UnregisteredProviderException`). Regarde `fetchMatches` juste au-dessus.

**Fichier** `lib/src/entities/errors/scores_error.br.dart`
Le match demandé peut ne pas exister : ajoute un cas à l'union scellée.
```dart
@freezed
sealed class ScoresError with _$ScoresError {
  const factory ScoresError.notFound() = NotFoundScoresError;
  const factory ScoresError.unavailable() = UnavailableScoresError;
}
```

**Fichier** `lib/src/behaviors/fetch_match.dart`
La présentation n'appelle **jamais** un repository : elle appelle un *behavior*.
Copie la forme de `fetch_matches.dart` (une classe, un `execute`).

**Fichier** `lib/src/providers.br.dart`
Expose le behavior et le provider d'état (là où se trouve le `// WORKSHOP`) :
```dart
@riverpod
FetchMatch fetchMatch(Ref ref) => FetchMatch(repository: ref.watch(scoresRepositoryProvider));

@riverpod
Future<Match> match(Ref ref, String id) async =>
    (await ref.watch(fetchMatchProvider).execute(id)).getOrThrow();
```
> `getOrThrow()` reporte l'échec du `Result` dans l'`AsyncValue` du provider : ton
> écran lira un `AsyncError` sans jamais manipuler de `Result`.

> Les entités `MatchEvent`, `Lineup`, `Player` et les champs `Match.events` /
> `Match.lineups` **existent déjà**. Rien à créer côté entités. 🎁

**✅ Vérifie**
```bash
cd packages/shared_domain/scores/domain && dart run build_runner build
```
👉 Un `flutter analyze` global va maintenant **râler** : l'implémentation ne
respecte plus le contrat. **C'est normal** — on la corrige à l'étape 2.

---

## Étape 2 — La donnée 🔌  (`features/scores/matchs/data`)

**Objectif** : aller chercher les vraies données sur l'API et les transformer.

### 2.1 — Les trois endpoints
Il n'y a **pas** de classe « client API » à remplir : la source de données reçoit un
`HttpClient` injecté (contrat de `network_domain`) et déclare ses chemins elle-même.
Dans `the_sports_db_scores_data_source.dart`, à côté de `_eventsDayPath` :

```dart
static const String _lineupPath = '/lookuplineup.php';
static const String _lookupEventPath = '/lookupevent.php';
static const String _timelinePath = '/lookuptimeline.php';
```

> 💡 La source ne connaît ni Dio, ni l'URL du backend : `HttpClient` est un contrat,
> l'implémentation Dio est branchée par la composition (`network_dio_data`), et la
> `baseUrl` arrive par injection. Changer de lib HTTP ne toucherait aucune feature.

### 2.2 — 🟢 EXERCICE : ton premier DTO
Un **DTO** = une classe typée qui représente le JSON de l'API (au lieu de
manipuler des `Map` à l'aveugle).

👀 **Regarde le modèle déjà fait** : `lib/src/dtos/event_dto.br.dart`
(c'est un DTO `freezed` + `json_serializable`, chaque champ JSON est mappé avec
`@JsonKey(name: '...')`).

🎯 **À toi** : crée `lib/src/dtos/timeline_entry_dto.br.dart` à partir de ce vrai
JSON renvoyé par l'API :
```json
{
  "strTimeline": "Card",
  "strTimelineDetail": "Yellow Card",
  "strHome": "No",
  "intTime": "10",
  "strPlayer": "Jaka Bijol",
  "strAssist": ""
}
```
Sur le même modèle qu'`EventDto` :
```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timeline_entry_dto.br.freezed.dart';
part 'timeline_entry_dto.br.g.dart';

@freezed
abstract class TimelineEntryDto with _$TimelineEntryDto {
  const factory TimelineEntryDto({
    @JsonKey(name: 'strTimeline') String? type,
    @JsonKey(name: 'strTimelineDetail') String? detail,
    @JsonKey(name: 'strHome') String? home,
    @JsonKey(name: 'intTime') String? minute,
    @JsonKey(name: 'strPlayer') String? player,
    @JsonKey(name: 'strAssist') String? assist,
  }) = _TimelineEntryDto;

  factory TimelineEntryDto.fromJson(Map<String, dynamic> json) =>
      _$TimelineEntryDtoFromJson(json);
}
```
> 🏅 **Bonus, si ton trio est en avance** : fais pareil pour `LineupEntryDto`
> (`strHome`, `strSubstitute`, `strPlayer`, `intSquadNumber`) pour alimenter l'onglet
> Compo. Sinon, contente-toi de la timeline : l'onglet Compo restera vide, et c'est
> très bien — l'API ne le remplit pas pour tous les matchs de toute façon.

Il te faut aussi l'**enveloppe** de la réponse — l'API emballe toujours sa liste
sous une clé. Regarde `events_response_dto.br.dart`, puis crée la même chose pour la
timeline (clé `timeline`) :
```dart
@freezed
abstract class TimelineResponseDto with _$TimelineResponseDto {
  const factory TimelineResponseDto({@JsonKey(name: 'timeline') List<TimelineEntryDto>? timeline}) =
      _TimelineResponseDto;

  factory TimelineResponseDto.fromJson(Map<String, dynamic> json) => _$TimelineResponseDtoFromJson(json);
}
```
> Pourquoi ne pas juste lire `json['timeline']` ? Parce qu'une API qui change de forme
> doit **échouer au parsing**, pas rendre une liste vide qu'on prendrait pour « aucun
> évènement ». `/lookupevent.php` renvoie la clé `events` : `EventsResponseDto` est
> réutilisable telle quelle. 🎁

### 2.3 — Le mapper (DTO → entité du domaine)
**Fichier** `lib/src/mappers/event_dto_mapper.dart` : les mappers sont des
**extensions** sur le DTO. Regarde la signature existante :

```dart
extension EventDtoMapper on EventDto {
  Match toEntity({String country = '', List<MatchEvent> events, List<Lineup> lineups}) { … }
}
```

`country` est passé par le data source, qui le tient du **catalogue de ligues injecté
par le marché** — le mapper ne devine rien tout seul.

Ajoute sur le même modèle un mapper pour ton `TimelineEntryDto` (un but =
`strTimeline == 'Goal'`, un carton = `'Card'`, équipe à domicile = `strHome == 'Yes'`).

> 💡 Un remplacement (`strTimeline == 'subst'`) n'est pas un fait de jeu qu'on affiche :
> rends `null` et laisse le data source filtrer. Un mapper décide de la **traduction**,
> pas de l'affichage.

### 2.4 — Implémenter le contrat
**Fichier** `lib/src/data_sources/the_sports_db_scores_data_source.dart`.
Copie la forme de `_leagueMatches` : un `try`, un `if (response.data case final data?)`,
et un `Failure` sur chaque sortie qui n'a pas de données.

```dart
@override
Future<Result<Match, ScoresError>> fetchMatch(String id) async {
  // 3 appels : _lookupEventPath, _timelinePath, _lineupPath (queryParameters: {'id': id})
  //   → l'event absent  ⇒ Failure(ScoresError.notFound())
  //   → un échec réseau ⇒ Failure(ScoresError.unavailable())
  //   → sinon dto.toEntity(country: _countryByLeague[leagueId] ?? '', events: …, lineups: …)
}
```

> 💡 Les trois appels sont indépendants : `Future.wait` les lance en parallèle plutôt
> qu'en file — le détail s'ouvre en un aller-retour, pas trois.

> 💡 `_countryByLeague` et `_leagueIds` sont des champs **injectés** dans le
> constructeur : la source ne connaît pas les compétitions du marché. Regarde
> `providers_internal.br.dart` pour voir d'où ils viennent — même chose pour `clock`,
> qui évite un `DateTime.now()` en dur (intestable).

### 2.5 — 🏅 BONUS : le test de la source
**Ouvre** `the_sports_db_scores_data_source_test.dart` et lis-le, même si tu n'écris rien :
c'est la convention de test de la prod. Le `HttpClient` y est un **mock** mockito déclaré
dans `matchs_data_mocks.dart`, donc aucun test ne touche le réseau, et les phrases
`given/when/then` décrivent un comportement **utilisateur**.

Si ton trio est en avance, ajoute ces trois-là :
- le détail d'un match affiche ses buts ;
- un match inconnu remonte `ScoresError.notFound()` ;
- un service injoignable remonte `ScoresError.unavailable()`.

**✅ Vérifie**
```bash
cd packages/features/scores/matchs/data && dart run build_runner build && flutter test
mise run analyze   # l'erreur de l'étape 1 doit disparaître ✅
```

---

## Étape 3 — Le clic 👆  (`features/scores/matchs/presentation`)

**Objectif** : comprendre comment `matchs` demande l'ouverture du détail **sans**
connaître l'écran de détail. Ça passe par un **port** — une interface de navigation
que la composition implémente (étape 6).

Cette partie est **déjà en place**, lis-la plutôt que de l'écrire :

1. Le port `lib/src/routing/matchs_routing.dart` :
   ```dart
   abstract interface class MatchsRouting {
     void onMatchDetailRequested(String matchId);
   }
   ```
   Les méthodes sont nommées par **évènement** (`on…Requested`), jamais par
   impératif (`navigateTo…`) : la destination appartient au router.
2. Le contrat dans `lib/src/providers_di.br.dart`, qui `throw
   UnregisteredProviderException` jusqu'à ce que la composition le fournisse.
3. `lib/src/widgets/match_row.dart` émet déjà l'intention :
   ```dart
   onTap: () => ref.read(matchsRoutingProvider).onMatchDetailRequested(match.id),
   ```
4. Côté composition, `packages/composition/app_router/lib/src/routing/app_matchs_routing.dart`
   implémente le port… avec un corps **vide** (`// WORKSHOP`). D'où le symptôme :
   tu tapes un match, rien ne se passe. Tu le rempliras à l'étape 6.

> 💡 À retenir : la feature émet une intention, la composition décide de la
> destination. C'est ce qui permet à `matchs` d'ignorer l'existence du détail.

---

## Étape 4 — Créer la feature 🏗️  (Mason)

Mason scaffolde un package prêt à l'emploi (pubspec + barrel + page).

```bash
# 1) récupérer les bricks déclarées dans mason.yaml (une seule fois)
mason get

# 2) générer la feature directement au bon endroit
mason make presentation \
  -o packages/features/scores/match_detail/presentation \
  --name match_detail_presentation \
  --classname match_detail \
  --domainPackage scores_domain
```

> Sans les flags, Mason te **pose les questions** (« Nom du package ? » →
> `match_detail_presentation`, « Nom de la feature ? » → `match_detail`,
> « Nom du package domain ? » → `scores_domain`).

Ça crée toute la structure conforme au repo de prod : `pubspec.yaml`, `build.yaml`,
`package_name.dart`, le triplet `providers_di.br` / `providers_internal.br` /
`providers.dart`, le port `match_detail_routing.dart`, le router
`match_detail_router.br.dart` (enum `MatchDetailRoutePath` + `@RoutePage`), un thème
theme_tailor, et un test placeholder.

**✅ Vérifie**
```bash
mise run bs
cd packages/features/scores/match_detail/presentation && dart run build_runner build
mise run analyze
```

---

## Étape 5 — La page 🎨  (`features/scores/match_detail/presentation`)

**Objectif** : afficher le détail. La feature **possède ses propres widgets**
(elle ne pioche pas dans `matchs`).

> ⚠️ **On ne fait pas d'UI aujourd'hui.** Une `Column` de `Text` suffit — le score, la
> liste des buts, et c'est tout. Pas d'onglets si tu n'as pas le temps, pas de mise en
> page. Ce qui compte, c'est *où* vivent les choses, pas comment elles sont jolies.

1. `lib/src/match_detail_screen.dart` — `ConsumerWidget` qui prend le `matchId` :
   ```dart
   final match = ref.watch(matchProvider(matchId));
   return match.when(
     loading: ...,           // un loader
     error: ...,             // une copie utilisateur de ton l10n, jamais '$error'
     data: (m) => ...,       // score + la liste de m.events
   );
   ```
2. Les libellés vont dans `lib/src/l10n/match_detail_strings.dart`, une `const` par
   libellé — pas de chaîne en dur dans le widget.
3. Dans `lib/src/routing/match_detail_router.br.dart`, passe le `matchId` en
   paramètre de route et déclare le chemin absolu :
   ```dart
   enum MatchDetailRoutePath {
     matchDetail(path: '/match/:id');
     // …
   }

   @RoutePage(name: 'MatchDetailRoute')
   class MatchDetailPage extends ConsumerWidget {
     final String matchId;

     const MatchDetailPage({@PathParam('id') required this.matchId, super.key});

     @override
     Widget build(BuildContext context, WidgetRef ref) => MatchDetailScreen(matchId: matchId);
   }
   ```
4. Les couleurs et styles viennent de **ton** thème
   (`ref.watch(matchDetailThemeProvider.select(…))`), alimenté par défaut depuis la
   palette DSM dans `providers_internal.br.dart`. Jamais de couleur brute, jamais
   d'import de `tactics_providers`.

> 🏅 **Bonus** : `lib/src/widgets/match_event_tile.dart` (une ligne de timeline) et
> `lineup_section.dart` (une composition), puis des onglets Résumé / Compo.

**✅ Vérifie** : `dart run build_runner build` puis `mise run analyze` (le package
doit compiler seul).

---

## Étape 6 — Brancher la navigation 🔗  (`composition/`)

**Objectif** : connecter le port (étape 3) au vrai écran (étape 5). La composition
est **le seul endroit** qui connaît les deux features à la fois.

Dans **`packages/composition/app_router`** :

1. `pubspec.yaml` : ajoute la dep `match_detail_presentation:`.
2. `lib/src/app_router.br.dart` : déclare la route (remplace le `// WORKSHOP`) :
   ```dart
   AutoRoute(page: MatchDetailRoute.page, path: MatchDetailRoutePath.matchDetail.path),
   ```
3. `lib/src/routing/app_matchs_routing.dart` : remplis le corps vide :
   ```dart
   @override
   void onMatchDetailRequested(String matchId) => _router.push(MatchDetailRoute(matchId: matchId));
   ```
4. `dart run build_runner build` dans `app_router` (AutoRoute doit régénérer
   `app_router.br.gr.dart` avec la nouvelle route).

Dans **`packages/composition/app_providers`** :

5. `pubspec.yaml` : ajoute la dep `match_detail_presentation:`.
6. `lib/src/app_providers.dart` : fournis le port de la nouvelle feature :
   ```dart
   ...match_detail_presentation.bindProviders(
     routing: (ref) => const AppMatchDetailRouting(),
   ),
   ```
   (avec un `AppMatchDetailRouting` dans `app_router`, même forme que
   `AppMatchsRouting` — par exemple pour gérer le retour.)

---

## Étape 7 — 🟢 EXERCICE : les cotes, en France seulement  (`regulations/`)

**Objectif** : ajouter les **cotes** sur ton écran détail — mais uniquement sur le
marché français. Ton écran ne doit **pas** savoir qu'un marché existe, ni que la
feature `odds` existe.

C'est l'**inversion de dépendance** en pratique : ton écran déclare *« quelqu'un peut
me donner un widget de cotes »*, et chaque marché répond oui ou non.

Le modèle à copier est déjà dans `matchs/presentation` (`matchOddsFactoryProvider`) :
va le lire d'abord.

### 7.1 — Déclarer le contrat (dans **ta** feature)
`match_detail/presentation/lib/src/providers_di.br.dart` — un contrat **nullable**,
qui `throw` quand même :
```dart
@riverpod
WidgetFactory<Match>? matchDetailOddsFactory(Ref _) {
  throw UnregisteredProviderException(matchDetailOddsFactoryProvider);
}
```
> Pourquoi throw si c'est nullable ? Pour forcer **chaque** marché à répondre
> explicitement. Un marché oublié plante au premier build au lieu d'afficher un
> écran incomplet en silence.

Ajoute `widget_factory_presentation:` et `scores_domain:` au `pubspec.yaml`.

### 7.2 — Ouvrir le contrat à la composition
`match_detail/presentation/lib/src/providers.dart` :
```dart
List<Override> bindRegulationProviders({required WidgetFactory<Match>? oddsFactory}) => [
  matchDetailOddsFactoryProvider.overrideWithValue(oddsFactory),
];
```

### 7.3 — L'utiliser dans l'écran
`match_detail_screen.dart`, là où tu veux les cotes :
```dart
?ref.watch(matchDetailOddsFactoryProvider)?.create(match),
```
> Le `?` devant l'élément est le *null-aware element* de Dart 3 : pas de cotes,
> pas de ligne dans la `Column`. Aucun `if` à écrire.

### 7.4 — Répondre, marché par marché
`composition/regulations/fr_providers` — la France vend des paris :
```dart
// pubspec.yaml : ajoute match_detail_presentation:
...match_detail_presentation.bindRegulationProviders(oddsFactory: const OddsBadgeWidgetFactory()),
```

`composition/regulations/pl_providers` — pas de cotes ici :
```dart
// pubspec.yaml : ajoute match_detail_presentation: (mais SURTOUT PAS odds_presentation)
...match_detail_presentation.bindRegulationProviders(oddsFactory: null),
```

**✅ Vérifie les deux marchés**
```bash
mise run bs && mise run generate && mise run analyze
cd apps/foot_scores
flutter run                                # FR → les cotes s'affichent
flutter run --dart-define=REGULATION=pl    # PL → même écran, sans cotes
```

> 🎓 Le point clé : entre les deux marchés, **ton écran n'a pas changé d'une ligne**.
> Et comme `pl_providers` ne déclare pas `odds_presentation`, la feature n'entre même
> pas dans le binaire polonais.

---

## Étape 8 — Lancer 🎉

```bash
mise run bs
mise run generate
mise run format
mise run analyze           # objectif : "No issues found!"
mise run test
cd apps/foot_scores && flutter run
```
Tape un match → l'écran Détail s'ouvre. **Bravo !** 🥳

---

## 🧠 Ce qu'il faut retenir

1. **On code de l'intérieur vers l'extérieur** : le contrat (domaine) d'abord,
   puis la data, puis l'UI, puis le câblage.
2. **Une feature n'en importe jamais une autre.** L'écran Matchs ne connaît pas
   l'écran Détail : il émet une *intention* via le **port** `MatchsRouting`, et la
   **composition** décide de la destination.
   Corollaire : un contrat DI (`providers_di.br.dart`) `throw` tant que personne ne
   l'a fourni — l'erreur est immédiate et explicite, jamais un `null` silencieux.
3. **Inversion de dépendance** : une feature déclare un *contrat* et ne sait jamais
   qui le remplit. C'est ce qui permet à un même écran d'avoir les cotes en France et
   pas en Pologne, sans une seule condition `if (marché == …)` dans la feature.
   Deux formes : une **valeur** injectée (le catalogue de ligues) ou une **feature
   entière** injectée (`WidgetFactory<T>?`, `null` = absente).
4. **Un DTO** isole le JSON de l'API du reste du code : si l'API change, tu ne
   corriges qu'un seul endroit. Modélise aussi l'**enveloppe** de la réponse : une
   forme inattendue doit échouer, pas se faire passer pour un résultat vide.
5. **Un échec est une valeur, pas une exception.** `Result<T, E>` met l'erreur dans la
   signature ; les couches basses traduisent (`DioException` → `NetworkError` →
   `ScoresError`) pour qu'aucune feature ne dépende de la lib HTTP. Les exceptions sont
   réservées aux erreurs de programmation.
5. **`build_runner`** régénère le code annoté (`@riverpod`, `@freezed`,
   `@TailorMixinComponent`, `@RoutePage`) — relance-le à chaque fois que `analyze`
   parle de `_$...`, `.g.dart`, `.freezed.dart`, `.tailor.dart` ou `.gr.dart`.
   Seuls les fichiers en **`.br.dart`** sont passés aux générateurs.

---

## 🆘 Si ça coince

- **`The method '…' isn't defined` / `Missing concrete implementation`** → tu as
  changé une interface mais pas (encore) l'implémentation, ou il faut relancer
  `build_runner`.
- **`Target of URI doesn't exist: '….g.dart'` / `.gr.dart` / `.tailor.dart`** →
  lance `build_runner` dans ce package (et vérifie que le fichier source finit bien
  en `.br.dart`, sinon les générateurs l'ignorent).
- **`UnregisteredProviderException`** → un contrat DI n'a pas été fourni : ajoute
  l'appel `bindProviders(...)` correspondant dans `app_providers`.
- **L'écran est vide / une erreur réseau** → regarde la console : `[network_dio_data]`
  trace les appels HTTP en échec, `[matchs_data]` les réponses inattendues (JSON d'une
  forme imprévue, bug de mapping).
- **Perdu ?** → `grep -rn "WORKSHOP" packages` pour retrouver tous les points à
  compléter.
