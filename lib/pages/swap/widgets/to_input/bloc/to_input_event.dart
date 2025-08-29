part of 'to_input_bloc.dart';

sealed class ToInputEvent with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class ToInputChanged extends ToInputEvent {
  ToInputChanged({
    required this.asset,
    required this.value,
  });

  final String? asset;
  final double value;

  @override
  List<Object?> get props => [asset, value];
}
