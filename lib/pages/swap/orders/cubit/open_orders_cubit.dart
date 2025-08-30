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

  Future<void> getOrdersAndCheck({required bool? isOrderCompeleted}) async {
    final lastOrderLength = (state as OpenOrdersSuccessState).orders.length;

    emit(OpenOrdersInProgressState());

    final data = await _ordersService.listOfOrders();

    emit(OpenOrdersSuccessState(orders: data));

    if (isOrderCompeleted == null) {
      return;
    }

    if (data.length < lastOrderLength) {
      toastification.show(
        style: ToastificationStyle.fillColored,
        type: ToastificationType.success,
        title: const Text('On-chain confirmed, Your order is finalized.'),
        borderRadius: BorderRadius.circular(6),
        autoCloseDuration: const Duration(seconds: 4),
      );
    } else if (data.length == lastOrderLength) {
      toastification.show(
        style: ToastificationStyle.fillColored,
        type: ToastificationType.error,
        title: const Text('On-chain rejected Your order did not execute.'),
        borderRadius: BorderRadius.circular(6),
        autoCloseDuration: const Duration(seconds: 4),
      );
    }
  }
}
