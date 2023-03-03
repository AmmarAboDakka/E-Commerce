import 'package:dio/dio.dart';

abstract class ApiCounsumer {
  
  Future<Response> get(String endpoint,

     {Map<String, dynamic>? query});

  Future<Response> post(String endpoint,

      {Map<String, dynamic>? query, Map<String, dynamic>? body});

  Future<Response> put(String endpoint,

      {Map<String, dynamic>? query, Map<String, dynamic>? body});
}
