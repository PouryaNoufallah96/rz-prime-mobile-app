import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gainx/core/services/orders_service/models.dart';
import 'package:gainx/core/services/reown/reown.dart';
import 'package:gainx/core/utils/number_formatter.dart';
import 'package:gainx/core/utils/theme_utils.dart';
import 'package:gainx/pages/history/cubit/finalize_order_cubit.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

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
              return switch (state.loadingStaus) {
                FinalizeOrderLoadingStatus.idle => const SizedBox.shrink(),
                FinalizeOrderLoadingStatus.inProgress => const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                FinalizeOrderLoadingStatus.success =>
                  _Orders(orders: state.orders),
                _ => const _Orders(orders: []),
              };
            },
          ),
        ),
      ],
    );
  }
}

class _Orders extends HookWidget {
  const _Orders({
    required this.orders,
  });

  final List<HistoryOrder> orders;

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    useEffect(() {
      void onScroll() {
        bool isBottom() {
          if (!scrollController.hasClients) return false;
          final maxScroll = scrollController.position.maxScrollExtent;
          final currentScroll = scrollController.offset;
          return currentScroll >= (maxScroll * 0.9);
        }

        if (isBottom()) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<FinalizeOrderCubit>().nextPage();
          });
        }
      }

      scrollController.addListener(onScroll);

      return () => scrollController.removeListener(onScroll);
    }, []);

    return RefreshIndicator(
      onRefresh: () => context.read<FinalizeOrderCubit>().getOrders(),
      child: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          SliverList.separated(
            separatorBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: SizedBox(height: 16),
              );
            },
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: _Order(order: order),
              );
            },
          ),
          SliverToBoxAdapter(
            child: BlocSelector<FinalizeOrderCubit, FinalizeOrderState, bool>(
              selector: (state) {
                return state.loadingMoreStatus ==
                    FinalizeOrderLoadingStatus.inProgress;
              },
              builder: (context, state) {
                if (!state) {
                  return const SizedBox.shrink();
                }

                return const Padding(
                  padding: EdgeInsets.all(24),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
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
            Row(
              children: [
                if (order.transactionsMetaData.isNotEmpty) ...[
                  InkWell(
                    onTap: () async {
                      final explorer = context
                          .read<ReownService>()
                          .appKitModal
                          .selectedChain
                          ?.explorerUrl;

                      if (explorer == null) {
                        return;
                      }

                      final uri = Uri.parse(
                          '$explorer/tx/${order.transactionsMetaData.first.hash}');
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri);
                      }
                    },
                    child: Text(
                      order.transactionsMetaData.first.hash.substring(0, 8),
                      style: TextStyle(
                        fontFamily: 'CentraNo1-Book',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: context.colorExtension.neutral[300],
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                ],
                Flexible(
                  child: Text(
                    date(DateTime.parse(order.payOffDate).toLocal()),
                    style: TextStyle(
                      fontFamily: 'CentraNo1-Book',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: context.colorExtension.neutral[300],
                    ),
                  ),
                ),
              ],
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
