part of 'order_action_bloc.dart';

@freezed
class OrderActionEvent with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class OrderActionDropped extends OrderActionEvent {
  OrderActionDropped({
    required this.id,
  });

  final String id;

  @override
  List<Object?> get props => [id];
}
