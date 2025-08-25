part of 'swap_bloc.dart';

class SwapEvent with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class SwapSelectedTokenChanged extends SwapEvent {
  SwapSelectedTokenChanged({
    required this.inventory,
  });

  final InventoryModel inventory;

  @override
  List<Object?> get props => [inventory];
}

class SwapInventoryUpdated extends SwapEvent {
  SwapInventoryUpdated({
    required this.inventories,
  });

  final List<InventoryModel> inventories;

  @override
  List<Object?> get props => [inventories];
}

class SwapPayOfTimeChanged extends SwapEvent {
  SwapPayOfTimeChanged({
    required this.payOfTime,
  });

  final SwapPayOfTime payOfTime;

  @override
  List<Object?> get props => [payOfTime];
}

class SwapFromValueChanged extends SwapEvent {
  SwapFromValueChanged({
    required this.value,
  });

  final double value;

  @override
  List<Object?> get props => [value];
}

class SwapSubmited extends SwapEvent {
  @override
  List<Object?> get props => [];
}
