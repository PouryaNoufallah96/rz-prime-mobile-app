import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gainx/core/blocs/cubit/health_status_cubit.dart';
import 'package:gainx/core/services/orders_service/models.dart';
import 'package:gainx/core/utils/theme_utils.dart';
import 'package:gainx/pages/history/cubit/finalize_order_cubit.dart';
import 'package:gainx/pages/swap/blocs/user_stats_cubit/user_stats_cubit.dart';
import 'package:gainx/pages/swap/orders/cubit/open_orders_cubit.dart';
import 'package:gainx/pages/swap/orders/widgets/bloc/order_action_bloc.dart';
import 'package:lottie/lottie.dart';

class OrderActions extends HookWidget {
  const OrderActions({
    required this.order,
    super.key,
  });

  final HistoryOrder order;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderActionBloc(
        ordersService: context.read(),
        transactionService: context.read(),
        reownService: context.read(),
      ),
      child: _OrderActions(
        order: order,
      ),
    );
  }
}

class _OrderActions extends StatefulWidget {
  const _OrderActions({
    required this.order,
  });

  final HistoryOrder order;

  @override
  State<_OrderActions> createState() => _OrderActionsState();
}

class _OrderActionsState extends State<_OrderActions> {
  OverlayEntry? _entry;

  void _hideOverlay() {
    _entry?.remove();
    _entry = null;
  }

  @override
  void dispose() {
    _hideOverlay();
    super.dispose();
  }

  void _showOverlay() {
    if (_entry != null) return;
    final overlay = Overlay.of(context, rootOverlay: true);

    _entry = OverlayEntry(
      builder: (_) => Stack(
        children: [
          Positioned.fill(
            child: IgnorePointer(
              ignoring: false,
              child: Container(color: const Color(0x99000000)),
            ),
          ),
          Positioned.fill(
            child: Center(
              child: HookBuilder(builder: (context) {
                final cont = useAnimationController();

                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Material(
                    elevation: 12,
                    borderRadius: BorderRadius.circular(12),
                    clipBehavior: Clip.antiAlias,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 360),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          spacing: 12,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 120,
                              child: Lottie.asset(
                                'assets/images/animation.json',
                                controller: cont,
                                onLoaded: (p0) {
                                  cont
                                    ..duration = p0.duration
                                    ..forward();
                                },
                              ),
                            ),
                            const Text(
                              'Your transaction is being processed.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'CentraNo1-Medium',
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Text(
                              'This may take a few moments.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'CentraNo1-Book',
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );

    overlay.insert(_entry!);
  }

  @override
  Widget build(BuildContext context) {
    final canShowAction =
        context.watch<HealthStatusCubit>().state.status?.checked ?? false;

    final message = context.watch<HealthStatusCubit>().state.status?.message;

    return MultiBlocListener(
      listeners: [
        BlocListener<OrderActionBloc, OrderActionState>(
          listener: (_, state) {
            if (state.payOrderStatus == PayOrderStatus.inProgress) {
              _showOverlay();
            } else {
              _hideOverlay();
            }
          },
        ),
        BlocListener<OrderActionBloc, OrderActionState>(
          listenWhen: (p, c) => p.updateTime != c.updateTime,
          listener: (_, state) {
            context.read<UserStatsCubit>().fetch(skipLoading: true);
            context.read<OpenOrdersCubit>().getOrdersAndCheck(
                  isOrderCompeleted: state.isOrderCompeleted,
                );
            context.read<FinalizeOrderCubit>().getOrders();
          },
        ),
      ],
      child: Column(
        spacing: 8,
        children: [
          Row(
            spacing: 16,
            children: [
              Expanded(
                child: BlocSelector<OrderActionBloc, OrderActionState,
                    (bool isInProgress, bool isLocked)>(
                  selector: (state) {
                    return (
                      state.dropOrderStatus == DropOrderStatus.inProgress,
                      state.payOrderStatus == PayOrderStatus.inProgress
                    );
                  },
                  builder: (context, state) {
                    final isInProgress = state.$1;
                    final isLocked = state.$2;

                    return OutlinedButton(
                      onPressed: !canShowAction || isInProgress || isLocked
                          ? null
                          : () {
                              context.read<OrderActionBloc>().add(
                                  OrderActionDropped(id: widget.order.orderId));
                            },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: context.colorScheme.primary,
                        ),
                        minimumSize: const Size.fromHeight(32),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(8),
                        ),
                      ),
                      child: isInProgress
                          ? SizedBox.square(
                              dimension: 20,
                              child: CircularProgressIndicator.adaptive(
                                valueColor: AlwaysStoppedAnimation(
                                  context.colorScheme.primary,
                                ),
                              ),
                            )
                          : Text(
                              'Drop',
                              style: TextStyle(
                                fontFamily: 'CentraNo1-Book',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: context.colorScheme.primary,
                              ),
                            ),
                    );
                  },
                ),
              ),
              Expanded(
                child: BlocSelector<OrderActionBloc, OrderActionState,
                    (bool isInProgress, bool isLocked)>(
                  selector: (state) {
                    return (
                      state.payOrderStatus == PayOrderStatus.inProgress,
                      state.dropOrderStatus == DropOrderStatus.inProgress,
                    );
                  },
                  builder: (context, state) {
                    final isInProgress = state.$1;
                    final isLocked = state.$2;

                    return FilledButton(
                      onPressed: !canShowAction || isInProgress || isLocked
                          ? null
                          : () {
                              context.read<OrderActionBloc>().add(
                                    OrderActionPayed(
                                      id: widget.order.orderId,
                                      amount: widget.order.finalAmount,
                                    ),
                                  );
                            },
                      style: FilledButton.styleFrom(
                        side: BorderSide(
                          color: context.colorScheme.primary,
                        ),
                        minimumSize: const Size.fromHeight(32),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(8),
                        ),
                      ),
                      child: isInProgress
                          ? const SizedBox.square(
                              dimension: 20,
                              child: CircularProgressIndicator.adaptive(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              ),
                            )
                          : const Text(
                              'Pay',
                              style: TextStyle(
                                fontFamily: 'CentraNo1-Book',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                    );
                  },
                ),
              ),
            ],
          ),
          if (message != null && !canShowAction)
            Text(
              message,
              style: TextStyle(
                fontFamily: 'CentraNo1-Book',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: context.colorScheme.primary,
              ),
            ),
        ],
      ),
    );
  }
}
