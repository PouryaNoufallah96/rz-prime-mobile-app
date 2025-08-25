import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gainx/core/utils/number_formatter.dart';
import 'package:gainx/core/utils/theme_utils.dart';
import 'package:gainx/pages/swap/blocs/swap/swap_bloc.dart';
import 'package:gainx/pages/swap/widgets/price_per_unit/bloc/price_per_unit_bloc.dart';

class PricePerUnit extends StatelessWidget {
  const PricePerUnit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PricePerUnitBloc(
        ordersService: context.read(),
      ),
      child: const _Body(),
    );
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
        context.read<PricePerUnitBloc>().add(PricePerUnitChanged(
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
    return BlocBuilder<PricePerUnitBloc, PricePerUnitState>(
      builder: (context, state) {
        if (state is! PricePerUnitStateSuccessState) {
          return const _Loading();
        }

        return Text(
          '\$${AppNumberFromatter.format(state.effectivePrice)}',
          style: TextStyle(
            fontFamily: 'CentraNo1-Book',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: context.colorExtension.neutral[300],
          ),
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
