# 🏟️ Workshop Flutter — Reconstruire la page « Détail d'un match »

Bienvenue ! Ce dépôt est une app de scores foot (Coupe du Monde) déjà
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
shared_domain/scores/domain   →  les "règles" : entités (Match…) + interfaces + use cases
features/scores/
  matchs/data                 →  l'implémentation réelle (API TheSportsDB)
  matchs/presentation         →  l'UI partagée (widgets, thème) + la page Matchs
  live / favorites            →  les autres onglets
  match_detail/presentation   →  ⛔ À CRÉER (la page de détail)
composition/                  →  assemble les features entre elles
```

**Règle d'or** : une feature **n'importe jamais** une autre feature. Ce qui est
partagé passe soit par `shared_domain`, soit par **injection** (on verra).

---

## 🧰 Avant de commencer

Commandes que tu vas répéter :

```bash
# (re)générer le code après avoir touché un fichier annoté @riverpod / @freezed
# Ou utilise package sur VSCode build runner context menu (fait par votre serviteur)
cd <le_package_modifié> && dart run build_runner build --delete-conflicting-outputs

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

**Fichier** `lib/src/providers.dart`
Expose le use case :
```dart
@riverpod
Stream<Match?> watchMatch(Ref ref, String id) =>
    ref.watch(scoresRepositoryProvider).watchMatch(id);
```

> Les entités `MatchEvent`, `Lineup`, `Player` et les champs `Match.events` /
> `Match.lineups` **existent déjà**. Rien à créer côté entités. 🎁

**✅ Vérifie**
```bash
cd packages/shared_domain/scores/domain && dart run build_runner build --delete-conflicting-outputs
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
**Fichier** `lib/src/api/the_sports_db_mapper.dart` : ajoute `toEvents` /
`toLineups` qui prennent les **DTOs** (un but = `strTimeline == 'Goal'`, équipe à
domicile = `strHome == 'Yes'`).

### 2.4 — Implémenter le contrat
**Fichier** `lib/src/data_sources/the_sports_db_scores_data_source.dart` :
```dart
@override
Stream<Match?> watchMatch(String id) => Stream.fromFuture(_fetchDetail(id));
// _fetchDetail : event + timeline + lineup → mapper.toMatch(base, events:…, lineups:…)
```

**✅ Vérifie**
```bash
cd packages/features/scores/matchs/data && dart run build_runner build --delete-conflicting-outputs
flutter analyze   # l'erreur de l'étape 1 doit disparaître ✅
```

---

## Étape 3 — Le clic 👆  (`features/scores/matchs/presentation`)

**Objectif** : rendre une ligne de match cliquable, **sans** que `matchs` ne
connaisse la page de détail. On passe par un **port** (une interface de
navigation) ; l'implémentation viendra de la composition (étape 6).

1. Crée le port `lib/src/routing/scores_routing.dart` :
   ```dart
   abstract interface class ScoresRouting {
     void onMatchSelected(BuildContext context, String matchId);
   }
   ```
2. Crée le stub `lib/src/routing/providers_di.dart` :
   ```dart
   @riverpod
   ScoresRouting scoresRouting(Ref ref) =>
       throw UnimplementedError('scoresRoutingProvider doit être overridé');
   ```
3. Dans `lib/src/widgets/match_row.dart` (remplace le `// WORKSHOP`), enveloppe
   la rangée :
   ```dart
   GestureDetector(
     behavior: HitTestBehavior.opaque,
     onTap: () => ref.read(scoresRoutingProvider).onMatchSelected(context, match.id),
     child: /* le Container existant */,
   )
   ```
4. Exporte le port + le provider dans `lib/matchs_presentation.dart`.

**✅ Vérifie**
```bash
cd packages/features/scores/matchs/presentation && dart run build_runner build --delete-conflicting-outputs
```

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
  --classname match_detail
