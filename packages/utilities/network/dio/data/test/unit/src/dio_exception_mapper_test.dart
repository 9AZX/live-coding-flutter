import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_dio_data/src/dio_exception_mapper.dart';
import 'package:network_domain/network_domain.dart';
import 'package:shouldly/shouldly.dart';

final _options = RequestOptions(path: '/eventsday.php', connectTimeout: const Duration(seconds: 15));

DioException _exception(DioExceptionType type, {Object? error, int? statusCode}) => DioException(
  requestOptions: _options,
  type: type,
  error: error,
  response: statusCode == null ? null : Response<dynamic>(requestOptions: _options, statusCode: statusCode),
);

void main() {
  group('Traduction des échecs de la lib HTTP vers le domaine', () {
    test('un serveur qui ne répond pas à temps devient une erreur de délai dépassé', () {
      final error = mapDioException(_exception(DioExceptionType.receiveTimeout));

      error.should.beOfType<NetworkTimeoutError>();
      (error as NetworkTimeoutError).timeout.should.be(const Duration(seconds: 15));
    });

    test('un appareil sans connexion devient une erreur d’absence d’internet', () {
      final error = mapDioException(
        _exception(DioExceptionType.connectionError, error: const SocketException('no route')),
      );

      error.should.beOfType<NetworkNoInternetError>();
    });

    test('une erreur 500 du backend devient une erreur serveur', () {
      final error = mapDioException(_exception(DioExceptionType.badResponse, statusCode: 503));

      error.should.beOfType<NetworkServerError>();
      (error as NetworkServerError).statusCode.should.be(503);
    });

    test('un quota dépassé devient une erreur client', () {
      final error = mapDioException(_exception(DioExceptionType.badResponse, statusCode: 429));

      error.should.beOfType<NetworkClientError>();
      (error as NetworkClientError).statusCode.should.be(429);
    });

    test('un échec non identifié reste une erreur réseau inconnue', () {
      final error = mapDioException(_exception(DioExceptionType.unknown));

      error.should.beOfType<NetworkUnknownError>();
    });
  });
}
