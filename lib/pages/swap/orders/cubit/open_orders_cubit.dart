import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gainx/core/services/orders_service/models.dart';
import 'package:gainx/core/services/orders_service/orders_service.dart';

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
}
