part of 'price_per_unit_bloc.dart';

sealed class PricePerUnitEvent with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class PricePerUnitChanged extends PricePerUnitEvent {
  PricePerUnitChanged({
    required this.asset,
    required this.value,
  });

  final String? asset;
  final double value;

  @override
  List<Object?> get props => [asset, value];
}
