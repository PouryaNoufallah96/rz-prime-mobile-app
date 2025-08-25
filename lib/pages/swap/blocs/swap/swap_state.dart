part of 'swap_bloc.dart';

enum SwapPayOfTime {
  one(1, '1 month'),
  two(2, '2 month'),
  three(3, '3 month'),
  four(4, '4 month'),
  five(5, '5 month'),
  six(6, '6 month');

  const SwapPayOfTime(this.month, this.text);

  final int month;
  final String text;
}

enum SubmitSwapStatus { idle, inProgress }

class SwapState with EquatableMixin {
  SwapState({
    required this.stats,
    String? selectedLevel,
    this.selectedToken,
    this.swapPayOfTime,
    this.fromValue = 0,
    this.submitSwapStatus = SubmitSwapStatus.idle,
  }) : selectedLevel = selectedLevel ?? stats.stage;

  final UserStats stats;
  final String selectedLevel;
  final InventoryModel? selectedToken;
  final SwapPayOfTime? swapPayOfTime;
  final double fromValue;
  final SubmitSwapStatus submitSwapStatus;

  SwapState copyWith({
    String? selectedLevel,
    InventoryModel? Function()? selectedToken,
    SwapPayOfTime? Function()? swapPayOfTime,
    double? fromValue,
    SubmitSwapStatus? submitSwapStatus,
  }) {
    return SwapState(
      submitSwapStatus: submitSwapStatus ?? this.submitSwapStatus,
      stats: stats,
      selectedLevel: selectedLevel ?? this.selectedLevel,
      selectedToken:
          selectedToken == null ? this.selectedToken : selectedToken(),
      swapPayOfTime:
          swapPayOfTime == null ? this.swapPayOfTime : swapPayOfTime(),
      fromValue: fromValue ?? this.fromValue,
    );
  }

  @override
  List<Object?> get props => [
        stats,
        selectedLevel,
        selectedToken,
        fromValue,
        swapPayOfTime,
        submitSwapStatus,
      ];
}
