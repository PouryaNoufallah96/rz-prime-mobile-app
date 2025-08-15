import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gainx/core/services/orders_service/models.dart';
import 'package:gainx/core/services/orders_service/orders_service.dart';

part 'finalize_order_state.dart';

class FinalizeOrderCubit extends Cubit<FinalizeOrderState> {
  FinalizeOrderCubit({
    required OrdersService ordersService,
  })  : _ordersService = ordersService,
        super(FinalizeOrderInitialState());

  final OrdersService _ordersService;

  Future<void> getOrders() async {
    emit(FinalizeOrderInProgressState());

    final data = await _ordersService.listOfFinalizedOrders();

    emit(FinalizeOrderSuccessState(orders: data));
  }
}
