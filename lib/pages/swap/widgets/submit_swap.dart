import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gainx/pages/swap/blocs/swap/swap_bloc.dart';
import 'package:gainx/pages/swap/blocs/user_stats_cubit/user_stats_cubit.dart';

class SubmitSwap extends StatelessWidget {
  const SubmitSwap({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: BlocSelector<SwapBloc, SwapState, bool>(
        selector: (state) {
          return state.selectedToken != null &&
              state.swapPayOfTime != null &&
              state.fromValue > 0;
        },
        builder: (context, isValid) {
          return BlocSelector<SwapBloc, SwapState, bool>(
            selector: (state) {
              return state.submitSwapStatus == SubmitSwapStatus.inProgress;
            },
            builder: (context, isInProgress) {
              return FilledButton(
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
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ))
                    : const Text(
                        'Swap',
                        style: TextStyle(
                          fontFamily: 'CentraNo1-Medium',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
              );
            },
          );
        },
      ),
    );
  }
}
