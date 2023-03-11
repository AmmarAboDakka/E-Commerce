import 'package:dio/dio.dart';
import 'package:e_commerce/app/injector.dart';
import 'package:e_commerce/core/api/api_consumer.dart';
import 'package:e_commerce/core/api/app_interceptor.dart';
import 'package:e_commerce/core/api/status_code.dart';
import 'package:flutter/foundation.dart';

import '../error/exceptions.dart';

class DioConsumer extends ApiCounsumer {
  
  final Dio dio;

  DioConsumer({required this.dio}) {
    //From Dio Package
    dio.interceptors.add(getIt<AppInterceptor>());
    //for test in debug mode
    if (kDebugMode) dio.interceptors.add(getIt<LogInterceptor>());
  }

  @override
  Future<Response> get(String endpoint, {Map<String, dynamic>? query}) async {
    try {
      final response = await dio.get(endpoint);

      return response;
    } on DioError catch (error) {
      return _handleDioError(error);
    }
  }

 @override
  Future<Response> post(String endPoint,
      {Map<String, dynamic>? query, Map<String, dynamic>? body}) async {
    try {
      final response = await dio.post(
        endPoint,
        queryParameters: query,
        data: body,
      );
      return response;
    } on DioError catch (error) {
      return _handleDioError(error);
    }
  }


  @override
  Future<Response> put(String endpoint,
      {Map<String, dynamic>? query, Map<String, dynamic>? body}) async {
    try {
      final response = await dio.put(endpoint);
      return response;
    } on DioError catch (error) {
      return _handleDioError(error);
    }
  }

  dynamic _handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw const FetchDataException();

      case DioErrorType.badResponse:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.conflict:
            throw const ConflictException();
          case StatusCode.internetServerError:
            throw const InternalServerErrorException();
        }
        break;
      case DioErrorType.cancel:
        throw const CancelRequestException();
      case DioErrorType.unknown:
        throw const UnknownException();
      case DioErrorType.badCertificate:
        throw const BadCertificateException();
      case DioErrorType.connectionError:
        throw const NoInternetConnectionException();
    }
  }
}
