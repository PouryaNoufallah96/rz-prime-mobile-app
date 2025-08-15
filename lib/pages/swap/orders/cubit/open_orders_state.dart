part of 'open_orders_cubit.dart';

sealed class OpenOrdersState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class OpenOrdersInitialState extends OpenOrdersState {}

class OpenOrdersInProgressState extends OpenOrdersState {}

class OpenOrdersSuccessState extends OpenOrdersState {
  OpenOrdersSuccessState({required this.orders});

  final List<HistoryOrder> orders;

  @override
  List<Object?> get props => [orders];
}
