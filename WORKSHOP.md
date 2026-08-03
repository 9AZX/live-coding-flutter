# Workshop Flutter : reconstruire la page « Détail d'un match »

Cette app de scores foot marche. Tape sur un match : rien ne se passe. On a retiré la
page de détail, tu la reconstruis couche par couche.

Suis les étapes dans l'ordre et vérifie que ça compile à chaque fois.

---

## Ce que tu construis

Taper une ligne de match ouvre une page **Détail** avec l'en-tête (les deux équipes, le
score ou « VS ») et la liste des faits de jeu.

Puis un bonus d'archi : afficher les **cotes** sur cet écran pour le marché français,
sans que ton écran sache qu'un marché existe.

Tu vas toucher toutes les couches au passage : domaine, data, présentation, navigation,
injection de dépendances, composition par marché.

---

## L'architecture

```
shared_domain/scores/domain   →  entités (Match…), contrats, behaviors
features/scores/
  matchs/data                 →  l'implémentation réelle (API TheSportsDB)
  matchs/presentation         →  widgets partagés, thème, écran Matchs
  live / favorites            →  les autres onglets
  odds                        →  les cotes 1 N 2, exposées sur certains marchés
  match_detail/presentation   →  À CRÉER (l'écran de détail)
composition/
  app_providers               →  agrège tous les bindProviders()
  app_router                  →  AppRouter (AutoRoute) + impls des ports de routing
  regulations/fr_providers    →  ce que le marché FR expose
  regulations/pl_providers    →  ce que le marché PL expose
utilities/
  network/shared/domain       →  le contrat HttpClient. Personne ne connaît Dio.
  network/dio/data            →  l'implémentation Dio, branchée par la composition
  types/result/domain         →  Result<T, E> : un appel réussit ou échoue, il ne throw pas
```

**La règle d'or** : une feature n'importe jamais une autre feature. Ce qui est partagé
passe par `shared_domain` ou par injection.

Deux marchés tournent sur le même code. La France vend des cotes, la Pologne non, et
`matchs/presentation` est identique dans les deux cas. Étape 7.

---

## Avant de commencer

Les commandes que tu vas répéter :

```bash
# (re)générer le code après avoir touché un fichier .br.dart (@riverpod / @freezed / …)
mise run generate                  # tout le workspace
cd <le_package_modifié> && dart run build_runner build   # ou juste un package

# ta boucle de retour. Pas besoin de lancer l'app.
mise run analyze && mise run test

# lancer l'app (marché FR par défaut)
cd apps/foot_scores && flutter run -d macos

# lancer le marché polonais (mêmes features, sans les cotes)
cd apps/foot_scores && flutter run -d macos --dart-define=REGULATION=pl
```

Des commentaires `// WORKSHOP` dans le code marquent chaque endroit où écrire.
Pour les lister : `grep -rn "WORKSHOP" packages`.

Garde **`CONVENTIONS.md`** ouvert à côté. C'est la version une page des règles d'archi,
et la réponse à « où est-ce que ça va, ça ? » y est.

---

## Le périmètre du jour

Trois heures, donc on coupe tout ce qui n'est pas de l'architecture.

| Hors périmètre | Pourquoi |
|---|---|
| **Le look de l'écran** | Une `Column` de `Text` fait le job. On ne fait pas d'UI aujourd'hui. |
| **`LineupEntryDto`** (compos) | Un seul DTO suffit à comprendre ce qu'est un DTO. Bonus si tu as le temps. |
| **Les tests** (étape 2.5) | À lire. À écrire si ton trio est en avance. |

À chaque étape, la question est : dans quelle couche va la chose que j'écris, et pourquoi.
Le code, l'IA le tape en trente secondes.

---

## Étape 1 : le contrat

`shared_domain/scores/domain`. Tu déclares *quoi* tu veux, sans dire *comment*.

**`lib/src/repositories/scores_repository.dart`** : ajoute une méthode à l'interface,
à la place du `// WORKSHOP`.

```dart
Future<Result<Match, ScoresError>> fetchMatch(String id);
```

Un `Result`, pas une exception. L'appel réussit (`Success`) ou échoue (`Failure`), et
l'échec apparaît dans la signature, donc le compilateur t'oblige à le traiter. Les
exceptions couvrent les bugs de programmation, comme `UnregisteredProviderException`.
Regarde `fetchMatches` juste au-dessus.

**`lib/src/entities/errors/scores_error.br.dart`** : le match demandé peut ne pas
exister. Ajoute un cas à l'union scellée.

