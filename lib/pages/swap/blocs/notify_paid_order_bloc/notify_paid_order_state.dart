part of 'notify_paid_order_bloc.dart';

class NotifyPaidOrderState with EquatableMixin {
  NotifyPaidOrderState({
    this.lastUpdated,
  });

  final int? lastUpdated;

  @override
  List<Object?> get props => [lastUpdated];
}
