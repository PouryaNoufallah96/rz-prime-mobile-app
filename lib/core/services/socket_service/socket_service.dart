import 'dart:async';

import 'package:gainx/core/services/auth_interceptor/auth_interceptor.dart';
import 'package:rxdart/rxdart.dart';
import 'package:signalr_netcore/http_connection_options.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';

class HubEvent {
  const HubEvent({required this.name, this.data});
  final String name;
  final dynamic data;
}

class SocketService {
  SocketService({
    required AuthInterceptor authInterceptor,
  }) : _authInterceptor = authInterceptor;
  static const String _baseUrl = 'https://api.rzprime.com';
  static const String _inventoryHubPath = '/hubs/inventory';
  static const String _paidOrderHubPath = '/hubs/paidOrder';

  static const String _methodNotifyInventory = 'NotifyInventory';
  static const String _methodNotifyPaidOrder = 'NotifyPaidOrder';
  static const String _invokeRegisterWallet = 'RegisterWallet';

  final AuthInterceptor _authInterceptor;

  HubConnection? _inventoryConn;
  HubConnection? _paidOrderConn;

  bool _inventoryStarted = false;
  bool _paidOrderStarted = false;

  String? _walletAddress;

  final Set<String> _inventoryHandlers = {_methodNotifyInventory};
  final Set<String> _paidOrderHandlers = {_methodNotifyPaidOrder};

  final _controller = StreamController<HubEvent>.broadcast();
  Stream<HubEvent> get stream => _controller.stream.doOnData((event) {
        print('SocketHubStream ${event.name} ${event.data}');
      });

  Future<void> connect(String address) async {
    _walletAddress = address;

    await disconnect();

    await _startInventory();
    await _startPaidOrderAndInvoke();
  }

  Future<void> disconnect({bool closeStreams = false}) async {
    try {
      if (_inventoryConn != null) {
        for (final m in _inventoryHandlers) {
          _inventoryConn!.off(m);
        }
      }
      if (_paidOrderConn != null) {
        for (final m in _paidOrderHandlers) {
          _paidOrderConn!.off(m);
        }
      }
    } catch (_) {}

    try {
      if (_inventoryStarted) {
        await _inventoryConn?.stop();
      }
      if (_paidOrderStarted) {
        await _paidOrderConn?.stop();
      }
    } catch (_) {}

    _inventoryStarted = false;
    _paidOrderStarted = false;
    _inventoryConn = null;
    _paidOrderConn = null;

    if (closeStreams) {
      await _controller.close();
    }
  }

  Future<void> _startInventory() async {
    _inventoryConn = await _buildConnection(_inventoryHubPath);

    _inventoryConn!.on(_methodNotifyInventory, (args) {
      _controller.add(HubEvent(
        name: _methodNotifyInventory,
        data: _normalizeArgs(args),
      ));
    });

    _wireLifecycle(_inventoryConn!);
    await _inventoryConn!.start();
    _inventoryStarted = true;
  }

  Future<void> _startPaidOrderAndInvoke() async {
    _paidOrderConn = await _buildConnection(_paidOrderHubPath);

    _paidOrderConn!.on(_methodNotifyPaidOrder, (args) {
      _controller.add(HubEvent(
        name: _methodNotifyPaidOrder,
        data: _normalizeArgs(args),
      ));
    });

    _wireLifecycle(
      _paidOrderConn!,
      onReconnected: () async => _invokeRegisterWalletIfReady(),
    );

    await _paidOrderConn!.start();
    _paidOrderStarted = true;

    await _invokeRegisterWalletIfReady();
  }

  Future<HubConnection> _buildConnection(String hubPath) async {
    final token = _getAccessToken();

    final url = token.isEmpty
        ? '$_baseUrl$hubPath'
        : '$_baseUrl$hubPath?access_token=$token';

    final options = HttpConnectionOptions(
      accessTokenFactory: () async => _getAccessToken(),
    );

    final builder = HubConnectionBuilder()
        .withUrl(url, options: options)
        .withAutomaticReconnect(retryDelays: const [
      0,
      2000,
      5000,
      10000,
    ]);

    final conn = builder.build()
      ..serverTimeoutInMilliseconds = 30 * 1000
      ..keepAliveIntervalInMilliseconds = 15 * 1000;
    return conn;
  }

  void _wireLifecycle(
    HubConnection conn, {
    Future<void> Function()? onReconnected,
  }) {
    conn
      ..onclose(({error}) async {})
      ..onreconnecting(({error}) async {})
      ..onreconnected(({connectionId}) async {
        if (onReconnected != null) {
          await onReconnected();
        }
      });
  }

  Future<void> _invokeRegisterWalletIfReady() async {
    if (_paidOrderConn == null || _walletAddress == null) return;
    try {
      await _paidOrderConn!
          .invoke(_invokeRegisterWallet, args: ['$_walletAddress']);
    } catch (_) {}
  }

  dynamic _normalizeArgs(List<Object?>? args) {
    if (args == null || args.isEmpty) return null;
    return args.length == 1 ? args.first : args;
  }

  String _getAccessToken() {
    return _authInterceptor.stream.value.token?.token ?? '';
  }

  Future<void> dispose() async {
    await disconnect(closeStreams: true);
  }
}
