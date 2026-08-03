import 'package:dio/dio.dart';
import 'package:network_dio_data/src/dio_http_client.dart';
import 'package:network_domain/network_domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

/// Branche l'implémentation Dio sur le contrat `httpClientProvider`. C'est le seul
/// override du package : remplacer la lib HTTP ne touche aucune feature.
List<Override> bindProviders() => [
  httpClientProvider.overrideWith(
    (Ref ref, HttpClientConfiguration configuration) => DioHttpClient(dio: Dio(), configuration: configuration),
  ),
];
