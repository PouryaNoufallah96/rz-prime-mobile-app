import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gainx/core/services/stats_service/models.dart';
import 'package:gainx/core/services/stats_service/stats_service.dart';

part 'inventory_event.dart';
part 'inventory_state.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  InventoryBloc({required StatsService statsService})
      : _statsService = statsService,
        super(InventoryInitialState()) {
    on<InventoryStartedEvent>(_onInventoryStartedEvent);
  }

  final StatsService _statsService;

  Future<void> _onInventoryStartedEvent(
    InventoryStartedEvent event,
    Emitter<InventoryState> emit,
  ) async {
    if (state is! InventorySuccessState) {
      emit(InventoryInProgressState());
    }

    final inventories = await _statsService.inventories();
    emit(InventorySuccessState(inventories: inventories));

    await Future<void>.delayed(const Duration(seconds: 10));
    add(InventoryStartedEvent());
  }
}
