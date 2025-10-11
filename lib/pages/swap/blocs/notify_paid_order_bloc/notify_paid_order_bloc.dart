import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' as mt;
import 'package:gainx/core/services/socket_service/socket_service.dart';
import 'package:toastification/toastification.dart';

part 'notify_paid_order_event.dart';
part 'notify_paid_order_state.dart';

class NotifyPaidOrderBloc
    extends Bloc<NotifyPaidOrderEvent, NotifyPaidOrderState> {
  NotifyPaidOrderBloc({
    required SocketService socketService,
  })  : _socketService = socketService,
        super(NotifyPaidOrderState()) {
    on<NotifyPaidOrderStarted>(_onNotifyPaidOrderStarted);
  }

  final SocketService _socketService;

  Future<void> _onNotifyPaidOrderStarted(
    NotifyPaidOrderStarted event,
    Emitter<NotifyPaidOrderState> emit,
  ) async {
    final stream =
        _socketService.stream.where((event) => event.name == 'NotifyPaidOrder');

    await emit.onEach(stream, onData: (event) {
      final data = event.data as String?;

      toastification.show(
        style: ToastificationStyle.fillColored,
        type: data?.toLowerCase().contains('success') ?? false
            ? ToastificationType.success
            : ToastificationType.error,
        title: mt.Text(data ?? ''),
        borderRadius: mt.BorderRadius.circular(6),
        autoCloseDuration: const Duration(seconds: 4),
      );

      emit(NotifyPaidOrderState(
        lastUpdated: DateTime.now().millisecondsSinceEpoch,
      ));
    });
  }
}
