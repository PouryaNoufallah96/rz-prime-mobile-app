import 'dart:convert';
import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:crypto/crypto.dart' as c;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uuid/uuid.dart';

class DeviceIdService {
  static const String _pepper =
      String.fromEnvironment('APP_DEVICE_PEPPER', defaultValue: 'test1');

  static const String _packageName = 'com.your.app';
  static const _storage = FlutterSecureStorage();

  static Future<String> encryptToBase64() async {
    if (_pepper.isEmpty) {
      throw StateError(
        'APP_DEVICE_PEPPER ست نشده. با --dart-define=APP_DEVICE_PEPPER=... اجرا/بیلد کن.',
      );
    }

    var ssaid = 'UNKNOWN_ANDROID_ID';
    if (Platform.isAndroid) {
      try {
        final id = await const AndroidId().getId();
        if (id != null && id.isNotEmpty) ssaid = id;
      } catch (_) {}
    } else if (Platform.isIOS) {
      try {
        final id = await _storage.read(key: 'device_id');
        if (id != null && id.isNotEmpty) {
          ssaid = id;
        } else {
          final id = const Uuid().v4();
          await _storage.write(key: 'device_id', value: id);
          ssaid = id;
        }
      } catch (_) {}
    }

    final message = utf8.encode('$ssaid::$_packageName');

    final hmacSha256 = c.Hmac(c.sha256, utf8.encode(_pepper));
    final mac = hmacSha256.convert(message);

    final b64 = base64Url.encode(mac.bytes).replaceAll('=', '');
    return b64;
  }

  static Future<String> encryptToHex() async {
    if (_pepper.isEmpty) {
      throw StateError(
        'APP_DEVICE_PEPPER ست نشده. با --dart-define=APP_DEVICE_PEPPER=... اجرا/بیلد کن.',
      );
    }
    var ssaid = 'UNKNOWN_ANDROID_ID';
    if (Platform.isAndroid) {
      try {
        final id = await const AndroidId().getId();
        if (id != null && id.isNotEmpty) ssaid = id;
      } catch (_) {}
    } else if (Platform.isIOS) {
      try {
        final id = await _storage.read(key: 'device_id');
        if (id != null && id.isNotEmpty) {
          ssaid = id;
        } else {
          final id = const Uuid().v4();
          await _storage.write(key: 'device_id', value: id);
          ssaid = id;
        }
      } catch (_) {}
    }

    final message = utf8.encode('$ssaid::$_packageName');
    final hmacSha256 = c.Hmac(c.sha256, utf8.encode(_pepper));
    final mac = hmacSha256.convert(message);
    final sb = StringBuffer();
    for (final b in mac.bytes) {
      sb.write(b.toRadixString(16).padLeft(2, '0'));
    }
    final result = sb.toString();

    print('Cached Device Id $result');
    return result;
  }
}
