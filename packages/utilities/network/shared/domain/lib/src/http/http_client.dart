import 'package:network_domain/network_domain.dart';

/// Contrat HTTP côté domaine : aucune source de données ne connaît Dio.
/// L'implémentation lève un [NetworkError], jamais l'exception de la lib sous-jacente.
abstract interface class HttpClient {
  Future<NetworkResponse<T>> get<T>(String path, {Map<String, dynamic>? queryParameters});
}
