import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gainx/core/constants/available_tokens.dart';
import 'package:gainx/core/services/socket_service/socket_service.dart';
import 'package:gainx/core/services/stats_service/models.dart';
import 'package:gainx/core/services/stats_service/stats_service.dart';

part 'inventory_event.dart';
part 'inventory_state.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  InventoryBloc({
    required SocketService socketService,
    required StatsService statsService,
  })  : _statsService = statsService,
        _socketService = socketService,
        super(InventoryInitialState()) {
    on<InventoryStartedEvent>(_onInventoryStartedEvent);
    on<InventorySocketStartedEvent>(_onInventorySocketStartedEvent);
  }

  final SocketService _socketService;
  final StatsService _statsService;

  Future<void> _onInventoryStartedEvent(
    InventoryStartedEvent event,
    Emitter<InventoryState> emit,
  ) async {
    add(InventorySocketStartedEvent());
    if (state is! InventorySuccessState) {
      emit(InventoryInProgressState());
    }

    final inventories = await _statsService.inventories();

    if (inventories.isNotEmpty) {
      emit(InventorySuccessState(inventories: inventories));
    }
  }

  Future<void> _onInventorySocketStartedEvent(
    InventorySocketStartedEvent event,
    Emitter<InventoryState> emit,
  ) async {
    final stream =
        _socketService.stream.where((event) => event.name == 'NotifyInventory');

    await emit.forEach(
      stream,
      onData: (event) {
        final json = event.data as Map<String, dynamic>;
        final newData = json.entries.map((e) {
          final value = e.value as Map<String, dynamic>;
          return InventoryModel.fromJson(
              {...value, ...value['price'] as Map<String, dynamic>});
        });

        return InventorySuccessState(inventories: newData.whereAvailable());
      },
    );
  }
}
