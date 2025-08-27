import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:gainx/core/env.dart';
import 'package:gainx/core/services/auth_interceptor/auth_interceptor.dart';
import 'package:gainx/core/services/socket_hub_builder/socket_hub_builder.dart';
import 'package:gainx/core/services/stats_service/models.dart';
import 'package:gainx/core/services/stats_service/stats_service.dart';
import 'package:web_socket_client/web_socket_client.dart';

part 'inventory_event.dart';
part 'inventory_state.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  InventoryBloc({
    required AuthInterceptor authInterceptor,
    required StatsService statsService,
  })  : _statsService = statsService,
        _authInterceptor = authInterceptor,
        super(InventoryInitialState()) {
    on<InventoryStartedEvent>(_onInventoryStartedEvent);
  }

  final StatsService _statsService;
  final AuthInterceptor _authInterceptor;
  late WebSocket _hub;

  Future<void> _onInventoryStartedEvent(
    InventoryStartedEvent event,
    Emitter<InventoryState> emit,
  ) async {
    if (state is! InventorySuccessState) {
      emit(InventoryInProgressState());
    }

    final inventories = await _statsService.inventories();

    if (inventories.isNotEmpty) {
      emit(InventorySuccessState(inventories: inventories));
    }

    final token = _authInterceptor.stream.value.token;
    if (token == null) {
      return;
    }

    _hub = await SocketHubBuilder(
      uri: Env.inventroyOrderHub,
      token: token.token,
    ).build();

    final st = _hub.messages.transform(
        StreamTransformer<dynamic, List<dynamic>>.fromHandlers(
            handleData: (data, sink) {
      try {
        final event = jsonDecode(
                (data as String).replaceAll('{}', '').replaceAll('', ''))
            as Map<String, dynamic>;

        if (event
            case {
              'target': final String target,
              'arguments': final List<dynamic> arguments
            } when arguments.isNotEmpty && target == 'NotifyInventory') {
          sink.add(arguments);
        }
      } catch (_) {}
    }));

    await emit.forEach(
      st,
      onData: (data) {
        final newData = data.cast<Map<String, dynamic>>().map(
          (e) {
            final token = e.keys.first;
            final data = e[token] as Map<String, dynamic>;
            final quantity = data['quantity'] as num;
            final priceJson = data['price'] as Map<String, dynamic>;
            final price = priceJson['price'] as num;

            return (token, price, quantity);
          },
        );

        if (state is InventorySuccessState) {
          return InventorySuccessState(
            inventories: (state as InventorySuccessState).inventories.map(
              (e) {
                final update = newData
                    .firstWhereOrNull((element) => element.$1 == e.tokenName);
                return e.copyWith(
                  price: update?.$2.toDouble() ?? e.price,
                  quantity: update?.$3.toDouble() ?? e.quantity,
                );
              },
            ).toList(),
          );
        }

        return InventorySuccessState(inventories: []);
      },
    );
  }

  @override
  Future<void> close() async {
    _hub.close();
    return super.close();
  }
}
