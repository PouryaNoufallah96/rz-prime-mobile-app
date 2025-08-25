import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart' as crypto;
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:gainx/core/env.dart';
import 'package:toastification/toastification.dart';

sealed class AppResponse<T> with EquatableMixin {}

class AppSuccessResponse<T> extends AppResponse<T> {
  AppSuccessResponse(this.data);

  final T? data;

  @override
  List<Object?> get props => [data];
}

class AppFailureResponse<T> extends AppResponse<T> {
  AppFailureResponse(this.message, this.statusCode);

  final String message;
  final int statusCode;

  @override
  List<Object?> get props => [message, statusCode];
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
    int? resStatusCode,
  }) async {
    final nonce = DateTime.now().millisecondsSinceEpoch.toString() +
        Random().nextInt(1000000000).toString();

    final key = utf8.encode(Env.publicSignature);
    final bytes = utf8.encode(nonce);

    final hmacSha256 = crypto.Hmac(crypto.sha256, key);
    final digest = hmacSha256.convert(bytes);

    final signature = base64Encode(digest.bytes);

    try {
      final res = await _dio.requestUri<T>(
        uri,
        data: {
          if (body != null) ...body,
          'clientId': Env.clientId,
          'clientSecret': Env.clientSecret,
        },
        options: Options(method: method.method, headers: {
          'Nonce': nonce,
          'Signature': signature,
        }),
      );

      final data = res.data;

      if (resStatusCode != null && res.statusCode != resStatusCode) {
        return AppFailureResponse(
          data?.toString() ?? 'unknown error',
          res.statusCode!,
        );
      }

      return AppSuccessResponse(data);
    } on DioException catch (e) {
      final message =
          (e.response?.data as Map<String, dynamic>?)?['Message'] as String?;

      final errorMessage = message ?? e.message ?? 'unknown error $e';

      if (e.response?.statusCode != null) {
        toastification.show(
          style: ToastificationStyle.minimal,
          type: ToastificationType.error,
          title: Text(errorMessage),
          borderRadius: BorderRadius.circular(6),
          autoCloseDuration: const Duration(seconds: 4),
        );
      }
      return AppFailureResponse(
        errorMessage,
        e.response?.statusCode ?? -1,
      );
    }
  }
}
