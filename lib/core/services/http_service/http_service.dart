import 'package:dio/dio.dart';

sealed class AppResponse<T> {}

class AppSuccessResponse<T> extends AppResponse<T> {
  AppSuccessResponse(this.data);

  final T? data;
}

class AppFailureResponse<T> extends AppResponse<T> {
  AppFailureResponse(this.message, this.statusCode);

  final String message;
  final int statusCode;
}

enum HttpMethod {
  get('GET'),
  post('POST'),
  delete('DELETE'),
  update('UPDATE'),
  patch('PATCH');

  const HttpMethod(this.method);

  final String method;
}

class HttpService {
  HttpService({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  Future<AppResponse<T>> requestUri<T>(
    Uri uri, {
    HttpMethod method = HttpMethod.get,
    Map<String, dynamic>? body,
  }) async {
    try {
      final res = await _dio.requestUri<T>(
        uri,
        data: body,
        options: Options(
          method: method.method,
        ),
      );
      final data = res.data;
      return AppSuccessResponse(data);
    } on DioException catch (e) {
      return AppFailureResponse(
        e.message ?? 'unknown error $e',
        e.response?.statusCode ?? -1,
      );
    }
  }
}
