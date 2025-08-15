import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gainx/core/services/orders_service/models.dart';
import 'package:gainx/core/utils/theme_utils.dart';
import 'package:gainx/pages/swap/blocs/user_stats_cubit/user_stats_cubit.dart';
import 'package:gainx/pages/swap/orders/cubit/open_orders_cubit.dart';
import 'package:gainx/pages/swap/orders/widgets/bloc/order_action_bloc.dart';

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
      ),
      child: _OrderActions(
        order: order,
      ),
    );
  }
}

class _OrderActions extends StatelessWidget {
  const _OrderActions({
    required this.order,
  });

  final HistoryOrder order;

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderActionBloc, OrderActionState>(
      listenWhen: (p, c) => p.updateTime != c.updateTime,
      listener: (_, __) {
        context.read<UserStatsCubit>().fetch(skipLoading: true);
        context.read<OpenOrdersCubit>().getOrders();
      },
      child: Row(
        spacing: 16,
        children: [
          Expanded(
            child: BlocSelector<OrderActionBloc, OrderActionState, bool>(
              selector: (state) {
                return state.dropOrderStatus == DropOrderStatus.inProgress;
              },
              builder: (context, isInProgress) {
                return OutlinedButton(
                  onPressed: isInProgress
                      ? null
                      : () {
                          context
                              .read<OrderActionBloc>()
                              .add(OrderActionDropped(id: order.id));
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
                      ? const SizedBox.square(
                          dimension: 20,
                          child: CircularProgressIndicator.adaptive(),
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
            child: FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                side: BorderSide(
                  color: context.colorScheme.primary,
                ),
                minimumSize: const Size.fromHeight(32),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(8),
                ),
              ),
              child: const Text(
                'Pay',
                style: TextStyle(
                  fontFamily: 'CentraNo1-Book',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
