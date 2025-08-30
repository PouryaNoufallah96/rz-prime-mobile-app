import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gainx/core/services/orders_service/models.dart';
import 'package:gainx/core/services/orders_service/orders_service.dart';
import 'package:toastification/toastification.dart';

part 'open_orders_state.dart';

class OpenOrdersCubit extends Cubit<OpenOrdersState> {
  OpenOrdersCubit({
    required OrdersService ordersService,
  })  : _ordersService = ordersService,
        super(OpenOrdersInitialState());

  final OrdersService _ordersService;

  Future<void> getOrders() async {
    emit(OpenOrdersInProgressState());

    final data = await _ordersService.listOfOrders();

    emit(OpenOrdersSuccessState(orders: data));
  }

  Future<void> getOrdersAndCheck() async {
    final lastOrderLength = (state as OpenOrdersSuccessState).orders.length;

    emit(OpenOrdersInProgressState());

    final data = await _ordersService.listOfOrders();

    emit(OpenOrdersSuccessState(orders: data));

    if (data.length < lastOrderLength) {
      toastification.show(
        style: ToastificationStyle.fillColored,
        type: ToastificationType.success,
        title: const Text('Your order was confirmed on-chain.'),
        borderRadius: BorderRadius.circular(6),
        autoCloseDuration: const Duration(seconds: 4),
      );
    } else if (data.length == lastOrderLength) {
      toastification.show(
        style: ToastificationStyle.fillColored,
        type: ToastificationType.success,
        title: const Text('Your order was rejected on-chain.'),
        borderRadius: BorderRadius.circular(6),
        autoCloseDuration: const Duration(seconds: 4),
      );
    }
  }
}
