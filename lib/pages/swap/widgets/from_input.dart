import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gainx/components/app_token.dart';
import 'package:gainx/core/services/stats_service/models.dart';
import 'package:gainx/core/utils/input_formatter.dart';
import 'package:gainx/core/utils/number_formatter.dart';
import 'package:gainx/core/utils/theme_utils.dart';
import 'package:gainx/pages/swap/blocs/swap/swap_bloc.dart';
import 'package:gainx/pages/swap/blocs/user_stats_cubit/user_stats_cubit.dart';
import 'package:intl/intl.dart';

class SwapFromInput extends HookWidget {
  const SwapFromInput({
    required this.stats,
    super.key,
  });

  final UserStats stats;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: '0');

    return BlocListener<SwapBloc, SwapState>(
      listenWhen: (previous, current) {
        return previous.submitSwapStatus == SubmitSwapStatus.inProgress &&
            current.submitSwapStatus == SubmitSwapStatus.idle &&
            previous.fromValue > 0 &&
            current.fromValue == 0;
      },
      listener: (context, state) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          controller.text = '0';
        });
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.colorScheme.outlineVariant,
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsetsGeometry.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: const Color(0xff121314),
                      borderRadius: BorderRadiusGeometry.circular(80),
                    ),
                    child: const SizedBox(
                      width: 133,
                      child: Padding(
                        padding: EdgeInsetsGeometry.fromLTRB(8, 8, 0, 8),
                        child: AppToken(
                          src: 'assets/icons/tether.png',
                          name: 'RZ USD',
                        ),
                      ),
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Balance: ',
                      children: [
                        TextSpan(
                          text:
                              '${AppNumberFormatter.format(stats.balance, decimal: 2)}'
                              ' USD',
                          style: const TextStyle(
                            fontFamily: 'CentraNo1-Medium',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ],
                    ),
                    style: TextStyle(
                      fontFamily: 'CentraNo1-Book',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: context.colorExtension.neutral[400],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              BlocSelector<UserStatsCubit, UserStatsState, UserStage>(
                selector: (state) {
                  final stage = (state as UserStatsSuccessState).selectedStage;
                  return stage;
                },
                builder: (context, stage) {
                  return BlocSelector<SwapBloc, SwapState, String?>(
                    selector: (state) {
                      if (state.fromValue == 0) {
                        return null;
                      }

                      if (state.fromValue > stage.max) {
                        return 'Maximum buy amount is '
                            // ignore: lines_longer_than_80_chars
                            '${AppNumberFormatter.format(stage.max, decimal: 2)}';
                      } else if (state.fromValue < stage.min) {
                        return 'Minimum buy amount is '
                            // ignore: lines_longer_than_80_chars
                            '${AppNumberFormatter.format(stage.min, decimal: 2)}';
                      }
                      return null;
                    },
                    builder: (context, errorMessage) {
                      return TextFormField(
                        style: const TextStyle(
                          fontFamily: 'CentraNo1-Medium',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffffffff),
                        ),
                        controller: controller,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        inputFormatters: [
                          SwapAmountFormatter(
                            max: '${stats.balance}',
                            maxDecimals: 12,
                          ),
                        ],
                        cursorHeight: 24,
                        decoration: InputDecoration(
                          errorText: errorMessage,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 12),
                          suffixIcon: TextButton(
                            onPressed: () {
                              controller.text = '${stats.balance}';
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: context.colorExtension.neutral,
                            ),
                            child: const Text('Max'),
                          ),
                        ),
                        onChanged: (value) {
                          final amount = NumberFormat().tryParse(value) ?? 0;

                          context.read<SwapBloc>().add(
                              SwapFromValueChanged(value: amount.toDouble()));
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
