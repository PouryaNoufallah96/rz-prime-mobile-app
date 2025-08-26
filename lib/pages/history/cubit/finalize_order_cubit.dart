import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gainx/core/services/orders_service/models.dart';
import 'package:gainx/core/services/orders_service/orders_service.dart';

part 'finalize_order_state.dart';

class FinalizeOrderCubit extends Cubit<FinalizeOrderState> {
  FinalizeOrderCubit({
    required OrdersService ordersService,
  })  : _ordersService = ordersService,
        super(FinalizeOrderState());

  final OrdersService _ordersService;

  Future<void> getOrders() async {
    emit(
      state.copyWith(
        loadingStaus: FinalizeOrderLoadingStatus.inProgress,
        page: 1,
        orders: [],
      ),
    );

    final data = await _ordersService.listOfFinalizedOrders(state.page);

    emit(
      state.copyWith(
        loadingStaus: FinalizeOrderLoadingStatus.success,
        orders: data.$1,
        total: data.$2,
      ),
    );
  }

  Future<void> nextPage() async {
    if (state.loadingMoreStatus == FinalizeOrderLoadingStatus.inProgress ||
        state.loadingStaus != FinalizeOrderLoadingStatus.success ||
        state.orders.length == state.total) {
      return;
    }

    final newPage = state.page + 1;

    emit(state.copyWith(
      page: newPage,
      loadingMoreStatus: FinalizeOrderLoadingStatus.inProgress,
    ));

    final data = await _ordersService.listOfFinalizedOrders(newPage);

    emit(
      state.copyWith(
        loadingMoreStatus: FinalizeOrderLoadingStatus.success,
        orders: [
          ...state.orders,
          ...data.$1,
        ],
        total: data.$2,
      ),
    );
  }
}
