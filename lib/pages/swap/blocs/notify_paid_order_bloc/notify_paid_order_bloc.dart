import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' as mt;
import 'package:gainx/core/env.dart';
import 'package:gainx/core/services/auth_interceptor/auth_interceptor.dart';
import 'package:gainx/core/services/reown/reown.dart';
import 'package:gainx/core/services/socket_hub_builder/socket_hub_builder.dart';
import 'package:reown_appkit/reown_appkit.dart';
import 'package:toastification/toastification.dart';
import 'package:web_socket_client/web_socket_client.dart';

part 'notify_paid_order_event.dart';
part 'notify_paid_order_state.dart';

class NotifyPaidOrderBloc
    extends Bloc<NotifyPaidOrderEvent, NotifyPaidOrderState> {
  NotifyPaidOrderBloc({
    required AuthInterceptor authInterceptor,
    required ReownService reownService,
  })  : _authInterceptor = authInterceptor,
        _reownService = reownService,
        super(NotifyPaidOrderState()) {
    on<NotifyPaidOrderStarted>(_onNotifyPaidOrderStarted);
  }

  late WebSocket _socket;
  late Timer _timer;
  final AuthInterceptor _authInterceptor;
  final ReownService _reownService;

  late final StreamSubscription<ConnectionState> _connectionSub;

  Future<void> _onNotifyPaidOrderStarted(
    NotifyPaidOrderStarted event,
    Emitter<NotifyPaidOrderState> emit,
  ) async {
    _socket = await SocketHubBuilder(
      uri: Env.paidOrderHub,
      token: _authInterceptor.stream.value.token?.token ?? '',
    ).build();

    final chainId = _reownService.appKitModal.selectedChain!.chainId;

    final namespace = NamespaceUtils.getNamespaceFromChain(
      chainId,
    );

    final rawAddress =
        _reownService.appKitModal.session!.getAddress(namespace)!;

    invoke(rawAddress);

    _connectionSub = _socket.connection.listen((event) {
      print('RegisterWallet Status: $event');

      if (state is Reconnected) {
        _socket.send('{"type":6}');
        invoke(rawAddress);
      }
    });

    _timer = Timer.periodic(const Duration(seconds: 15), (timer) {
      _socket.send('{"type":6}');
    });

    await emit.onEach(
      _socket.messages.transform(
        StreamTransformer<dynamic, String?>.fromHandlers(
          handleData: (data, sink) {
            try {
              final event = jsonDecode((data as String)
                  .replaceAll('', '')
                  .replaceAll('{}', '')
                  .replaceAll('{}', '')) as Map<String, dynamic>;

              if (event
                  case {
                    'target': final String target,
                    'arguments': final List<dynamic> arguments
                  } when arguments.isNotEmpty && target == 'NotifyPaidOrder') {
                final data = arguments.first as String?;
                sink.add(data);
              }
            } catch (_) {}
          },
        ),
      ),
      onData: (event) async {
        toastification.show(
          style: ToastificationStyle.fillColored,
          type: event?.contains('success') ?? false
              ? ToastificationType.error
              : ToastificationType.success,
          title: mt.Text(event ?? ''),
          borderRadius: mt.BorderRadius.circular(6),
          autoCloseDuration: const Duration(seconds: 4),
        );

        await Future<void>.delayed(const Duration(seconds: 4));
        emit(NotifyPaidOrderState(
          lastUpdated: DateTime.now().millisecondsSinceEpoch,
        ));
      },
    );
  }

  void invoke(String address) {
    print('RegisterWallet invoke $address');

    final EthereumAddress(:hexEip55) = EthereumAddress.fromHex(address);
    _socket.send(
        // ignore: lines_longer_than_80_chars
        '{"target":"RegisterWallet","arguments":["$hexEip55"],"invocationId":"0","type":1}');
  }

  @override
  Future<void> close() async {
    _timer.cancel();
    _socket.close();
    await _connectionSub.cancel();
    return super.close();
  }
}
