part of 'inventory_bloc.dart';

@freezed
class InventoryEvent with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class InventoryStartedEvent extends InventoryEvent {}