```dart
@freezed
sealed class ScoresError with _$ScoresError {
  const factory ScoresError.notFound() = NotFoundScoresError;
  const factory ScoresError.unavailable() = UnavailableScoresError;
}
```

**`lib/src/behaviors/fetch_match.dart`** : la présentation n'appelle jamais un
repository, elle appelle un *behavior*. Copie la forme de `fetch_matches.dart` : une
classe, un `execute`.

**`lib/src/providers.br.dart`** : expose le behavior et le provider d'état, là où se
trouve le `// WORKSHOP`.

```dart
@riverpod
FetchMatch fetchMatch(Ref ref) => FetchMatch(repository: ref.watch(scoresRepositoryProvider));

@riverpod
Future<Match> match(Ref ref, String id) async =>
    (await ref.watch(fetchMatchProvider).execute(id)).getOrThrow();
```

`getOrThrow()` reporte l'échec du `Result` dans l'`AsyncValue`. Ton écran lira un
`AsyncError` sans jamais manipuler de `Result`.

Les entités `MatchEvent`, `Lineup`, `Player` et les champs `Match.events` /
`Match.lineups` existent déjà. Rien à créer côté entités.

**Vérifie**

```bash
cd packages/shared_domain/scores/domain && dart run build_runner build
```

Un `mise run analyze` global va maintenant sortir une erreur : l'implémentation ne
respecte plus le contrat. Attendu, tu la corriges à l'étape 2.

---

## Étape 2 : la donnée

`features/scores/matchs/data`. Tu vas chercher les vraies données et tu les transformes.

### 2.1 Les trois endpoints

Il n'y a pas de classe « client API » à remplir. La source de données reçoit un
`HttpClient` injecté (contrat de `network_domain`) et déclare ses chemins elle-même.
Dans `the_sports_db_scores_data_source.dart`, à côté de `_eventsDayPath` :

```dart
static const String _lineupPath = '/lookuplineup.php';
static const String _lookupEventPath = '/lookupevent.php';
static const String _timelinePath = '/lookuptimeline.php';
```

La source ne connaît ni Dio ni l'URL du backend. `HttpClient` est un contrat,
la composition branche l'implémentation Dio (`network_dio_data`), et la `baseUrl` arrive
par injection. Changer de lib HTTP ne toucherait aucune feature.

### 2.2 À toi : ton premier DTO

Un DTO, c'est une classe typée qui représente le JSON de l'API, au lieu de manipuler des
`Map` à l'aveugle.

Le modèle est déjà écrit dans `lib/src/dtos/event_dto.br.dart` : freezed +
json_serializable, chaque champ JSON mappé avec `@JsonKey(name: '...')`.

Crée `lib/src/dtos/timeline_entry_dto.br.dart` à partir de ce vrai JSON de l'API :

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

> **Bonus si ton trio est en avance** : fais pareil pour `LineupEntryDto` (`strHome`,
> `strSubstitute`, `strPlayer`, `intSquadNumber`) et l'onglet Compo se remplit. Sinon
> tiens-t'en à la timeline. L'API ne renvoie pas les compos pour tous les matchs de
> toute façon.

Il te faut aussi l'**enveloppe** de la réponse, parce que l'API emballe sa liste sous une
clé. Regarde `events_response_dto.br.dart`, puis fais la même chose pour la timeline
(clé `timeline`) :

```dart
@freezed
abstract class TimelineResponseDto with _$TimelineResponseDto {
  const factory TimelineResponseDto({@JsonKey(name: 'timeline') List<TimelineEntryDto>? timeline}) =
      _TimelineResponseDto;

  factory TimelineResponseDto.fromJson(Map<String, dynamic> json) => _$TimelineResponseDtoFromJson(json);
}
```

Pourquoi ne pas lire `json['timeline']` à la main ? Une API qui change de forme doit
échouer au parsing. Si tu piochais la clé toi-même, tu récupérerais une liste vide et tu
afficherais « aucun évènement » sur une réponse cassée. `/lookupevent.php` renvoie la clé
`events`, donc `EventsResponseDto` te sert telle quelle.

### 2.3 Le mapper (DTO → entité)

**`lib/src/mappers/event_dto_mapper.dart`**. Les mappers sont des extensions sur le DTO.
La signature existante :

```dart
extension EventDtoMapper on EventDto {
  Match toEntity({String country = '', List<MatchEvent> events, List<Lineup> lineups}) { … }
}
```

Le data source passe `country`, qu'il tient du catalogue de ligues injecté par le
marché. Le mapper ne devine rien.

Ajoute un mapper pour ton `TimelineEntryDto` : un but c'est
`strTimeline == 'Goal'`, un carton `'Card'`, et l'équipe à domicile `strHome == 'Yes'`.

