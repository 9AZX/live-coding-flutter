# Workshop — reconstruire la feature « Détail d'un match »

Tutoriel pas-à-pas. L'app de départ **compile et tourne** (`flutter run` depuis
`apps/foot_scores`) : feed des matchs du jour (Coupe du Monde), onglets
Hier/Aujourd'hui/Demain, filtres, favoris. **Il manque le détail** : taper une
ligne ne fait rien.

Objectif : reconstruire la tranche verticale complète, **dans l'ordre des
couches** — shared_domain → data → routing → Mason (nouvelle feature) →
présentation → composition.

> Astuce : `grep -rn WORKSHOP packages` liste tous les points d'ancrage laissés
> en commentaire dans le code.

---

## Rappel de l'architecture (où va quoi)

```
packages/
├── shared_domain/scores/domain/        # entités + interfaces repo + use cases (partagé)
├── dsm/tactics_theme/                  # palette + TacticsIcon
├── utilities/widget_factory/…          # WidgetFactory<T>
├── features/scores/
│   ├── matchs/{data,presentation}      # data = impl ScoresRepository ; presentation = UI partagée + thème
│   ├── live/presentation               # fin : consomme des WidgetFactory injectées
│   ├── favorites/{data,domain,presentation}
│   └── match_detail/presentation       # ← À CRÉER
└── composition/{scores_shell, composition_root}
```

Règles : une feature n'importe **jamais** une autre feature. Le partagé passe
par `shared_domain` (domaine) ou par une `WidgetFactory` injectée (UI).
Chaque couche annotée `@riverpod` se régénère avec `build_runner`.

---

## Étape 1 — shared_domain : le contrat

📁 `packages/shared_domain/scores/domain`

1. `lib/src/repositories/scores_repository.dart` — ajouter au contrat :
   ```dart
   Stream<Match?> watchMatch(String id);
   ```
2. `lib/src/providers.dart` — exposer le use case (remplace le `// WORKSHOP`) :
   ```dart
   @riverpod
   Stream<Match?> watchMatch(Ref ref, String id) =>
       ref.watch(scoresRepositoryProvider).watchMatch(id);
   ```
   Les entités `MatchEvent`, `Lineup`, `Player` et les champs `Match.events` /
   `Match.lineups` **existent déjà** — rien à créer côté entités.
3. Régénérer :
   ```bash
   cd packages/shared_domain/scores/domain && dart run build_runner build --delete-conflicting-outputs
   ```

À ce stade tout casse côté data (l'impl ne satisfait plus l'interface) → étape 2.

---

## Étape 2 — data : l'implémentation (TheSportsDB)

📁 `packages/features/scores/matchs/data`

1. `lib/src/api/the_sports_db_client.dart` — ajouter les 3 endpoints du détail
   (le helper `_list` existe déjà) :
   ```dart
   Future<List<Map<String, dynamic>>> timeline(String eventId) =>
       _list('/lookuptimeline.php', {'id': eventId}, key: 'timeline');
   Future<List<Map<String, dynamic>>> lineup(String eventId) =>
       _list('/lookuplineup.php', {'id': eventId}, key: 'lineup');
   Future<Map<String, dynamic>?> event(String eventId) async =>
       (await _list('/lookupevent.php', {'id': eventId}, key: 'events')).firstOrNull;
   ```

2. **🟢 EXERCICE DTO — créer `TimelineEntryDto`.** Le feed utilise déjà un DTO
   propre `lib/src/dtos/event_dto.br.dart` (freezed + json_serializable, champs
   mappés via `@JsonKey(name: …)`) : c'est ton **modèle**. À toi de faire pareil
   pour la timeline, à partir de ce vrai JSON renvoyé par `lookuptimeline.php` :
   ```json
   {
     "idTimeline": "1792473",
     "idEvent": "2267452",
     "strTimeline": "Card",
     "strTimelineDetail": "Yellow Card",
     "strHome": "No",
     "intTime": "10",
     "strPlayer": "Jaka Bijol",
     "strAssist": ""
   }
   ```
   Crée `lib/src/dtos/timeline_entry_dto.br.dart` sur le modèle d'`EventDto` :
   ```dart
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
     factory TimelineEntryDto.fromJson(Map<String, dynamic> json) => _$TimelineEntryDtoFromJson(json);
   }
   ```
   (Même exercice pour `LineupEntryDto` : `strHome`, `strSubstitute`, `strPlayer`,
   `intSquadNumber`.)

3. `lib/src/api/the_sports_db_mapper.dart` — ajouter `toEvents` / `toLineups` qui
   prennent les **DTOs** (plus de `Map`) :
   ```dart
   List<MatchEvent> toEvents(List<TimelineEntryDto> timeline) => [ … ];
   List<Lineup> toLineups(List<LineupEntryDto> lineup,
       {required Team home, required Team away,
        required String homeFormation, required String awayFormation}) => [ … ];
   ```

4. `lib/src/data_sources/the_sports_db_scores_data_source.dart` — `watchMatch`
   (one-shot) : décoder les DTOs (`EventDto.fromJson`, `TimelineEntryDto.fromJson`,
   `LineupEntryDto.fromJson`) puis `mapper.toMatch(base, events:…, lineups:…)` :
   ```dart
   @override
   Stream<Match?> watchMatch(String id) => Stream.fromFuture(_fetchDetail(id));
   ```

