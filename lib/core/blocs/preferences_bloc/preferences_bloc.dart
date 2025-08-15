import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'preferences_bloc.g.dart';
part 'preferences_event.dart';
part 'preferences_state.dart';

class PreferencesBloc extends HydratedBloc<PreferencesEvent, PreferencesState> {
  PreferencesBloc() : super(const PreferencesState()) {
    on<PreferencesThemeToggled>(_onPreferencesThemeToggled);
    on<PreferencesOnBoardingPassed>(_onPreferencesOnBoardingPassed);
  }

  void _onPreferencesThemeToggled(
    PreferencesThemeToggled _,
    Emitter<PreferencesState> emit,
  ) {
    emit(state.copyWith(isDark: !state.isDark));
  }

  void _onPreferencesOnBoardingPassed(
    PreferencesOnBoardingPassed _,
    Emitter<PreferencesState> emit,
  ) {
    emit(state.copyWith(isOnBoardingPass: !state.isOnBoardingPass));
  }

  @override
  PreferencesState? fromJson(Map<String, dynamic> json) {
    return PreferencesState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(PreferencesState state) {
    return state.toJson();
  }
}
