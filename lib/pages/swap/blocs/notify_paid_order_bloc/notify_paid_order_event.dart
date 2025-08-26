part of 'notify_paid_order_bloc.dart';

sealed class NotifyPaidOrderEvent with EquatableMixin {}

class NotifyPaidOrderStarted extends NotifyPaidOrderEvent {
  @override
  List<Object?> get props => [];
}
