import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gainx/core/blocs/preferences_bloc/preferences_bloc.dart';

Widget appInjection(Widget child) {
  return MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => PreferencesBloc(),
      ),
    ],
    child: child,
  );
}
