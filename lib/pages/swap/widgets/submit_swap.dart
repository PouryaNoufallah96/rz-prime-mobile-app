// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gainx/core/blocs/campaign/campaign_cubit.dart';
import 'package:gainx/core/blocs/cubit/health_status_cubit.dart';
import 'package:gainx/core/services/campaign/models.dart';
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
                      _PriceBreakdown(
                        value: value,
                        feeRate: stage.feePercent * month,
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          foregroundColor: Colors.white,
                          minimumSize: const Size.fromHeight(40),
                        ),
                        onPressed: isInProgress || !isValid
                            ? null
                            : () {
                                if (!isVerified) {
                                  toastification.show(
                                    style: ToastificationStyle.fillColored,
                                    type: ToastificationType.error,
                                    title: Text(
                                      !canShowAction
                                          ? message ?? ''
                                          : 'To submit new orders and view your order history, please connect your wallet in Settings.',
                                    ),
                                    borderRadius: BorderRadius.circular(6),
                                    autoCloseDuration: const Duration(
                                      seconds: 4,
                                    ),
                                  );

                                  return;
                                }

                                final selectedStage =
                                    (context.read<UserStatsCubit>().state
                                            as UserStatsSuccessState)
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
                                  valueColor: AlwaysStoppedAnimation(
                                    Colors.white,
                                  ),
                                ),
                              )
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

class _PriceBreakdown extends StatelessWidget {
  const _PriceBreakdown({
    required this.value,
    required this.feeRate,
  });

  final double value;
  final double feeRate;

  @override
  Widget build(BuildContext context) {
    final feeAmount = value * feeRate;
    final baseFinal = value * (1 + feeRate);

    final campaign = context.watch<CampaignCubit>().state;
    final hasPromo = campaign != null && campaign.appliesTo(baseFinal);
    final discount = hasPromo ? campaign.discountPercentage : 0.0;
    final finalPrice = hasPromo ? baseFinal * (1 - discount / 100) : baseFinal;
    final discountLabel = discount == discount.roundToDouble()
        ? discount.toStringAsFixed(0)
        : '$discount';

    final labelStyle = TextStyle(
      fontFamily: 'CentraNo1-Book',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: context.colorExtension.neutral[300],
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.outlineVariant,
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsetsGeometry.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${AppNumberFormatter.format(feeAmount, maxDecimal: 4)} USDT',
                  style: labelStyle,
                ),
                Text.rich(
                  TextSpan(
                    text: 'Fee',
                    style: labelStyle,
                    children: [
                      TextSpan(
                        text:
                            '(${AppNumberFormatter.format(feeRate * 100, maxDecimal: 2)}%)',
                        style: TextStyle(color: context.colorScheme.primary),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (hasPromo) ...[
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Promo', style: labelStyle),
                  Text(
                    '$discountLabel% OFF applied',
                    style: TextStyle(
                      fontFamily: 'CentraNo1-Medium',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      height: 1,
                      color: context.colorExtension.promo[200],
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${AppNumberFormatter.format(finalPrice, maxDecimal: 4)} USDT',
                  style: const TextStyle(
                    fontFamily: 'CentraNo1-Medium',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffffffff),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (hasPromo)
                      Text(
                        '${AppNumberFormatter.format(baseFinal, maxDecimal: 4)} USDT',
                        style: TextStyle(
                          fontFamily: 'CentraNo1-Book',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1,
                          color: context.colorExtension.neutral,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    Text(
                      'Final Price',
                      style: TextStyle(
                        fontFamily: 'CentraNo1-Book',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1,
                        color: context.colorExtension.promo[200],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
