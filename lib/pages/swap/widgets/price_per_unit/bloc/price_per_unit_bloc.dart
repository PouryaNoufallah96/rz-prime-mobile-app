import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gainx/core/services/orders_service/orders_service.dart';
import 'package:rxdart/rxdart.dart';

part 'price_per_unit_event.dart';
part 'price_per_unit_state.dart';

class PricePerUnitBloc extends Bloc<PricePerUnitEvent, PricePerUnitState> {
  PricePerUnitBloc({
    required OrdersService ordersService,
  })  : _ordersService = ordersService,
        super(PricePerUnitStateInitialState()) {
    on<PricePerUnitChanged>(_onPricePerUnitChanged,
        transformer: (events, mapper) => events
            .debounceTime(const Duration(milliseconds: 400))
            .switchMap(mapper));
  }

  final OrdersService _ordersService;

  Future<void> _onPricePerUnitChanged(
    PricePerUnitChanged event,
    Emitter<PricePerUnitState> emit,
  ) async {
    emit(PricePerUnitStateInProgressState());

    if (event.asset == null) {
      return;
    }

    final price = await _ordersService.effectivePrice(
      assetName: event.asset!,
      loanAmount: event.value,
    );

    if (price != null) {
      emit(PricePerUnitStateSuccessState(effectivePrice: price.effectivePrice));
    }
  }
}
