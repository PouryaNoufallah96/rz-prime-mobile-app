part of 'order_action_bloc.dart';

enum DropOrderStatus { idle, inProgress }

enum PayOrderStatus { idle, inProgress }

@freezed
class OrderActionState with EquatableMixin {
  OrderActionState({
    this.updateTime = 0,
    this.dropOrderStatus = DropOrderStatus.idle,
    this.payOrderStatus = PayOrderStatus.idle,
  });

  final DropOrderStatus dropOrderStatus;
  final PayOrderStatus payOrderStatus;
  final int updateTime;

  @override
  List<Object?> get props => [dropOrderStatus, updateTime, payOrderStatus];

  OrderActionState copyWith({
    DropOrderStatus? dropOrderStatus,
    PayOrderStatus? payOrderStatus,
    int? updateTime,
  }) {
    return OrderActionState(
      payOrderStatus: payOrderStatus ?? this.payOrderStatus,
      dropOrderStatus: dropOrderStatus ?? this.dropOrderStatus,
      updateTime: updateTime ?? this.updateTime,
    );
  }
}
