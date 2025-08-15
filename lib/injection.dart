import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gainx/core/blocs/inventory/inventory_bloc.dart';
import 'package:gainx/core/blocs/preferences_bloc/preferences_bloc.dart';
import 'package:gainx/core/env.dart';
import 'package:gainx/core/services/http_service/http_service.dart';
import 'package:gainx/core/services/orders_service/orders_service.dart';
import 'package:gainx/core/services/stats_service/stats_service.dart';

Widget appInjection(Widget child) {
  return MultiRepositoryProvider(
    providers: [
      RepositoryProvider(
        create: (context) => Dio(
          BaseOptions(
            baseUrl: Env.apiEndPoint,
          ),
        ),
      ),
      RepositoryProvider(
        create: (context) => HttpService(
          dio: context.read(),
        ),
      ),
      RepositoryProvider(
        create: (context) => OrdersService(
          adapter: context.read(),
        ),
      ),
      RepositoryProvider(
        create: (context) => StatsService(
          adapter: context.read(),
        ),
      ),
    ],
    child: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PreferencesBloc(),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => InventoryBloc(
            statsService: context.read(),
          )..add(InventoryStartedEvent()),
        ),
      ],
      child: child,
    ),
  );
}

class DeepLinkHandler {
  static const _eventChannel = EventChannel('com.exampledapp/events');

  static void init() {
    if (kIsWeb) return;

    try {
      _eventChannel.receiveBroadcastStream().listen(_onLink, onError: _onError);
    } catch (e) {
      debugPrint('[SampleDapp] checkInitialLink $e');
    }
  }

  static Future<void> _onLink(dynamic link) async {
    try {} catch (_) {}
  }

  static void _onError(dynamic error) {}
}
