import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gainx/core/blocs/preferences_bloc/preferences_bloc.dart';
import 'package:gainx/core/design_system/theme.dart';
import 'package:gainx/injection.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

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
        return MaterialApp.router(
          routerConfig: appRouter,
          title: 'GainX',
          theme: GainXTheme()(isDark),
        );
      },
    );
  }
}
