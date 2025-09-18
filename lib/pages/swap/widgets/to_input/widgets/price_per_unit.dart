import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gainx/core/utils/number_formatter.dart';
import 'package:gainx/core/utils/theme_utils.dart';
import 'package:gainx/pages/swap/blocs/swap/swap_bloc.dart';
import 'package:gainx/pages/swap/widgets/to_input/bloc/to_input_bloc.dart';

class PricePerUnit extends StatelessWidget {
  const PricePerUnit({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Body();
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SwapBloc, SwapState>(
      listenWhen: (p, c) {
        return p.selectedToken != c.selectedToken || p.fromValue != c.fromValue;
      },
      listener: (context, state) {
        context.read<ToInputBloc>().add(ToInputChanged(
              asset: state.selectedToken?.tokenName,
              value: state.fromValue,
            ));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const _Price(),
          BlocSelector<SwapBloc, SwapState, String>(
            selector: (state) {
              return state.selectedToken?.tokenName ?? 'Token';
            },
            builder: (context, token) {
              return Text(
                'Price Per $token',
                style: TextStyle(
                  fontFamily: 'CentraNo1-Book',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: context.colorExtension.neutral,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class _Price extends StatelessWidget {
  const _Price();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SwapBloc, SwapState, double>(
      selector: (state) {
        return state.fromValue;
      },
      builder: (context, amount) {
        return BlocBuilder<ToInputBloc, ToInputState>(
          builder: (context, state) {
            if (state is! ToInputStateSuccessState) {
              return const _Loading();
            }

            return Text(
              '\$${AppNumberFromatter.format(amount / state.price, decimal: 2)}',
              style: TextStyle(
                fontFamily: 'CentraNo1-Book',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: context.colorExtension.neutral[300],
              ),
            );
          },
        );
      },
    );
  }
}

class _Loading extends HookWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    final controller =
        useAnimationController(duration: const Duration(seconds: 2));

    useEffect(() {
      controller.repeat(reverse: true);
      return null;
    }, []);

    final animation = ColorTween(
            begin: context.colorExtension.neutral[700],
            end: context.colorExtension.neutral[900])
        .animate(controller);

    final value = useAnimation(animation);

    return SizedBox(
      height: 18,
      width: 48,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: value,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
