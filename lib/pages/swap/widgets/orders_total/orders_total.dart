import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gainx/core/blocs/inventory/inventory_bloc.dart';
import 'package:gainx/core/utils/number_formatter.dart';
import 'package:gainx/pages/swap/orders/cubit/open_orders_cubit.dart';

class OrdersTotal extends StatelessWidget {
  const OrdersTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OpenOrdersCubit, OpenOrdersState>(
      builder: (context, orders) {
        return BlocBuilder<InventoryBloc, InventoryState>(
          builder: (context, inventory) {
            if (inventory is! InventorySuccessState ||
                orders is! OpenOrdersSuccessState) {
              return const SizedBox.shrink();
            }

            final prices = Map.fromIterables(
                inventory.inventories.map((e) => e.tokenName.toLowerCase()),
                inventory.inventories.map((e) => e.price));

            final total = orders.orders.fold(0.0, (p, e) {
              return p +
                  (e.quantity * (prices[e.tokenName.toLowerCase()] ?? 0));
            });

            return Text(
              'Total: \$${AppNumberFormatter.format(total,decimal: 2)}',
              style: const TextStyle(
                fontFamily: 'CentraNo1-Medium',
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(0xffffffff),
              ),
            );
          },
        );
      },
    );
  }
}
