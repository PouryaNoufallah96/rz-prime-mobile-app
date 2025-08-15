import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gainx/core/services/orders_service/orders_service.dart';
import 'package:gainx/core/services/stats_service/models.dart';
import 'package:intl/intl.dart';

part 'swap_event.dart';
part 'swap_state.dart';

class SwapBloc extends Bloc<SwapEvent, SwapState> {
  SwapBloc({
    required UserStats stats,
    required OrdersService ordersService,
  })  : _ordersService = ordersService,
        super(SwapState(stats: stats)) {
    on<SwapPayOfTimeChanged>(_onSwapPayOfTimeChanged);
    on<SwapSelectedTokenChanged>(_onSwapSelectedTokenChanged);
    on<SwapFromValueChanged>(_onSwapFromValueChanged);
    on<SwapSubmited>(_onSwapSubmited);
  }

  final OrdersService _ordersService;

  void _onSwapPayOfTimeChanged(
    SwapPayOfTimeChanged event,
    Emitter<SwapState> emit,
  ) {
    emit(state.copyWith(swapPayOfTime: () => event.payOfTime));
  }

  void _onSwapSelectedTokenChanged(
    SwapSelectedTokenChanged event,
    Emitter<SwapState> emit,
  ) {
    emit(state.copyWith(selectedToken: () => event.inventory));
  }

  void _onSwapFromValueChanged(
    SwapFromValueChanged event,
    Emitter<SwapState> emit,
  ) {
    emit(state.copyWith(fromValue: event.value));
  }

  Future<void> _onSwapSubmited(
    SwapSubmited event,
    Emitter<SwapState> emit,
  ) async {
    if (state.selectedToken == null || state.swapPayOfTime == null) {
      return;
    }

    emit(state.copyWith(submitSwapStatus: SubmitSwapStatus.inProgress));

    final payOf = _addMonthsClamped(state.swapPayOfTime!.month);
    final formattedPayOf = DateFormat('yyyy-MM-dd').format(payOf);

    await _ordersService.submitOrder(
      assetName: state.selectedToken!.assetName,
      loanAmount: state.fromValue,
      payOffDate: formattedPayOf,
    );

    emit(state.copyWith(submitSwapStatus: SubmitSwapStatus.idle));
  }

  DateTime _addMonthsClamped(int months) {
    final dt = DateTime.now();

    final m0 = dt.month + months;
    final y = dt.year + ((m0 - 1) ~/ 12);
    final m = ((m0 - 1) % 12) + 1;
    final lastDayOfTargetMonth = DateTime(y, m + 1, 0).day;
    final d = dt.day > lastDayOfTargetMonth ? lastDayOfTargetMonth : dt.day;
    return DateTime(
        y, m, d, dt.hour, dt.minute, dt.second, dt.millisecond, dt.microsecond);
  }
}
