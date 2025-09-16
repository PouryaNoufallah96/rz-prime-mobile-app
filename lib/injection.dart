import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gainx/core/blocs/preferences_bloc/preferences_bloc.dart';
import 'package:gainx/core/env.dart';
import 'package:gainx/core/services/auth_interceptor/auth_interceptor.dart';
import 'package:gainx/core/services/auth_service/auth_service.dart';
import 'package:gainx/core/services/http_service/http_service.dart';
import 'package:gainx/core/services/orders_service/orders_service.dart';
import 'package:gainx/core/services/stats_service/stats_service.dart';
import 'package:http/http.dart' as http;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:reown_appkit/reown_appkit.dart';

Widget appInjection(Widget child) {
  return MultiRepositoryProvider(
    providers: [
      // RepositoryProvider(
      //   create: (context) => DeepLinkHandler()..init(),
      //   lazy: false,
      // ),
      RepositoryProvider(
        create: (context) {
          const rpc = 'https://sepolia.drpc.org';

          return Web3Client(rpc, http.Client());
        },
        lazy: false,
      ),
      RepositoryProvider(
        create: (context) => AuthInterceptor(),
        lazy: false,
      ),
      RepositoryProvider(
        create: (context) => Dio(
          BaseOptions(
            baseUrl: Env.apiEndPoint,
          ),
        )..interceptors.addAll([
            // CurlLoggerDioInterceptor(),
            PrettyDioLogger(
              requestBody: true,
              requestHeader: true,
            ),
            context.read<AuthInterceptor>(),
          ]),
        lazy: false,
      ),
      RepositoryProvider(
        create: (context) => HttpService(
          dio: context.read(),
        ),
      ),
      RepositoryProvider(
        create: (context) => AuthService(
          adapter: context.read(),
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
      ],
      child: child,
    ),
  );
}

// class DeepLinkHandler {
//   DeepLinkHandler()
//       : _eventChannel = const EventChannel('com.exampledapp/events');

//   final EventChannel _eventChannel;

//   void init() {
//     if (kIsWeb) return;

//     try {
//       _eventChannel.receiveBroadcastStream().listen(_onLink, onError: _onError);
//     } catch (e) {
//       debugPrint('[SampleDapp] checkInitialLink $e');
//     }
//   }

//   Future<void> _onLink(dynamic link) async {
//     try {} catch (_) {}
//   }

//   void _onError(dynamic error) {}
// }
