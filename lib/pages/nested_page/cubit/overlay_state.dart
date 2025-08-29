part of 'overlay_cubit.dart';

class AppOverlayState with EquatableMixin {
  AppOverlayState({
    this.isAppLocked = false,
  });

  final bool isAppLocked;

  @override
  List<Object> get props => [isAppLocked];

  AppOverlayState copyWith({
    bool? isAppLocked,
  }) {
    return AppOverlayState(
      isAppLocked: isAppLocked ?? this.isAppLocked,
    );
  }
}
