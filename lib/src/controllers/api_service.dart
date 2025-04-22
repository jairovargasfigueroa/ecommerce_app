import 'dart:convert';

import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService._internal()
      : _dio = Dio(BaseOptions(
            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 30),
            baseUrl: 'http://192.168.0.23:8000')) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Agrega headers comunes
        options.headers.addAll({
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // Aquí puedes agregar token si estás autenticado
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ1MzA5MzAyLCJpYXQiOjE3NDUyMjI5MDIsImp0aSI6IjI4ZjU3NGNiODE3ZDQ5NTFhMDE4YWU5YjhkMGNhZTU2IiwidXNlcl9pZCI6MiwidXNlcm5hbWUiOiJjbGllbnRlMSIsInJvbCI6ImFkbWluIn0.EDOCbUe3Qgz7nnanxQJa3pqzYGdebfnxl2XqAa4FPJw'
        });
        return handler.next(options);
      },
      onResponse: (response, handler) {
        // Puedes hacer log de respuestas si deseas
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        print('ERROR: ${e.message}');
        // Aquí puedes mostrar errores personalizados o logs
        return handler.next(e);
      },
    ));
  }

  static final ApiService instance = ApiService._internal();

  Future<T> requestApi<T>({
    required String url,
    String method = 'GET',
    Map<String, dynamic>? queryParams,
    dynamic body,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.request(
        url,
        data: body,
        queryParameters: queryParams,
        options: Options(
          method: method,
          headers: headers,
        ),
      );
      return jsonDecode((jsonEncode((response.data))))['results'] as T;
    } catch (e) {
      rethrow;
    }
  }
}
