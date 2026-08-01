import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

class Env {
  static final _env = _Env.get();

  static String reownProjectId = _env.reownProjectId;
  static String apiEndPoint = _env.apiEndPoint;
  static String clientId = _env.clientId;
  static String clientSecret = _env.clientSecret;
  static String publicSignature = _env.publicSignature;
  static String inventroyOrderHub = _env.inventroyOrderHub;
  static String paidOrderHub = _env.paidOrderHub;
  static String appContractAddress = _env.appContractAddress;
  static String appContractName = _env.appContractName;
  static String erc20Address = _env.erc20Address;
  static String erc20Name = _env.erc20Name;
  static String applicationId = _env.applicationId;

  static Map<String, dynamic> authHeaders() {
    final now = DateTime.now().millisecondsSinceEpoch.toString();
    final randomPart = (Random().nextDouble() * 1000000000).toInt().toString();
    final nonce = now + randomPart;

    final key = utf8.encode(publicSignature);
    final message = utf8.encode(nonce);

    final hmacSha256 = Hmac(sha256, key);
    final digest = hmacSha256.convert(message);

    final signature = base64Encode(digest.bytes);

    return {
      'Origin': 'https://app.rzprime.com',
      'Applicationid': applicationId,
      'Nonce': nonce,
      'Signature': signature,
    };
  }
}

sealed class _Env {
  _Env({
    required this.reownProjectId,
    required this.apiEndPoint,
    required this.clientId,
    required this.clientSecret,
    required this.publicSignature,
    required this.paidOrderHub,
    required this.inventroyOrderHub,
    required this.appContractAddress,
    required this.appContractName,
    required this.erc20Address,
    required this.erc20Name,
    required this.applicationId,
  });

  factory _Env.get() {
    return _StageEnv();
  }

  final String reownProjectId;
  final String apiEndPoint;
  final String clientId;
  final String clientSecret;
  final String publicSignature;
  final String paidOrderHub;
  final String inventroyOrderHub;
  final String appContractAddress;
  final String appContractName;
  final String erc20Address;
  final String erc20Name;
  final String applicationId;
}

class _StageEnv extends _Env {
  _StageEnv()
      : super(
          reownProjectId: '4ee4cb238a3caa0a5a21e69a7f2b71b3',
          apiEndPoint: 'https://api.rzprime.com/api/v1/',
          clientId: 'app_mainappful',
          clientSecret: 'LilIlldfhgkaynvvhsdswq',
          publicSignature: 'iliuyiLilkdhAqHCUjV5P5Fjv5y',
          inventroyOrderHub: 'wss://api.rzprime.com/hubs/inventory',
          paidOrderHub: 'wss://api.rzprime.com/hubs/paidOrder',
          appContractAddress: '0x65DBF255279F4948930dB5394c71580f6d0fFACD',
          appContractName: 'RZPrime',
          erc20Address: '0xC4A1cc5cA8955a4650BDC109bddf110E33a1e344',
          erc20Name: 'RZUSD',
          applicationId: 'rzprime.mainapp',
        );
}
