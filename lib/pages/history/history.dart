import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gainx/core/services/orders_service/models.dart';
import 'package:gainx/core/utils/number_formatter.dart';
import 'package:gainx/core/utils/theme_utils.dart';
import 'package:gainx/pages/history/cubit/finalize_order_cubit.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Body();
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 23),
          child: Text(
            'Transaction',
            style: TextStyle(
              fontFamily: 'CentraNo1-Bold',
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: BlocBuilder<FinalizeOrderCubit, FinalizeOrderState>(
            builder: (context, state) {
              return switch (state) {
                FinalizeOrderInitialState _ => const SizedBox.shrink(),
                FinalizeOrderInProgressState _ => const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                FinalizeOrderSuccessState(:final orders) =>
                  _Orders(orders: orders),
              };
            },
          ),
        ),
      ],
    );
  }
}

class _Orders extends StatelessWidget {
  const _Orders({
    required this.orders,
  });

  final List<HistoryOrder> orders;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () => context.read<FinalizeOrderCubit>().getOrders(),
        child: ListView.separated(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
          separatorBuilder: (context, index) {
            return const SizedBox(height: 16);
          },
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return _Order(order: order);
          },
        ));
  }
}

class _Order extends StatelessWidget {
  const _Order({
    required this.order,
  });

  final HistoryOrder order;

  @override
  Widget build(BuildContext context) {
    final isDropped = order.state == HistoryOrderState.drop;

    final statusColor = isDropped
        ? context.colorExtension.error
        : context.colorExtension.success;

    final finalAmount = AppNumberFromatter.format(order.finalAmount);
    final loanAmount = AppNumberFromatter.format(order.loanAmount, decimal: 0);

    String date(DateTime dateTime) {
      final datePart = DateFormat('MMM d').format(dateTime);
      final timePart = DateFormat('h:mm a').format(dateTime).toLowerCase();

      return '$datePart at $timePart from this device';
    }

    return DecoratedBox(
      decoration: BoxDecoration(
          color: const Color(0xff202023),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsetsGeometry.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date(DateTime.parse(order.payOffDate).toLocal()),
              style: TextStyle(
                fontFamily: 'CentraNo1-Book',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: context.colorExtension.neutral[300],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: statusColor,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Center(
                      child: SvgPicture.asset(
                        switch (isDropped) {
                          true => 'assets/icons/arrow-down-left.svg',
                          false => 'assets/icons/arrow-up-right.svg',
                        },
                        height: 16,
                        width: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        order.tokenName,
                        style: const TextStyle(
                          fontFamily: 'CentraNo1-Medium',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        isDropped ? 'Dropped' : 'Confirmed',
                        style: TextStyle(
                          fontFamily: 'CentraNo1-Medium',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: statusColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$$finalAmount',
                      style: const TextStyle(
                        fontFamily: 'CentraNo1-Medium',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '$loanAmount USDT',
                      style: TextStyle(
                        fontFamily: 'CentraNo1-Medium',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: context.colorExtension.neutral,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