```

> Sans les flags `--name/--classname`, Mason te **pose les questions**
> (« Nom du package ? » → `match_detail_presentation`, « Nom de la feature ? »
> → `match_detail`).

Ça crée `pubspec.yaml` (déjà bon : `resolution: workspace`, deps
`flutter`/`flutter_riverpod`/`scores_domain`/`tactics_theme`), le barrel
`match_detail_presentation.dart` et un `MatchDetailPage` placeholder.

**✅ Vérifie**
```bash
flutter pub get
flutter analyze packages/features/scores/match_detail/presentation
```

---

## Étape 5 — La page 🎨  (`features/scores/match_detail/presentation`)

**Objectif** : afficher le détail. La feature **possède ses propres widgets**
(elle ne pioche pas dans `matchs`).

1. `lib/src/widgets/event_tile.dart` — une ligne de timeline (minute, icône
   but/carton, joueur).
2. `lib/src/widgets/lineup_section.dart` — une composition (équipe + onze).
3. `lib/src/match_detail_page.dart` — `ConsumerWidget` :
   ```dart
   final match = ref.watch(watchMatchProvider(matchId));
   return match.when(
     loading: ...,           // un loader
     error: ...,             // un message
     data: (m) => ...,       // en-tête + onglets Résumé (m!.events) / Compo (m.lineups)
   );
   ```
4. Barrel `lib/match_detail_presentation.dart` → `export 'src/match_detail_page.dart';`

**✅ Vérifie** : `flutter analyze` (le package doit compiler seul).

---

## Étape 6 — Brancher la navigation 🔗  (`composition/composition_root`)

**Objectif** : connecter le port (étape 3) à la vraie page (étape 5). C'est **le
seul endroit** qui connaît les deux features à la fois.

1. Nouveau `lib/src/app_scores_routing.dart` :
   ```dart
   class AppScoresRouting implements ScoresRouting {
     const AppScoresRouting();
     @override
     void onMatchSelected(BuildContext context, String matchId) =>
         Navigator.of(context).push(MaterialPageRoute<void>(
           builder: (_) => MatchDetailPage(matchId: matchId),
         ));
   }
   ```
2. Dans `lib/src/providers.dart`, ajoute l'override dans `scoresAppOverrides()` :
   ```dart
   scoresRoutingProvider.overrideWithValue(const AppScoresRouting()),
   ```
3. `pubspec.yaml` : ajoute les deps `match_detail_presentation` et
   `matchs_presentation`.

---

## Étape 7 — Lancer 🎉

```bash
flutter pub get
flutter analyze            # objectif : "No issues found!"
cd apps/foot_scores && flutter run
```
Tape un match → la page Détail s'ouvre. **Bravo !** 🥳

---

## 🧠 Ce qu'il faut retenir

1. **On code de l'intérieur vers l'extérieur** : le contrat (domaine) d'abord,
   puis la data, puis l'UI, puis le câblage.
2. **Une feature n'en importe jamais une autre.** La page Matchs ne connaît pas
   la page Détail : elle émet une *intention* via le **port** `ScoresRouting`,
   et la **composition** décide quoi faire.
3. **Un DTO** isole le JSON de l'API du reste du code : si l'API change, tu ne
   corriges qu'un seul endroit.
4. **`build_runner`** régénère le code annoté (`@riverpod`, `@freezed`) — relance-le
   à chaque fois que `analyze` parle de `_$...` ou de `.g.dart`.

---

## 🆘 Si ça coince

- **`The method '…' isn't defined` / `Missing concrete implementation`** → tu as
  changé une interface mais pas (encore) l'implémentation, ou il faut relancer
  `build_runner`.
- **`Target of URI doesn't exist: '….g.dart'`** → lance `build_runner` dans ce
  package.
- **L'écran est vide / une erreur réseau** → regarde la console, les logs
  `[thesportsdb]` montrent chaque appel API et son résultat.
- **Perdu ?** → `grep -rn "WORKSHOP" packages` pour retrouver tous les points à
  compléter.
