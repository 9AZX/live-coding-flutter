import 'package:exceptions/exceptions.dart';
import 'package:network_domain/network_domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers_di.br.g.dart';

/// Contrat entrant : une implémentation concrète (`network_dio_data`) est branchée
/// par la composition. Les features consomment ce provider, jamais Dio.
@riverpod
HttpClient httpClient(Ref ref, HttpClientConfiguration configuration) {
  throw UnregisteredProviderException(httpClientProvider);
}
