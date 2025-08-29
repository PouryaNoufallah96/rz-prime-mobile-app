import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gainx/core/services/orders_service/orders_service.dart';
import 'package:gainx/core/services/transaction_service/transaction_service.dart';
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
        title: const Text('Order Dropped Successfully.'),
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

    try {
      final isApproved = await _transactionService.approve(event.amount);

      if (isApproved) {
        await _transactionService.payOrder(event.id);
      }

      Timer(const Duration(seconds: 30), () {
        emit(state.copyWith(payOrderStatus: PayOrderStatus.idle));
      });

      emit(
        state.copyWith(
          updateTime: isApproved
              ? DateTime.now().millisecondsSinceEpoch
              : state.updateTime,
          payOrderStatus: PayOrderStatus.idle,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          payOrderStatus: PayOrderStatus.idle,
        ),
      );
    }
  }
}
