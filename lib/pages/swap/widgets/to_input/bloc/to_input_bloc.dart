import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gainx/core/services/orders_service/orders_service.dart';
import 'package:rxdart/rxdart.dart';

part 'to_input_event.dart';
part 'to_input_state.dart';

class ToInputBloc extends Bloc<ToInputEvent, ToInputState> {
  ToInputBloc({
    required OrdersService ordersService,
  })  : _ordersService = ordersService,
        super(ToInputStateInitialState()) {
    on<ToInputChanged>(_onPricePerUnitChanged,
        transformer: (events, mapper) => events
            .debounceTime(const Duration(milliseconds: 400))
            .switchMap(mapper));
  }

  final OrdersService _ordersService;

  Future<void> _onPricePerUnitChanged(
    ToInputChanged event,
    Emitter<ToInputState> emit,
  ) async {
    emit(ToInputStateInProgressState());

    if (event.asset == null || event.value <= 0) {
      return;
    }
    try {
      final price = await _ordersService.effectivePrice(
        assetName: event.asset!,
        loanAmount: event.value,
      );

      if (price != null) {
        emit(ToInputStateSuccessState(price: price));
      }
    } catch (_) {}
  }
}
