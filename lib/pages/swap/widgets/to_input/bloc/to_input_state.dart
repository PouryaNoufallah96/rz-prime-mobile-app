part of 'to_input_bloc.dart';

sealed class ToInputState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class ToInputStateInitialState extends ToInputState {}

class ToInputStateInProgressState extends ToInputState {}

class ToInputStateSuccessState extends ToInputState {
  ToInputStateSuccessState({required this.price});

  final double price;

  @override
  List<Object?> get props => [price];
}
