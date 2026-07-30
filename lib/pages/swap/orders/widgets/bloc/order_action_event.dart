part of 'order_action_bloc.dart';

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

class OrderActionPayed extends OrderActionEvent {
  OrderActionPayed({
    required this.id,
  });

  final String id;

  @override
  List<Object?> get props => [id];
}