Un remplacement (`strTimeline == 'subst'`) n'est pas un fait de jeu qu'on affiche. Rends
`null` et laisse le data source filtrer. Un mapper traduit, il ne décide pas de
l'affichage.

### 2.4 Implémenter le contrat

**`lib/src/data_sources/the_sports_db_scores_data_source.dart`**. Copie la forme de
`_leagueMatches` : un `try`, un `if (response.data case final data?)`, et un `Failure`
sur chaque sortie sans données.

```dart
@override
Future<Result<Match, ScoresError>> fetchMatch(String id) async {
  // 3 appels : _lookupEventPath, _timelinePath, _lineupPath (queryParameters: {'id': id})
  //   → l'event absent  ⇒ Failure(ScoresError.notFound())
  //   → un échec réseau ⇒ Failure(ScoresError.unavailable())
  //   → sinon dto.toEntity(country: _countryByLeague[leagueId] ?? '', events: …, lineups: …)
}
```

Les trois appels sont indépendants. Lance-les avec `Future.wait` : le détail s'ouvre en
un aller-retour au lieu de trois.

`_countryByLeague` et `_leagueIds` sont des champs injectés dans le constructeur, donc la
source ne connaît pas les compétitions du marché. `providers_internal.br.dart` te montre
d'où ils viennent. Pareil pour `clock`, qui remplace un `DateTime.now()` en dur et rend
la source testable.

### 2.5 Bonus : le test de la source

Ouvre `the_sports_db_scores_data_source_test.dart` et lis-le, même si tu n'écris rien.
C'est la convention de test de la prod : le `HttpClient` y est un mock mockito déclaré
dans `matchs_data_mocks.dart`, donc aucun test ne touche le réseau, et les phrases
`given/when/then` décrivent un comportement utilisateur.

Si ton trio est en avance, ajoute ces trois cas :

- le détail d'un match affiche ses buts ;
- un match inconnu remonte `ScoresError.notFound()` ;
- un service injoignable remonte `ScoresError.unavailable()`.

**Vérifie**

```bash
cd packages/features/scores/matchs/data && dart run build_runner build && flutter test
mise run analyze   # l'erreur de l'étape 1 disparaît
```

---

## Étape 3 : le clic

`features/scores/matchs/presentation`. Rien à écrire ici, tout est en place. Lis comment
`matchs` demande l'ouverture du détail sans connaître l'écran de détail. Ça passe par un
**port**, une interface de navigation que la composition implémente à l'étape 6.

1. Le port, dans `lib/src/routing/matchs_routing.dart` :
   ```dart
   abstract interface class MatchsRouting {
     void onMatchDetailRequested(String matchId);
   }
   ```
   Les méthodes portent le nom de l'évènement (`on…Requested`), jamais un impératif
   (`navigateTo…`). La destination appartient au router.
2. Le contrat dans `lib/src/providers_di.br.dart`, qui `throw
   UnregisteredProviderException` jusqu'à ce que la composition le fournisse.
3. `lib/src/widgets/match_row.dart` émet déjà l'intention :
   ```dart
   onTap: () => ref.read(matchsRoutingProvider).onMatchDetailRequested(match.id),
   ```
4. Côté composition, `app_router/lib/src/routing/app_matchs_routing.dart` implémente le
   port avec un corps vide (`// WORKSHOP`). D'où le symptôme. Tu le remplis à l'étape 6.

La feature émet une intention, la composition choisit la destination. `matchs` peut donc
ignorer l'existence du détail.

---

## Étape 4 : créer la feature avec Mason

Mason scaffolde un package prêt à l'emploi.

```bash
# récupérer les bricks déclarées dans mason.yaml (une seule fois)
mason get

# générer la feature au bon endroit
mason make presentation \
  -o packages/features/scores/match_detail/presentation \
  --name match_detail_presentation \
  --classname match_detail \
  --domainPackage scores_domain
```

Sans les flags, Mason te pose les questions : nom du package
(`match_detail_presentation`), nom de la feature (`match_detail`), package domain
(`scores_domain`).

Tu obtiens la structure conforme au repo de prod : `pubspec.yaml`, `build.yaml`,
`package_name.dart`, le quadruplet `providers_di.br` / `providers_internal.br` /
`providers.dart`, le port `match_detail_routing.dart`, le router
`match_detail_router.br.dart` avec son enum `MatchDetailRoutePath` et son `@RoutePage`,
un thème theme_tailor, et un test placeholder.

**Vérifie**

```bash
mise run bs
cd packages/features/scores/match_detail/presentation && dart run build_runner build
mise run analyze
```

