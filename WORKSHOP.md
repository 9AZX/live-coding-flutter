# Workshop — reconstruire la feature « Détail d'un match »

L'app de départ **compile et tourne** : feed des matchs du jour (Coupe du Monde),
onglets Hier/Aujourd'hui/Demain, filtres, favoris. **Une seule chose manque** :
on ne peut pas ouvrir le détail d'un match (les lignes ne sont pas cliquables).

Objectif du live-coding : reconstruire cette tranche verticale **de bout en bout**
— Mason → domain → data → présentation → DSM → composition.

> Repère les points d'ancrage : `grep -rn WORKSHOP packages` montre tout ce qui
> reste à brancher.

---

## Ce qui a été retiré (volontairement)

| Couche | Élément supprimé |
|--------|------------------|
| Feature | package `packages/features/scores/match_detail/presentation` (page + widgets) |
| Domain | `ScoresRepository.watchMatch(id)` + provider `watchMatch` |
| Data | `TheSportsDb…watchMatch` / fetch détail · client `lookupevent/timeline/lineup` · mapper `toEvents`/`toLineups` |
| DSM | port `ScoresRouting` + `scoresRoutingProvider` · `onTap` de `MatchRow` |
| Composition | package `packages/composition/scores_router` · `bindRouterProviders()` |

Entités déjà en place (rien à refaire) : `Match.events`, `Match.lineups`,
`MatchEvent`, `Lineup`, `Player` dans `scores_domain`.

---

## Script de reconstruction

### 1. Mason — scaffolder la feature

```bash
mason make presentation        # → packages/features/scores/match_detail/presentation
```

Adapter le `pubspec.yaml` (deps : `flutter_riverpod`, `scores_domain`,
`scores_widgets`, `tactics_theme`) et `resolution: workspace`.

### 2. Domain — le port côté métier

- `scores_repository.dart` : ajouter `Stream<Match?> watchMatch(String id);`
- `providers.dart` : `@riverpod Stream<Match?> watchMatch(Ref ref, String id) => ref.watch(scoresRepositoryProvider).watchMatch(id);`
- `dart run build_runner build` dans `scores_domain`.

### 3. Data — implémenter le fetch détail (TheSportsDB)

- `the_sports_db_client.dart` : `lookupevent.php` (event), `lookuptimeline.php`
  (timeline, clé `timeline`), `lookuplineup.php` (compos, clé `lineup`).
- `the_sports_db_mapper.dart` : `toEvents(timeline)` et
  `toLineups(lineup, home, away, homeFormation, awayFormation)`.
- `the_sports_db_scores_data_source.dart` : `watchMatch(id)` = event + timeline +
  lineup → `mapper.toMatch(base, events:…, lineups:…)`.

### 4. Présentation — la page

`MatchDetailPage(matchId)` : `ref.watch(watchMatchProvider(id))` → `.when(...)`.
En-tête rouge (retour, compétition, score/VS, statut), onglets **Résumé**
(timeline via `MatchEvent`) et **Compo** (via `Lineup`). Réutiliser
`ScoresHeader`, `TeamBadge`, `LiveDot`, `EmptyState` de `scores_widgets`.

### 5. DSM — le port de navigation + rendre la ligne cliquable

- `scores_widgets` : recréer `routing/scores_routing.dart`
  (`abstract interface class ScoresRouting { void onMatchSelected(BuildContext, String); }`)
  + `scoresRoutingProvider` (stub qui throw) dans `providers_di.dart` ; ré-exporter dans le barrel.
- `MatchRow` : envelopper d'un `GestureDetector` →
  `ref.read(scoresRoutingProvider).onMatchSelected(context, match.id)`.

### 6. Composition — brancher la navigation

- `mason make` (ou à la main) `packages/composition/scores_router` :
  `AppScoresRouting implements ScoresRouting` qui fait
  `Navigator.push(MaterialPageRoute(builder: (_) => MatchDetailPage(matchId: id)))`,
  + `bindRouterProviders()` qui override `scoresRoutingProvider`.
- `composition_root` : ajouter la dep `scores_router` et `...bindRouterProviders()`
  dans `scoresAppOverrides()`.

### 7. Lancer

```bash
flutter pub get
melos run generate        # ou build_runner par package modifié
flutter analyze
cd apps/foot_scores && flutter run
```

Tap sur une ligne → la page détail s'ouvre. ✅

---

## Points pédagogiques à souligner

- **L'interface ne bouge pas** : ajouter `watchMatch` au `ScoresRepository` se
  répercute sur l'impl data sans toucher l'UI.
- **Le port de routing** découple la feature liste de la feature détail (pas de
  dépendance `matchs → match_detail` ; c'est la composition qui les relie).
- **La composition** est le seul endroit qui connaît toutes les features.
- **Riverpod codegen** : un provider par fichier `*.dart` annoté `@riverpod`.
