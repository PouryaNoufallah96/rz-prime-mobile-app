part of 'inventory_bloc.dart';

sealed class InventoryState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class InventoryInitialState extends InventoryState {}

class InventoryInProgressState extends InventoryState {}

class InventorySuccessState extends InventoryState {
  InventorySuccessState({required this.inventories});

  final List<InventoryModel> inventories;

  @override
  List<Object?> get props => [inventories];
}