---

## Étape 5 : la page

`features/scores/match_detail/presentation`. Ta feature possède ses propres widgets, elle
ne pioche pas dans `matchs`.

> **On ne fait pas d'UI aujourd'hui.** Une `Column` de `Text` suffit : le score, la liste
> des buts. Pas d'onglets si tu manques de temps, pas de mise en page. La question du
> jour porte sur l'endroit où vivent les choses.

1. `lib/src/match_detail_screen.dart`, un `ConsumerWidget` qui prend le `matchId` :
   ```dart
   final match = ref.watch(matchProvider(matchId));
   return match.when(
     loading: ...,           // un loader
     error: ...,             // une copie utilisateur de ton l10n, jamais '$error'
     data: (m) => ...,       // le score + la liste de m.events
   );
   ```
2. Les libellés vont dans `lib/src/l10n/match_detail_strings.dart`, une `const` par
   libellé. Pas de chaîne en dur dans le widget.
3. Dans `lib/src/routing/match_detail_router.br.dart`, passe le `matchId` en paramètre de
   route et déclare le chemin absolu :
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
4. Les couleurs et les styles viennent de **ton** thème
   (`ref.watch(matchDetailThemeProvider.select(…))`), alimenté par défaut depuis la
   palette DSM dans `providers_internal.br.dart`. Aucune couleur brute, aucun import de
   `tactics_providers`.

> **Bonus** : `lib/src/widgets/match_event_tile.dart` pour une ligne de timeline,
> `lineup_section.dart` pour une composition, puis les onglets Résumé / Compo.

**Vérifie** : `dart run build_runner build` puis `mise run analyze`. Le package doit
compiler seul.

---

## Étape 6 : brancher la navigation

`composition/`. Tu connectes le port de l'étape 3 au vrai écran de l'étape 5. La
composition est le seul endroit qui connaît les deux features à la fois.

Dans **`packages/composition/app_router`** :

1. `pubspec.yaml` : ajoute la dépendance `match_detail_presentation:`.
2. `lib/src/app_router.br.dart` : déclare la route à la place du `// WORKSHOP` :
   ```dart
   AutoRoute(page: MatchDetailRoute.page, path: MatchDetailRoutePath.matchDetail.path),
   ```
3. `lib/src/routing/app_matchs_routing.dart` : remplis le corps vide :
   ```dart
   @override
   void onMatchDetailRequested(String matchId) => _router.push(MatchDetailRoute(matchId: matchId));
   ```
4. Relance `dart run build_runner build` dans `app_router`, pour qu'AutoRoute régénère
   `app_router.br.gr.dart` avec la nouvelle route.

Dans **`packages/composition/app_providers`** :

5. `pubspec.yaml` : ajoute la dépendance `match_detail_presentation:`.
6. `lib/src/app_providers.dart` : fournis le port de la nouvelle feature :
   ```dart
   ...match_detail_presentation.bindProviders(
     routing: (ref) => AppMatchDetailRouting(router: ref.watch(appRouterProvider)),
   ),
   ```
   Écris `AppMatchDetailRouting` dans `app_router`, sur la même forme que
   `AppMatchsRouting`, pour gérer le retour.

---

## Étape 7 : à toi. Les cotes, en France pas en Pologne

`regulations/`. Tu ajoutes les cotes sur ton écran détail, pour le marché français.
Ton écran ne doit pas savoir qu'un marché existe, ni que la feature `odds` existe.

C'est l'inversion de dépendance en pratique : ton écran déclare « quelqu'un peut me
donner un widget de cotes », et chaque marché répond oui ou non.

Le modèle est déjà dans `matchs/presentation` (`matchOddsFactoryProvider`). Va le lire
avant de commencer.

### 7.1 Déclarer le contrat, dans ta feature

`match_detail/presentation/lib/src/providers_di.br.dart`. Un contrat nullable, qui
`throw` quand même :

```dart
@riverpod
WidgetFactory<Match>? matchDetailOddsFactory(Ref _) {
  throw UnregisteredProviderException(matchDetailOddsFactoryProvider);
}
```

Pourquoi `throw` sur un type nullable ? Pour forcer chaque marché à répondre. Un marché
qu'on oublie de câbler plante au premier build, au lieu d'afficher un écran incomplet en
silence.

Ajoute `widget_factory_presentation:` et `scores_domain:` au `pubspec.yaml`.

### 7.2 Ouvrir le contrat à la composition

`match_detail/presentation/lib/src/providers.dart` :

