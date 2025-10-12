import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gainx/core/blocs/cubit/health_status_cubit.dart';
import 'package:gainx/core/services/stats_service/models.dart';
import 'package:gainx/core/utils/number_formatter.dart';
import 'package:gainx/core/utils/theme_utils.dart';
import 'package:gainx/pages/swap/blocs/swap/swap_bloc.dart';
import 'package:gainx/pages/swap/blocs/user_stats_cubit/user_stats_cubit.dart';
import 'package:toastification/toastification.dart';

class SubmitSwap extends StatelessWidget {
  const SubmitSwap({
    required this.isVerified,
    super.key,
  });

  final bool isVerified;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HealthStatusCubit>().state.status;

    final canShowAction = state?.checked ?? false;
    final message = state?.message;

    return BlocSelector<UserStatsCubit, UserStatsState, UserStage?>(
      selector: (state) {
        if (state is! UserStatsSuccessState) {
          return null;
        }

        return state.selectedStage;
      },
      builder: (context, stage) {
        if (stage == null) {
          return const SizedBox();
        }

        return BlocSelector<SwapBloc, SwapState, bool>(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${AppNumberFormatter.format(value * (1 + (stage.feePercent * month)), maxDecimal: 4)} RZ USD',
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                            foregroundColor: Colors.white,
                            minimumSize: const Size.fromHeight(40)),
                        onPressed: isInProgress || !isValid
                            ? null
                            : () {
                                if (!isVerified) {
                                  toastification.show(
                                    style: ToastificationStyle.fillColored,
                                    type: ToastificationType.error,
                                    title: Text(!canShowAction
                                        ? message ?? ''
                                        :
                                        // ignore: lines_longer_than_80_chars
                                        'To submit new orders and view your order history, please connect your wallet in Settings.'),
                                    borderRadius: BorderRadius.circular(6),
                                    autoCloseDuration:
                                        const Duration(seconds: 4),
                                  );

                                  return;
                                }

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
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
