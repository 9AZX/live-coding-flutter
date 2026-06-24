import 'dart:developer' as developer;

import 'package:matchs_data/src/api/the_sports_db_client.dart';
import 'package:matchs_data/src/api/the_sports_db_config.dart';
import 'package:matchs_data/src/api/the_sports_db_mapper.dart';
import 'package:matchs_data/src/dtos/event_dto.br.dart';
import 'package:scores_domain/scores_domain.dart';

/// Source de données réelle TheSportsDB. Implémente la même interface que les
/// autres sources : seule la couche data change.
///
/// WORKSHOP : `watchMatch(id)` (détail) à reconstruire — récupérer l'event, sa
/// timeline et ses compositions, puis mapper vers un `Match` enrichi.
class TheSportsDbScoresDataSource implements ScoresRepository {
  TheSportsDbScoresDataSource({TheSportsDbClient? client, TheSportsDbMapper mapper = const TheSportsDbMapper()})
    : _client = client ?? TheSportsDbClient(),
      _mapper = mapper;

  final TheSportsDbClient _client;
  final TheSportsDbMapper _mapper;

  @override
  Stream<List<Match>> watchMatches(MatchDay day) => Stream.fromFuture(_fetchFeed(day));

  Future<List<Match>> _fetchFeed(MatchDay day) async {
    final date = _dateFor(day);
    final matches = <Match>[];

    for (final leagueId in TheSportsDbConfig.leagueIds) {
      final events = (await _client.eventsDay(date, leagueId)).map(EventDto.fromJson).toList()
        ..sort((a, b) => '${a.timestamp}'.compareTo('${b.timestamp}'));

      matches.addAll(events.map(_mapper.toMatch));
    }

    developer.log(
      'feed: ${matches.length} matchs du $date (ligues ${TheSportsDbConfig.leagueIds})',
      name: 'thesportsdb',
    );

    return matches;
  }

  // ponytail: date via l'horloge appareil (en prod : source NTP type Kronos).
  String _dateFor(MatchDay day) {
    final date = DateTime.now().add(Duration(days: day.offset));

    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}
