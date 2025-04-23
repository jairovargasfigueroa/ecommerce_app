import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/src/core/shared_preferences_utils.dart';

class ApiService {
  final Dio _dio;

  ApiService._internal()
      : _dio = Dio(BaseOptions(
            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 30),
            baseUrl: 'http://192.168.0.12:8000')) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Agrega headers comunes
        options.headers.addAll({
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // Aquí puedes agregar token si estás autenticado
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
    final token = await SharedPreferencesUtils.getItem('token');
    // print('TOE $headers');
    var finalHeaders = headers ?? Map<String, dynamic>();
    if (token != null) {
      finalHeaders.putIfAbsent(
        'Authorization',
        () => 'Bearer $token',
      );
    }
    try {
      final response = await _dio.request(
        url,
        data: body,
        queryParameters: queryParams,
        options: Options(
          method: method,
          headers: finalHeaders,
        ),
      );
      return jsonDecode((jsonEncode((response.data)))) as T;
    } catch (e) {
      rethrow;
    }
  }
}
