import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gainx/core/blocs/inventory/inventory_bloc.dart';
import 'package:gainx/core/blocs/preferences_bloc/preferences_bloc.dart';
import 'package:gainx/core/design_system/theme.dart';
import 'package:gainx/core/services/auth_interceptor/auth_interceptor.dart';
import 'package:gainx/core/services/reown/reown.dart';
import 'package:gainx/core/services/socket_service/socket_service.dart';
import 'package:gainx/core/services/transaction_service/transaction_service.dart';
import 'package:gainx/injection.dart';
import 'package:gainx/pages/auth/auth.dart';
import 'package:gainx/pages/history/cubit/finalize_order_cubit.dart';
import 'package:gainx/pages/history/history.dart';
import 'package:gainx/pages/nested_page/cubit/overlay_cubit.dart';
import 'package:gainx/pages/nested_page/nested_page.dart';
import 'package:gainx/pages/on_boarding/on_boarding.dart';
import 'package:gainx/pages/settings/settings.dart';
import 'package:gainx/pages/swap/blocs/notify_paid_order_bloc/notify_paid_order_bloc.dart';
import 'package:gainx/pages/swap/swap.dart';
import 'package:gainx/pages/terms_of_use/terms_of_use.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reown_appkit/reown_appkit.dart';
import 'package:rxdart/rxdart.dart';
import 'package:toastification/toastification.dart';

part 'router/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final path = (await getTemporaryDirectory()).path;

  Hive.init(path);

  final storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(path),
  );

  HydratedBloc.storage = storage;

  runApp(appInjection(const GainXApp()));
}

class GainXApp extends StatefulHookWidget {
  const GainXApp({super.key});

  @override
  State<GainXApp> createState() => _GainXAppState();
}

class _GainXAppState extends State<GainXApp> with GainXAppRouter {
  @override
  Widget build(BuildContext context) {
    final appRouter = useMemoized(() => router);

    return BlocSelector<PreferencesBloc, PreferencesState, bool>(
      selector: (state) => state.isDark,
      builder: (context, isDark) {
        return ReownAppKitModalTheme(
          isDarkMode: isDark,
          child: ToastificationWrapper(
            config: const ToastificationConfig(
              maxToastLimit: 1,
              maxTitleLines: 4,
            ),
            child: MaterialApp.router(
              routerConfig: appRouter,
              title: 'RZPrime',
              theme: GainXTheme()(isDark),
              builder: (context, child) {
                return RepositoryProvider(
                  create: (context) =>
                      ReownService()..call(routerKey.currentContext!),
                  child: child,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
