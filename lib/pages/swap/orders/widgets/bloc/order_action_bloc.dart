import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gainx/core/services/orders_service/orders_service.dart';
import 'package:gainx/core/services/transaction_service/transaction_service.dart';
import 'package:gainx/core/utils/future_timeout.dart';
import 'package:toastification/toastification.dart';

part 'order_action_event.dart';
part 'order_action_state.dart';

class OrderActionBloc extends Bloc<OrderActionEvent, OrderActionState> {
  OrderActionBloc({
    required OrdersService ordersService,
    required TransactionService transactionService,
  })  : _ordersService = ordersService,
        _transactionService = transactionService,
        super(OrderActionState()) {
    on<OrderActionDropped>(_onOrderActionDropped);
    on<OrderActionPayed>(_onOrderActionPayed);
  }

  final OrdersService _ordersService;
  final TransactionService _transactionService;

  Future<void> _onOrderActionDropped(
    OrderActionDropped event,
    Emitter<OrderActionState> emit,
  ) async {
    emit(state.copyWith(dropOrderStatus: DropOrderStatus.inProgress));

    final isSucceed = await _ordersService.dropOrder(orderId: event.id);

    if (isSucceed) {
      toastification.show(
        style: ToastificationStyle.fillColored,
        type: ToastificationType.success,
        title: const Text('Order dropped Successfully.'),
        borderRadius: BorderRadius.circular(6),
        autoCloseDuration: const Duration(seconds: 4),
      );
    }

    emit(
      state.copyWith(
        updateTime: isSucceed
            ? DateTime.now().millisecondsSinceEpoch
            : state.updateTime,
        dropOrderStatus: DropOrderStatus.idle,
      ),
    );
  }

  Future<void> _onOrderActionPayed(
    OrderActionPayed event,
    Emitter<OrderActionState> emit,
  ) async {
    emit(state.copyWith(payOrderStatus: PayOrderStatus.inProgress));

    final balance = await futureTimeout(
      _transactionService.balance(),
      const Duration(seconds: 20),
      () {
        toastification.show(
          style: ToastificationStyle.fillColored,
          type: ToastificationType.error,
          title: const Text('There was a problem connecting to your wallet.'),
          borderRadius: BorderRadius.circular(6),
          autoCloseDuration: const Duration(seconds: 4),
        );
      },
    );

    if (balance == null) {
      emit(state.copyWith(payOrderStatus: PayOrderStatus.idle));

      return;
    }

    if (balance.$2 < event.amount) {
      toastification.show(
        style: ToastificationStyle.fillColored,
        type: ToastificationType.error,
        title: Text(
            // ignore: lines_longer_than_80_chars
            'Insufficient USDT on ${balance.$1}. Switch network or fund your wallet.'),
        borderRadius: BorderRadius.circular(6),
        autoCloseDuration: const Duration(seconds: 4),
      );

      emit(state.copyWith(payOrderStatus: PayOrderStatus.idle));

      return;
    }

    try {
      final isApproved = await futureTimeout(
        _transactionService.approve(event.amount),
        const Duration(seconds: 30),
        () {
          emit(state.copyWith(payOrderStatus: PayOrderStatus.idle));

          toastification.show(
            style: ToastificationStyle.fillColored,
            type: ToastificationType.error,
            title: const Text('There was a problem connecting to your wallet.'),
            borderRadius: BorderRadius.circular(6),
            autoCloseDuration: const Duration(seconds: 4),
          );
        },
      );

      if (isApproved ?? false) {
        final isPayed = await futureTimeout(
          _transactionService.payOrder(event.id),
          const Duration(seconds: 30),
          () {
            emit(state.copyWith(payOrderStatus: PayOrderStatus.idle));

            toastification.show(
              style: ToastificationStyle.fillColored,
              type: ToastificationType.error,
              title:
                  const Text('There was a problem connecting to your wallet.'),
              borderRadius: BorderRadius.circular(6),
              autoCloseDuration: const Duration(seconds: 4),
            );
          },
        );

        if (isPayed ?? false) {
          toastification.show(
            style: ToastificationStyle.fillColored,
            type: ToastificationType.info,
            title: const Text(
                'Transaction is in progress. This may take a while.'),
            borderRadius: BorderRadius.circular(6),
            autoCloseDuration: const Duration(seconds: 4),
          );
        }
      } else {
        toastification.show(
          style: ToastificationStyle.fillColored,
          type: ToastificationType.error,
          title: const Text('The transaction was rejected.'),
          borderRadius: BorderRadius.circular(6),
          autoCloseDuration: const Duration(seconds: 4),
        );
      }

      emit(
        state.copyWith(
          updateTime: isApproved ?? false
              ? DateTime.now().millisecondsSinceEpoch
              : state.updateTime,
          payOrderStatus: PayOrderStatus.idle,
        ),
      );
    } catch (e) {
      toastification.show(
        style: ToastificationStyle.fillColored,
        type: ToastificationType.error,
        title: const Text('There was a problem connecting to your wallet'),
        borderRadius: BorderRadius.circular(6),
        autoCloseDuration: const Duration(seconds: 4),
      );

      emit(state.copyWith(payOrderStatus: PayOrderStatus.idle));
    } finally {
      await _transactionService.loadAccountData();
    }
  }
}
