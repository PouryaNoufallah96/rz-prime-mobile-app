import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

class AppAuthToken with EquatableMixin {
  AppAuthToken({
    required this.token,
    required this.expireTime,
  });

  final String token;
  final DateTime expireTime;

  @override
  List<Object> get props => [token, expireTime];
}

class AppAuthSignature with EquatableMixin {
  AppAuthSignature({
    required this.signature,
    required this.expireTime,
  });

  final String signature;
  final DateTime expireTime;

  @override
  List<Object> get props => [signature, expireTime];
}

class AuthContainer with EquatableMixin {
  AuthContainer({
    this.token,
    this.signature,
    this.address,
  });

  final AppAuthToken? token;
  final AppAuthSignature? signature;
  final String? address;

  @override
  List<Object?> get props => [token, signature, address];
}

class AuthInterceptor extends QueuedInterceptor {
  AuthInterceptor() : _controller = BehaviorSubject() {
    _sink();
    Timer.periodic(const Duration(minutes: 1), (_) {
      check();
    });
  }

  final BehaviorSubject<AuthContainer> _controller;
  ValueStream<AuthContainer> get stream => _controller.stream;

  AppAuthToken? _cachedAuthToken;
  AppAuthSignature? _cachedAuthSignature;
  String? _address;

  bool get isTokenValid {
    final token = _controller.stream.value.token;
    return token != null && DateTime.now().isBefore(token.expireTime);
  }

  bool get isSignatureValid {
    final signature = _controller.stream.value.signature;
    return signature != null && DateTime.now().isBefore(signature.expireTime);
  }

  void clear() {
    _cachedAuthSignature = null;
    _cachedAuthToken = null;
    _address = null;
    _sink();
  }

  void _sink() {
    _controller.sink.add(AuthContainer(
      signature: _cachedAuthSignature,
      token: _cachedAuthToken,
      address: _address,
    ));
  }

  void setSignature(String signature) {
    _cachedAuthSignature = AppAuthSignature(
      signature: signature,
      expireTime: DateTime.now().add(const Duration(minutes: 15)),
    );
    _sink();
  }

  void setToken(String token) {
    _cachedAuthToken = AppAuthToken(
      token: token,
      expireTime: DateTime.now().add(const Duration(minutes: 15)),
    );
    _sink();
  }

  void setAddress(String? address) {
    _address = address;
    _sink();
  }

  void check() {
    if (!isTokenValid) {
      _cachedAuthToken = null;
    }
    if (!isSignatureValid) {
      _cachedAuthSignature = null;
    }

    _sink();
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    if (_cachedAuthToken != null) {
      options.headers.addAll({
        'Authorization': 'Bearer ${_cachedAuthToken!.token}',
      });
    }

    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    if (response.statusCode == 403 || response.statusCode == 401) {
      clear();
    }

    handler.next(response);
  }
}
