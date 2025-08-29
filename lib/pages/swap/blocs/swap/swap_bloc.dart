import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:gainx/core/services/orders_service/orders_service.dart';
import 'package:gainx/core/services/stats_service/models.dart';
import 'package:toastification/toastification.dart';

part 'swap_event.dart';
part 'swap_state.dart';

class SwapBloc extends Bloc<SwapEvent, SwapState> {
  SwapBloc({
    required OrdersService ordersService,
  })  : _ordersService = ordersService,
        super(SwapState()) {
    on<SwapPayOfTimeChanged>(_onSwapPayOfTimeChanged);
    on<SwapSelectedTokenChanged>(_onSwapSelectedTokenChanged);
    on<SwapFromValueChanged>(_onSwapFromValueChanged);
    on<SwapSubmited>(_onSwapSubmited);
    on<SwapInventoryUpdated>(_onSwapInventoryUpdated);
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

  void _onSwapInventoryUpdated(
    SwapInventoryUpdated event,
    Emitter<SwapState> emit,
  ) {
    final find = event.inventories
        .firstWhereOrNull((e) => e.tokenName == state.selectedToken?.tokenName);

    if (find != null) {
      emit(state.copyWith(selectedToken: () => find));
    }
  }

  Future<void> _onSwapSubmited(
    SwapSubmited event,
    Emitter<SwapState> emit,
  ) async {
    if (state.selectedToken == null || state.swapPayOfTime == null) {
      return;
    }

    emit(state.copyWith(submitSwapStatus: SubmitSwapStatus.inProgress));

    final isSucceed = await _ordersService.submitOrder(
      selectedStage: event.selectedStage,
      assetName: state.selectedToken!.tokenName,
      loanAmount: state.fromValue,
      monthDuration: state.swapPayOfTime!.month,
    );

    if (isSucceed) {
      toastification.show(
        style: ToastificationStyle.fillColored,
        type: ToastificationType.success,
        title: const Text('Order Created Successfully.'),
        borderRadius: BorderRadius.circular(6),
        autoCloseDuration: const Duration(seconds: 4),
      );
      emit(
        state.copyWith(
          submitSwapStatus: SubmitSwapStatus.idle,
          selectedToken: () => null,
          swapPayOfTime: () => null,
          fromValue: 0,
        ),
      );
    } else {
      emit(state.copyWith(submitSwapStatus: SubmitSwapStatus.idle));
    }
  }
}
