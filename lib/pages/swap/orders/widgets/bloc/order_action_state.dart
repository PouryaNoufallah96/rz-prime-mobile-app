part of 'order_action_bloc.dart';

enum DropOrderStatus { idle, inProgress }

enum PayOrderStatus { idle, inProgress }

class OrderActionState with EquatableMixin {
  OrderActionState({
    this.updateTime = 0,
    this.dropOrderStatus = DropOrderStatus.idle,
    this.payOrderStatus = PayOrderStatus.idle,
    this.isOrderCompeleted,
  });

  final DropOrderStatus dropOrderStatus;
  final PayOrderStatus payOrderStatus;
  final int updateTime;
  final bool? isOrderCompeleted;

  @override
  List<Object?> get props =>
      [dropOrderStatus, updateTime, payOrderStatus, isOrderCompeleted];

  OrderActionState copyWith({
    DropOrderStatus? dropOrderStatus,
    PayOrderStatus? payOrderStatus,
    int? updateTime,
    bool? Function()? isOrderCompeleted,
  }) {
    return OrderActionState(
        payOrderStatus: payOrderStatus ?? this.payOrderStatus,
        dropOrderStatus: dropOrderStatus ?? this.dropOrderStatus,
        updateTime: updateTime ?? this.updateTime,
        isOrderCompeleted: isOrderCompeleted == null
            ? this.isOrderCompeleted
            : isOrderCompeleted());
  }
}
