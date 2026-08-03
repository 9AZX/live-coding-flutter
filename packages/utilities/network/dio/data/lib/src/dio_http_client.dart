import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:network_dio_data/src/dio_exception_mapper.dart';
import 'package:network_dio_data/src/package_name.dart';
import 'package:network_domain/network_domain.dart';

class DioHttpClient implements HttpClient {
  final Dio _dio;
  final DioExceptionMapper _exceptionMapper;

  DioHttpClient({required Dio dio, required HttpClientConfiguration configuration, DioExceptionMapper? exceptionMapper})
    : _exceptionMapper = exceptionMapper ?? mapDioException,
      _dio = Dio(
        dio.options.copyWith(
          baseUrl: configuration.baseUrl,
          connectTimeout: configuration.connectTimeout,
          receiveTimeout: configuration.receiveTimeout,
        ),
      )..httpClientAdapter = dio.httpClientAdapter;

  @override
  Future<NetworkResponse<T>> get<T>(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get<T>(path, queryParameters: queryParameters);

      return response.toNetworkResponse();
    } on DioException catch (exception, stackTrace) {
      final error = _exceptionMapper(exception);

      // Seul endroit qui journalise un échec réseau : les sources de données au-dessus
      // reçoivent un NetworkError déjà tracé, elles n'ont plus à le logger.
      developer.log('$path ${queryParameters ?? ''} → $error', name: packageName, error: error, stackTrace: stackTrace);

      throw error;
    }
  }
}

extension on Response<dynamic> {
  NetworkResponse<T> toNetworkResponse<T>() =>
      NetworkResponse<T>(data: data as T?, statusCode: statusCode, statusMessage: statusMessage);
}
