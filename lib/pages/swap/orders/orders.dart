// ignore_for_file: lines_longer_than_80_chars

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gainx/components/app_token.dart';
import 'package:gainx/core/blocs/inventory/inventory_bloc.dart';
import 'package:gainx/core/utils/number_formatter.dart';
import 'package:gainx/core/utils/theme_utils.dart';
import 'package:gainx/pages/swap/orders/cubit/open_orders_cubit.dart';
import 'package:gainx/pages/swap/orders/widgets/actions.dart';
import 'package:intl/intl.dart';

class SwapOrders extends StatelessWidget {
  const SwapOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OpenOrdersCubit, OpenOrdersState>(
      builder: (context, state) {
        if (state is! OpenOrdersSuccessState) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        }

        return SliverList.separated(
          itemCount: state.orders.length,
          separatorBuilder: (context, index) {
            return const SizedBox(height: 16);
          },
          itemBuilder: (context, index) {
            final order = state.orders[index];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: context.colorScheme.outlineVariant,
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsetsGeometry.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppToken(
                            size: 34,
                            src:
                                'assets/images/${order.tokenName.toLowerCase()}.png',
                            name: order.tokenName,
                            textStyle: const TextStyle(
                              fontFamily: 'CentraNo1-Medium',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                                text: 'Pay of time: ',
                                style: TextStyle(
                                  fontFamily: 'CentraNo1-Book',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: context.colorExtension.neutral,
                                ),
                                children: [
                                  TextSpan(
                                    text: DateFormat('yyyy-MM-dd').format(
                                        DateTime.parse(order.payOffDate)),
                                    style: const TextStyle(
                                      fontFamily: 'CentraNo1-Book',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ]),
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${AppNumberFromatter.format(order.quantity, decimal: 9)}'
                            ' ${order.tokenName}',
                            style: const TextStyle(
                              fontFamily: 'CentraNo1-Medium',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '${AppNumberFromatter.format(order.loanAmount)}'
                            ' USDT',
                            style: const TextStyle(
                              fontFamily: 'CentraNo1-Medium',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${AppNumberFromatter.format(order.finalAmount)}',
                            style: const TextStyle(
                              fontFamily: 'CentraNo1-Book',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Frozen Final Price',
                            style: TextStyle(
                              fontFamily: 'CentraNo1-Book',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: context.colorExtension.neutral,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BlocSelector<InventoryBloc, InventoryState, double?>(
                            selector: (state) {
                              if (state is! InventorySuccessState) {
                                return null;
                              }

                              return state.inventories
                                      .firstWhereOrNull(
                                          (e) => e.tokenName == order.tokenName)
                                      ?.price ??
                                  0;
                            },
                            builder: (context, livePrice) {
                              if (livePrice == null) {
                                return const _Loading();
                              }

                              final price = order.quantity * livePrice;

                              Color getColor() {
                                if (price > order.finalAmount) {
                                  return context.colorExtension.success;
                                } else if (price < order.finalAmount) {
                                  return context.colorScheme.error;
                                }
                                return Colors.white;
                              }

                              return Text(
                                '\$${AppNumberFromatter.format(price)}',
                                style: TextStyle(
                                  fontFamily: 'CentraNo1-Book',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: getColor(),
                                ),
                              );
                            },
                          ),
                          Text(
                            'Total value',
                            style: TextStyle(
                              fontFamily: 'CentraNo1-Book',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: context.colorExtension.neutral,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      OrderActions(order: order)
                    ],
                  ),
                ),
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
      height: 24,
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