```dart
List<Override> bindRegulationProviders({required WidgetFactory<Match>? oddsFactory}) => [
  matchDetailOddsFactoryProvider.overrideWithValue(oddsFactory),
];
```

### 7.3 L'utiliser dans l'écran

Dans `match_detail_screen.dart`, là où tu veux les cotes :

```dart
?ref.watch(matchDetailOddsFactoryProvider)?.create(match),
```

Le `?` devant l'élément est le *null-aware element* de Dart 3. Pas de cotes, pas de ligne
dans la `Column`, et aucun `if` à écrire.

### 7.4 Répondre, marché par marché

`composition/regulations/fr_providers`, la France vend des paris :

```dart
// pubspec.yaml : ajoute match_detail_presentation:
...match_detail_presentation.bindRegulationProviders(oddsFactory: const OddsBadgeWidgetFactory()),
```

`composition/regulations/pl_providers`, pas de cotes ici :

```dart
// pubspec.yaml : ajoute match_detail_presentation: (mais SURTOUT PAS odds_presentation)
...match_detail_presentation.bindRegulationProviders(oddsFactory: null),
```

**Vérifie les deux marchés**

```bash
mise run bs && mise run generate && mise run analyze
cd apps/foot_scores
flutter run -d macos                                # FR : les cotes s'affichent
flutter run -d macos --dart-define=REGULATION=pl    # PL : même écran, sans cotes
```

Entre les deux marchés, ton écran n'a pas changé d'une ligne. Et comme `pl_providers` ne
déclare pas `odds_presentation`, la feature n'entre pas dans le binaire polonais.

---

## Étape 8 : lancer

```bash
mise run bs
mise run generate
mise run format
mise run analyze           # objectif : "No issues found!"
mise run test
cd apps/foot_scores && flutter run -d macos
```

Tape un match, l'écran Détail s'ouvre. Bravo.

---

## Ce qu'il faut retenir

1. **On code de l'intérieur vers l'extérieur.** Le contrat du domaine d'abord, puis la
   data, puis l'UI, puis le câblage.
2. **Une feature n'en importe jamais une autre.** L'écran Matchs ne connaît pas l'écran
   Détail : il émet une intention via le port `MatchsRouting`, et la composition choisit
   la destination. Corollaire : un contrat de `providers_di.br.dart` `throw` tant que
   personne ne l'a fourni, donc l'erreur arrive tout de suite et jamais sous la forme
   d'un `null` silencieux.
3. **Inversion de dépendance.** Une feature déclare un contrat et ignore qui le remplit.
   Un même écran affiche donc les cotes en France et pas en Pologne, sans une seule
   condition `if (marché == …)` dans la feature. Deux formes : une valeur injectée (le
   catalogue de ligues) ou une feature entière injectée (`WidgetFactory<T>?`, où `null`
   veut dire absente).
4. **Un DTO isole le JSON de l'API.** Si l'API change, tu corriges un seul endroit.
   Modélise aussi l'enveloppe de la réponse, pour qu'une forme inattendue échoue au lieu
   de passer pour un résultat vide.
5. **Un échec est une valeur.** `Result<T, E>` met l'erreur dans la signature, et les
   couches basses traduisent (`DioException` → `NetworkError` → `ScoresError`) pour
   qu'aucune feature ne dépende de la lib HTTP. Les exceptions couvrent les erreurs de
   programmation.
6. **`build_runner` régénère le code annoté** (`@riverpod`, `@freezed`,
   `@TailorMixinComponent`, `@RoutePage`). Relance-le dès qu'`analyze` parle de `_$...`,
   `.g.dart`, `.freezed.dart`, `.tailor.dart` ou `.gr.dart`. Seuls les fichiers
   `.br.dart` passent aux générateurs.

---

## Si ça coince

**`The method '…' isn't defined`, `Missing concrete implementation`**
Tu as changé une interface sans changer l'implémentation, ou il faut relancer
`build_runner`.

**`Target of URI doesn't exist: '….g.dart'`, `.gr.dart`, `.tailor.dart`**
Lance `build_runner` dans ce package. Vérifie aussi que le fichier source finit en
`.br.dart`, sinon les générateurs l'ignorent.

**`UnregisteredProviderException`**
Un contrat DI n'a pas été fourni. Ajoute l'appel `bindProviders(...)` correspondant dans
`app_providers`.

**L'écran est vide, ou une erreur réseau**
Regarde la console. `[network_dio_data]` trace les appels HTTP en échec,
`[matchs_data]` les réponses inattendues (JSON d'une forme imprévue, bug de mapping).

**Perdu ?**
`grep -rn "WORKSHOP" packages` retrouve tous les points à compléter.
