part of 'finalize_order_cubit.dart';

sealed class FinalizeOrderState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class FinalizeOrderInitialState extends FinalizeOrderState {}

class FinalizeOrderInProgressState extends FinalizeOrderState {}

class FinalizeOrderSuccessState extends FinalizeOrderState {
  FinalizeOrderSuccessState({required this.orders});

  final List<HistoryOrder> orders;

  @override
  List<Object?> get props => [orders];
}
