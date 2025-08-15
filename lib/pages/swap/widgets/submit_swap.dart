import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gainx/pages/swap/blocs/swap/swap_bloc.dart';

class SubmitSwap extends StatelessWidget {
  const SubmitSwap({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: BlocSelector<SwapBloc, SwapState, bool>(
        selector: (state) {
          return state.submitSwapStatus == SubmitSwapStatus.inProgress;
        },
        builder: (context, isInProgress) {
          return FilledButton(
            style: FilledButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            onPressed: isInProgress
                ? null
                : () {
                    context.read<SwapBloc>().add(SwapSubmited());
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
      ),
    );
  }
}
