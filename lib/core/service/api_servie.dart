import 'package:dio/dio.dart';

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

    // Add interceptors
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Add Authorization token if available
          if (_token != null) {
            options.headers['Authorization'] = 'Bearer $_token';
          }
          print('REQUEST[${options.method}] => PATH: ${options.path}');
          print('Headers: ${options.headers}');
          print('QueryParams: ${options.queryParameters}');
          print('Body: ${options.data}');
          handler.next(options);
        },
        onResponse: (response, handler) {
          print(
            'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
          );
          print('Response data: ${response.data}');
          handler.next(response);
        },
        onError: (DioError e, handler) {
          print(
            'ERROR[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}',
          );
          print('Error data: ${e.response?.data}');
          handler.next(e);
        },
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
