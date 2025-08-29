import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'overlay_state.dart';

class OverlayCubit extends Cubit<AppOverlayState> {
  OverlayCubit() : super(AppOverlayState());

  // ignore: avoid_positional_boolean_parameters
  void isLock(bool isLock) {
    emit(
      state.copyWith(
        isAppLocked: isLock,
      ),
    );
  }
}
