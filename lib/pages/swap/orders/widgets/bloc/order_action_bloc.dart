import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gainx/core/services/orders_service/orders_service.dart';

part 'order_action_event.dart';
part 'order_action_state.dart';

class OrderActionBloc extends Bloc<OrderActionEvent, OrderActionState> {
  OrderActionBloc({required OrdersService ordersService})
      : _ordersService = ordersService,
        super(OrderActionState()) {
    on<OrderActionDropped>(_onOrderActionDropped);
  }

  final OrdersService _ordersService;

  Future<void> _onOrderActionDropped(
    OrderActionDropped event,
    Emitter<OrderActionState> emit,
  ) async {
    emit(state.copyWith(dropOrderStatus: DropOrderStatus.inProgress));

    final isSucceed = await _ordersService.dropOrder(orderId: event.id);

    emit(
      state.copyWith(
        updateTime: isSucceed
            ? DateTime.now().millisecondsSinceEpoch
            : state.updateTime,
        dropOrderStatus: DropOrderStatus.idle,
      ),
    );
  }
}
