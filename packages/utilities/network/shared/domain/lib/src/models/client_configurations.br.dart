import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_configurations.br.freezed.dart';

/// Paramètre de famille de `httpClientProvider` : chaque source de données demande
/// un client configuré pour *son* backend, sans jamais construire ce client.
@freezed
sealed class HttpClientConfiguration with _$HttpClientConfiguration {
  const factory HttpClientConfiguration({
    required String baseUrl,
    @Default(Duration(seconds: 15)) Duration connectTimeout,
    @Default(Duration(seconds: 15)) Duration receiveTimeout,
  }) = _HttpClientConfiguration;
}
