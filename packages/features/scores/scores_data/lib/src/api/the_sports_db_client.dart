import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:scores_data/src/api/the_sports_db_config.dart';

/// Accès bas niveau à TheSportsDB : renvoie la liste sous la clé demandée
/// (`events`, `timeline`, `lineup`), sans interprétation.
class TheSportsDbClient {
  TheSportsDbClient({Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: '${TheSportsDbConfig.baseUrl}/${TheSportsDbConfig.apiKey}',
              connectTimeout: const Duration(seconds: 15),
              receiveTimeout: const Duration(seconds: 15),
            ),
          );

  final Dio _dio;

  /// Tous les matchs d'une ligue à une date donnée (`date` = `YYYY-MM-DD`).
  Future<List<Map<String, dynamic>>> eventsDay(String date, int leagueId) =>
      _list('/eventsday.php', {'d': date, 'l': leagueId}, key: 'events');

  // WORKSHOP : endpoints du détail à reconstruire — lookupevent.php (event),
  // lookuptimeline.php (timeline), lookuplineup.php (compositions).

  Future<List<Map<String, dynamic>>> _list(
    String path,
    Map<String, dynamic> query, {
    required String key,
  }) async {
    try {
      final res = await _dio.get<Map<String, dynamic>>(path, queryParameters: query);
      final data = res.data?[key];
      final list = data is List ? data.cast<Map<String, dynamic>>() : const <Map<String, dynamic>>[];

      developer.log('$path $query → ${res.statusCode} $key=${list.length}', name: 'thesportsdb');

      return list;
    } on DioException catch (e, s) {
      developer.log(
        'Échec $path: ${e.message} (HTTP ${e.response?.statusCode})',
        name: 'thesportsdb',
        error: e,
        stackTrace: s,
      );
      rethrow;
    }
  }
}
