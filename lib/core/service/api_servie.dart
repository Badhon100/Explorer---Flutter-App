import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  final String baseUrl;
  String? _token;
  late Dio _dio;

  ApiService({required this.baseUrl, String? token}) {
    _token = token;
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Add custom auth interceptor
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (_token != null) {
            options.headers['Authorization'] = 'Bearer $_token';
          }
          handler.next(options);
        },
      ),
    );

    // Add PrettyDioLogger for colorful logs
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  /// Update or set token at runtime
  void setToken(String token) {
    _token = token;
  }

  Future<dynamic> get(
    String endpoint, {
    Map<String, dynamic>? queryParams,
  }) async {
    final response = await _dio.get(endpoint, queryParameters: queryParams);
    return response.data;
  }

  Future<dynamic> post(
    String endpoint, {
    dynamic body,
    Map<String, dynamic>? queryParams,
  }) async {
    final response = await _dio.post(
      endpoint,
      data: body,
      queryParameters: queryParams,
    );
    return response.data;
  }

  Future<dynamic> put(
    String endpoint, {
    dynamic body,
    Map<String, dynamic>? queryParams,
  }) async {
    final response = await _dio.put(
      endpoint,
      data: body,
      queryParameters: queryParams,
    );
    return response.data;
  }

  Future<dynamic> delete(
    String endpoint, {
    dynamic body,
    Map<String, dynamic>? queryParams,
  }) async {
    final response = await _dio.delete(
      endpoint,
      data: body,
      queryParameters: queryParams,
    );
    return response.data;
  }
}
