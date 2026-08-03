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

Au passage tu vas toucher **toutes les couches** d'une vraie archi Flutter :
domaine, data (+ DTO), présentation, navigation, injection de dépendances.

---

## 🗺️ L'architecture en un coup d'œil

```
shared_domain/scores/domain   →  les "règles" : entités (Match…) + contrats + behaviors
features/scores/
  matchs/data                 →  l'implémentation réelle (API TheSportsDB)
  matchs/presentation         →  l'UI partagée (widgets, thème) + l'écran Matchs
  live / favorites            →  les autres onglets
  match_detail/presentation   →  ⛔ À CRÉER (l'écran de détail)
composition/
  app_providers               →  agrège tous les bindProviders()
  app_router                  →  AppRouter (AutoRoute) + impls des ports de routing
```

**Règle d'or** : une feature **n'importe jamais** une autre feature. Ce qui est
partagé passe soit par `shared_domain`, soit par **injection** (on verra).

---

## 🧰 Avant de commencer

Commandes que tu vas répéter :

```bash
# (re)générer le code après avoir touché un fichier .br.dart (@riverpod / @freezed / …)
mise run generate                  # tout le workspace
cd <le_package_modifié> && dart run build_runner build   # ou juste un package

# vérifier
mise run analyze && mise run test

# lancer l'app
cd apps/foot_scores && flutter run
```

> 💡 À chaque étape, des commentaires `// WORKSHOP` dans le code te montrent
> exactement où écrire. Pour tous les lister :
> ```bash
> grep -rn "WORKSHOP" packages
> ```

---

## Étape 1 — Le contrat 📜  (`shared_domain/scores/domain`)

**Objectif** : déclarer *quoi* on veut, sans dire *comment*.

**Fichier** `lib/src/repositories/scores_repository.dart`
Ajoute une méthode à l'interface (remplace le `// WORKSHOP`) :
```dart
Stream<Match?> watchMatch(String id);
```

**Fichier** `lib/src/providers.br.dart`
Expose le provider (juste sous `watchMatchGroups`, où se trouve le `// WORKSHOP`) :
```dart
@riverpod
Stream<Match?> watchMatch(Ref ref, String id) =>
    ref.watch(scoresRepositoryProvider).watchMatch(id);
```

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

### 2.1 — Les appels API
**Fichier** `lib/src/api/the_sports_db_client.dart` (le helper `_list` existe déjà) :
```dart
Future<List<Map<String, dynamic>>> timeline(String eventId) =>
    _list('/lookuptimeline.php', {'id': eventId}, key: 'timeline');
Future<List<Map<String, dynamic>>> lineup(String eventId) =>
    _list('/lookuplineup.php', {'id': eventId}, key: 'lineup');
Future<Map<String, dynamic>?> event(String eventId) async =>
    (await _list('/lookupevent.php', {'id': eventId}, key: 'events')).firstOrNull;
```

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
> 🏅 **Bonus** : fais pareil pour `LineupEntryDto` (`strHome`, `strSubstitute`,
> `strPlayer`, `intSquadNumber`).

### 2.3 — Le mapper (DTO → entité du domaine)
**Fichier** `lib/src/mappers/event_dto_mapper.dart` : les mappers sont des
**extensions** sur le DTO (`extension EventDtoMapper on EventDto { Match toEntity() }`).
Ajoute sur le même modèle `toEvents` / `toLineups` pour tes nouveaux DTOs (un but =
`strTimeline == 'Goal'`, équipe à domicile = `strHome == 'Yes'`).

### 2.4 — Implémenter le contrat
**Fichier** `lib/src/data_sources/the_sports_db_scores_data_source.dart` :
```dart
@override
Stream<Match?> watchMatch(String id) => Stream.fromFuture(_fetchDetail(id));
// _fetchDetail : event + timeline + lineup → dto.toEntity(events: …, lineups: …)
```

**✅ Vérifie**
```bash
cd packages/features/scores/matchs/data && dart run build_runner build
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

1. `lib/src/widgets/event_tile.dart` — une ligne de timeline (minute, icône
   but/carton, joueur).
2. `lib/src/widgets/lineup_section.dart` — une composition (équipe + onze).
3. `lib/src/match_detail_screen.dart` — `ConsumerWidget` qui prend le `matchId` :
   ```dart
   final match = ref.watch(watchMatchProvider(matchId));
   return match.when(
     loading: ...,           // un loader
     error: ...,             // un message
     data: (m) => ...,       // en-tête + onglets Résumé (m!.events) / Compo (m.lineups)
   );
   ```
4. Dans `lib/src/routing/match_detail_router.br.dart`, passe le `matchId` en
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
5. Les couleurs et styles viennent de **ton** thème
   (`ref.watch(matchDetailThemeProvider.select(…))`), alimenté par défaut depuis la
   palette DSM dans `providers_internal.br.dart`. Jamais de couleur brute, jamais
   d'import de `tactics_providers`.

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

## Étape 7 — Lancer 🎉

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
3. **Un DTO** isole le JSON de l'API du reste du code : si l'API change, tu ne
   corriges qu'un seul endroit.
4. **`build_runner`** régénère le code annoté (`@riverpod`, `@freezed`,
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
- **L'écran est vide / une erreur réseau** → regarde la console, les logs
  `[matchs_data]` montrent chaque appel API et son résultat.
- **Perdu ?** → `grep -rn "WORKSHOP" packages` pour retrouver tous les points à
  compléter.
