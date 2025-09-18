import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gainx/core/services/stats_service/models.dart';
import 'package:gainx/core/utils/number_formatter.dart';
import 'package:gainx/core/utils/theme_utils.dart';
import 'package:gainx/pages/swap/blocs/swap/swap_bloc.dart';
import 'package:gainx/pages/swap/blocs/user_stats_cubit/user_stats_cubit.dart';
import 'package:toastification/toastification.dart';

class SubmitSwap extends StatelessWidget {
  const SubmitSwap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<UserStatsCubit, UserStatsState, UserStage>(
      selector: (state) {
        final stage = (state as UserStatsSuccessState).selectedStage;
        return stage;
      },
      builder: (context, stage) {
        return BlocListener<SwapBloc, SwapState>(
          listenWhen: (previous, current) {
            return previous.fromValue != current.fromValue;
          },
          listener: (context, state) {
            if (state.fromValue == 0) {
              return;
            }

            if (state.fromValue > stage.max) {
              toastification.show(
                style: ToastificationStyle.fillColored,
                type: ToastificationType.error,
                title: Text('Maximum buy amount in ${stage.value} stage is '
                    '${AppNumberFromatter.format(stage.max, decimal: 2)}'),
                borderRadius: BorderRadius.circular(6),
                autoCloseDuration: const Duration(seconds: 4),
              );
            } else if (state.fromValue < stage.min) {
              toastification.show(
                style: ToastificationStyle.fillColored,
                type: ToastificationType.error,
                title: Text('Minimum  buy amount in ${stage.value} stage is '
                    '${AppNumberFromatter.format(stage.min, decimal: 2)}'),
                borderRadius: BorderRadius.circular(6),
                autoCloseDuration: const Duration(seconds: 4),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: BlocSelector<SwapBloc, SwapState, bool>(
              selector: (state) {
                return state.selectedToken != null &&
                    state.swapPayOfTime != null &&
                    state.fromValue > 0 &&
                    state.fromValue <= stage.max &&
                    state.fromValue >= stage.min &&
                    (state.selectedToken != null &&
                        state.selectedToken!.quantity >=
                            (state.fromValue / state.selectedToken!.price));
              },
              builder: (context, isValid) {
                return BlocSelector<SwapBloc, SwapState, (bool, double, int?)>(
                  selector: (state) {
                    return (
                      state.submitSwapStatus == SubmitSwapStatus.inProgress,
                      state.fromValue,
                      state.swapPayOfTime?.month,
                    );
                  },
                  builder: (context, state) {
                    final isInProgress = state.$1;
                    final value = state.$2;
                    final month = state.$3;

                    return Column(
                      spacing: 24,
                      children: [
                        if (month != null && value > 0)
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: context.colorScheme.outlineVariant,
                              borderRadius: BorderRadiusGeometry.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsGeometry.all(16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${AppNumberFromatter.format(value + (stage.feePercent * month))} RZUSD',
                                    style: const TextStyle(
                                      fontFamily: 'CentraNo1-Medium',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                  Text(
                                    'Final Price',
                                    style: TextStyle(
                                      fontFamily: 'CentraNo1-Book',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: context.colorExtension.neutral,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        FilledButton(
                          style: FilledButton.styleFrom(
                            foregroundColor: Colors.white,
                          ),
                          onPressed: isInProgress || !isValid
                              ? null
                              : () {
                                  final selectedStage = (context
                                          .read<UserStatsCubit>()
                                          .state as UserStatsSuccessState)
                                      .selectedStage;

                                  context.read<SwapBloc>().add(
                                        SwapSubmited(
                                          selectedStage: selectedStage.value,
                                        ),
                                      );
                                },
                          child: isInProgress
                              ? const SizedBox.square(
                                  dimension: 24,
                                  child: CircularProgressIndicator.adaptive(
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.white),
                                  ))
                              : const Text(
                                  'Swap',
                                  style: TextStyle(
                                    fontFamily: 'CentraNo1-Medium',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