5. Régénérer (freezed + json + riverpod) :
   ```bash
   cd packages/features/scores/matchs/data && dart run build_runner build --delete-conflicting-outputs
   ```

---

## Étape 3 — routing : rendre la ligne cliquable

📁 `packages/features/scores/matchs/presentation` (propriétaire de `MatchRow`)

1. Créer le **port** `lib/src/routing/scores_routing.dart` :
   ```dart
   abstract interface class ScoresRouting {
     void onMatchSelected(BuildContext context, String matchId);
   }
   ```
2. Créer le **stub** `lib/src/routing/providers_di.dart` :
   ```dart
   @riverpod
   ScoresRouting scoresRouting(Ref ref) =>
       throw UnimplementedError('scoresRoutingProvider must be overridden');
   ```
3. `lib/src/widgets/match_row.dart` — envelopper la rangée d'un `GestureDetector`
   (remplace le `// WORKSHOP`) :
   ```dart
   GestureDetector(
     behavior: HitTestBehavior.opaque,
     onTap: () => ref.read(scoresRoutingProvider).onMatchSelected(context, match.id),
     child: /* la Container existante */,
   )
   ```
4. Exporter le port dans `lib/matchs_presentation.dart`
   (`export 'src/routing/scores_routing.dart';` + `export 'src/routing/providers_di.dart';`)
   et régénérer :
   ```bash
   cd packages/features/scores/matchs/presentation && dart run build_runner build --delete-conflicting-outputs
   ```

---

## Étape 4 — Mason : scaffolder la feature

```bash
mason make presentation
# → packages/features/scores/match_detail/presentation
```

Ajuster `pubspec.yaml` : `name: match_detail_presentation`, `resolution: workspace`,
deps `flutter`, `flutter_riverpod`, `scores_domain`, `tactics_theme`
(+ `riverpod_annotation`, `build_runner`/`riverpod_generator` si tu ajoutes un thème).

---

## Étape 5 — présentation : la page Détail

📁 `packages/features/scores/match_detail/presentation`

La feature **possède ses propres widgets** (elle ne réutilise pas ceux de
matchs → pas d'import feature→feature). Elle lit la palette via
`tacticsPaletteProvider` (ou un `MatchDetailTheme` maison construit dans
`providers_internal`, comme matchs le fait pour son thème).

1. `lib/src/widgets/event_tile.dart` — une ligne de timeline (`MatchEvent` :
   minute, icône but/carton, joueur, équipe).
2. `lib/src/widgets/lineup_section.dart` — une `Lineup` (badge + nom + formation
   + onze).
3. `lib/src/match_detail_page.dart` — `ConsumerStatefulWidget` :
   ```dart
   final match = ref.watch(watchMatchProvider(widget.matchId));
   // .when(loading/error/data) → en-tête (score / VS / statut) + onglets
   //   Résumé (match.events) et Compo (match.lineups), états vides sinon.
   ```
4. Barrel `lib/match_detail_presentation.dart` → `export 'src/match_detail_page.dart';`
5. Régénérer si tu as mis des `@riverpod` (thème) :
   ```bash
   cd packages/features/scores/match_detail/presentation && dart run build_runner build --delete-conflicting-outputs
   ```

---

## Étape 6 — composition : brancher la navigation

📁 `packages/composition/composition_root`

1. Implémenter le port (nouveau fichier `lib/src/app_scores_routing.dart`) :
   ```dart
   class AppScoresRouting implements ScoresRouting {
     const AppScoresRouting();
     @override
     void onMatchSelected(BuildContext context, String matchId) =>
         Navigator.of(context).push(MaterialPageRoute<void>(
           builder: (_) => MatchDetailPage(matchId: matchId)));
   }
   ```
2. `lib/src/providers.dart` — ajouter l'override dans `scoresAppOverrides()` :
   ```dart
   scoresRoutingProvider.overrideWithValue(const AppScoresRouting()),
   ```
3. `pubspec.yaml` — ajouter les deps `match_detail_presentation` et (déjà là)
   `matchs_presentation` (pour le port `ScoresRouting`).

---

## Étape 7 — lancer & vérifier

```bash
flutter pub get
flutter analyze            # 0 issue attendu
cd apps/foot_scores && flutter run
```

Tape une ligne de match → la page Détail s'ouvre (Résumé + Compo). ✅

---

## Points pédagogiques à marteler

- **L'ordre des couches** : on part du contrat (`shared_domain`), puis l'impl
  (`data`), puis l'UI (`presentation`), puis le câblage (`composition`).
- **Aucune feature n'importe une autre** : `match_detail` ne connaît pas
  `matchs`. La navigation passe par le **port** `ScoresRouting` (déclaré côté
  matchs, implémenté en composition).
- **`shared_domain` = domaine seul** ; l'implémentation du repo vit dans la data
  d'une feature.
- **Le thème est porté par la feature** (construit depuis la palette), pas par un
  theme_manager.
- **Riverpod codegen** : à chaque ajout/suppression de `@riverpod`, relancer
  `build_runner` dans le package concerné.
