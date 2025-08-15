part of 'order_action_bloc.dart';

enum DropOrderStatus { idle, inProgress }

@freezed
class OrderActionState with EquatableMixin {
  OrderActionState({
    this.updateTime = 0,
    this.dropOrderStatus = DropOrderStatus.idle,
  });

  final DropOrderStatus dropOrderStatus;
  final int updateTime;

  @override
  List<Object?> get props => [dropOrderStatus, updateTime];

  OrderActionState copyWith({
    DropOrderStatus? dropOrderStatus,
    int? updateTime,
  }) {
    return OrderActionState(
      dropOrderStatus: dropOrderStatus ?? this.dropOrderStatus,
      updateTime: updateTime ?? this.updateTime,
    );
  }
}
