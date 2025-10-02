import 'package:gainx/core/services/auth_service/models.dart';
import 'package:gainx/core/services/device_id/device_id.dart';
import 'package:gainx/core/services/http_service/http_service.dart';

class AuthService {
  AuthService({
    required HttpService adapter,
  }) : _adapter = adapter;

  final HttpService _adapter;

  Future<NonceData?> getNonce(String walletAddress) async {
    final res = await _adapter.requestUri<Map<String, dynamic>>(
      Uri.parse('User/GetNonceForApp'),
      method: HttpMethod.post,
      body: {
        'marker': await DeviceIdService.encryptToHex(),
        'walletAddress': walletAddress,
      },
    );

    return switch (res) {
      AppSuccessResponse(:final data) =>
        NonceData.fromJson(data!['data']! as Map<String, dynamic>),
      _ => null,
    };
  }

  Future<String?> getToken({
    required String walletAddress,
    required String nonce,
    required String signature,
  }) async {
    final res = await _adapter.requestUri<Map<String, dynamic>>(
      Uri.parse('User/GetToken'),
      method: HttpMethod.post,
      body: {
        'walletAddress': walletAddress,
        'signature': signature,
        'nonce': nonce,
      },
    );

    return switch (res) {
      AppSuccessResponse(:final data) => data?['access_token'] as String?,
      _ => null,
    };
  }

  Future<String?> getTokenWithWalletAddress({
    required String walletAddress,
  }) async {
    final res = await _adapter.requestUri<Map<String, dynamic>>(
      Uri.parse('User/GetTokenWithPureWalletAddress'),
      method: HttpMethod.post,
      body: {
        'walletAddress': walletAddress,
      },
    );

    return switch (res) {
      AppSuccessResponse(:final data) => data?['access_token'] as String?,
      _ => null,
    };
  }

  Future<bool> activateNonce({
    required String address,
    String? nonce,
    String? code,
  }) async {
    final res = await _adapter.requestUri<Map<String, dynamic>>(
      Uri.parse('User/ActivateNonce'),
      method: HttpMethod.post,
      body: {
        'code': code,
        'nonce': nonce,
        'walletAddress': address,
        'marker': await DeviceIdService.encryptToHex(),
      },
    );

    return switch (res) {
      AppSuccessResponse(:final data) => (data?['data'] as bool?) ?? false,
      _ => false,
    };
  }

  Future<bool> logout() async {
    final res = await _adapter.requestUri<Map<String, dynamic>>(
      Uri.parse('User/logout'),
      method: HttpMethod.post,
    );

    return res is AppSuccessResponse;
  }
}
