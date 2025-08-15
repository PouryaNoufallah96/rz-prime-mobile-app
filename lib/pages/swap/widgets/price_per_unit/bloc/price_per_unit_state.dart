part of 'price_per_unit_bloc.dart';

sealed class PricePerUnitState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class PricePerUnitStateInitialState extends PricePerUnitState {}

class PricePerUnitStateInProgressState extends PricePerUnitState {}

class PricePerUnitStateSuccessState extends PricePerUnitState {
  PricePerUnitStateSuccessState({required this.effectivePrice});

  final double effectivePrice;

  @override
  List<Object?> get props => [effectivePrice];
}
