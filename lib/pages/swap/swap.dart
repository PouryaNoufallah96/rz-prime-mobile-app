import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gainx/components/app_un_focuser.dart';
import 'package:gainx/core/blocs/inventory/inventory_bloc.dart';
import 'package:gainx/core/services/auth_interceptor/auth_interceptor.dart';
import 'package:gainx/core/services/stats_service/models.dart';
import 'package:gainx/core/utils/theme_utils.dart';
import 'package:gainx/pages/history/cubit/finalize_order_cubit.dart';
import 'package:gainx/pages/swap/blocs/notify_paid_order_bloc/notify_paid_order_bloc.dart';
import 'package:gainx/pages/swap/blocs/swap/swap_bloc.dart';
import 'package:gainx/pages/swap/blocs/user_stats_cubit/user_stats_cubit.dart';
import 'package:gainx/pages/swap/orders/cubit/open_orders_cubit.dart';
import 'package:gainx/pages/swap/orders/orders.dart';
import 'package:gainx/pages/swap/widgets/from_input.dart';
import 'package:gainx/pages/swap/widgets/orders_total/orders_total.dart';
import 'package:gainx/pages/swap/widgets/pay_of_time.dart';
import 'package:gainx/pages/swap/widgets/submit_swap.dart';
import 'package:gainx/pages/swap/widgets/to_input/to_input.dart';
import 'package:gainx/pages/swap/widgets/user_balance.dart';
import 'package:go_router/go_router.dart';
import 'package:rxdart/rxdart.dart';

class SwapPage extends StatelessWidget {
  const SwapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppUnFocuser(child: _Body());
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SwapBloc(
            ordersService: context.read(),
          ),
        ),
        BlocProvider(
          create: (context) => OpenOrdersCubit(
            ordersService: context.read(),
          )..getOrders(),
        ),
      ],
      child: BlocSelector<UserStatsCubit, UserStatsState, UserStats?>(
        selector: (state) {
          if (state is UserStatsSuccessState) {
            return state.findByStage();
          }

          return null;
        },
        builder: (context, state) {
          if (state == null) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          return _SwapBody(
            stats: state,
          );
        },
      ),
    );
  }
}

class _SwapBody extends HookWidget {
  const _SwapBody({
    required this.stats,
  });

  final UserStats stats;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      final sub = context
          .read<AuthInterceptor>()
          .stream
          .map((event) => event.token?.token)
          .distinctUnique(equals: (e1, e2) => e1 != e2)
          .listen((event) {});

      return sub.cancel;
    }, []);

    return MultiBlocListener(
      listeners: [
        BlocListener<NotifyPaidOrderBloc, NotifyPaidOrderState>(
          listenWhen: (p, c) {
            return p.lastUpdated != c.lastUpdated;
          },
          listener: (context, state) {
            context.read<UserStatsCubit>().fetch(skipLoading: true);
            context.read<OpenOrdersCubit>().getOrders();
            context.read<FinalizeOrderCubit>().getOrders();
          },
        ),
        BlocListener<SwapBloc, SwapState>(
          listenWhen: (p, c) {
            return p.submitSwapStatus == SubmitSwapStatus.inProgress &&
                c.submitSwapStatus == SubmitSwapStatus.idle;
          },
          listener: (context, state) {
            context.read<UserStatsCubit>().fetch(skipLoading: true);
            context.read<OpenOrdersCubit>().getOrders();
          },
        ),
        BlocListener<InventoryBloc, InventoryState>(
          listener: (context, state) {
            if (state is InventorySuccessState) {
              context
                  .read<SwapBloc>()
                  .add(SwapInventoryUpdated(inventories: state.inventories));
            }
          },
        ),
      ],
      child: RefreshIndicator(
        onRefresh: () async {
          await Future.wait([
            context.read<UserStatsCubit>().fetch(),
            if (stats.isVerified) context.read<OpenOrdersCubit>().getOrders()
          ]);
        },
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList.list(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox.square(dimension: 24),
                      IconButton(
                        onPressed: () => context.goNamed('qr_code'),
                        icon: SvgPicture.asset(
                          'assets/icons/qr_code.svg',
                          height: 24,
                          width: 24,
                        ),
                      ),
                      // const UserLevel(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  UserBalance(
                    balance: stats.availableLoanAmount,
                    title: 'Amount',
                  ),
                  const SizedBox(height: 8),
                  UserBalance(
                    balance: stats.sumOfMining,
                    title: 'Mining',
                  ),
                  const SizedBox(height: 20),
                  SwapSectionAdaptive(
                    from: SwapFromInput(stats: stats),
                    to: SwapToInput(stats: stats),
                  ),
                  const SizedBox(height: 24),
                  const SelectPayOfTime(),
                  const SizedBox(height: 24),
                  SubmitSwap(isVerified: stats.isVerified),
                  const SizedBox(height: 24),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OrdersTotal(),
                      SizedBox(height: 12),
                      Text(
                        'Orders',
                        style: TextStyle(
                          fontFamily: 'CentraNo1-Medium',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SwapOrders(),
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
    );
  }
}

const double kSwapBtnSize = 40;
const double kGapBetweenCards = 20;

class SwapSectionAdaptive extends StatefulWidget {
  const SwapSectionAdaptive({
    required this.from,
    required this.to,
    super.key,
  });

  final Widget from;
  final Widget to;

  @override
  State<SwapSectionAdaptive> createState() => _SwapSectionAdaptiveState();
}

class _SwapSectionAdaptiveState extends State<SwapSectionAdaptive> {
  final GlobalKey<State<StatefulWidget>> _stackKey = GlobalKey();
  final GlobalKey<State<StatefulWidget>> _fromKey = GlobalKey();
  double? _buttonTop;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _measure());
  }

  @override
  void didUpdateWidget(covariant SwapSectionAdaptive oldWidget) {
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance.addPostFrameCallback((_) => _measure());
  }

  void _measure() {
    final stackBox = _stackKey.currentContext?.findRenderObject() as RenderBox?;
    final fromBox = _fromKey.currentContext?.findRenderObject() as RenderBox?;
    if (stackBox == null || fromBox == null) return;

    final fromBottomInStack = fromBox
        .localToGlobal(Offset(0, fromBox.size.height), ancestor: stackBox)
        .dy;

    final top = fromBottomInStack + (kGapBetweenCards / 2) - (kSwapBtnSize / 2);

    if (_buttonTop != top) {
      setState(() => _buttonTop = top);
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<SizeChangedLayoutNotification>(
      onNotification: (_) {
        WidgetsBinding.instance.addPostFrameCallback((_) => _measure());
        return false;
      },
      child: Stack(
        key: _stackKey,
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizeChangedLayoutNotifier(
                child: KeyedSubtree(
                  key: _fromKey,
                  child: widget.from,
                ),
              ),
              const SizedBox(height: kGapBetweenCards),
              widget.to,
            ],
          ),
          if (_buttonTop != null)
            Positioned(
              left: 0,
              right: 0,
              top: _buttonTop,
              child: Center(
                child: Material(
                  elevation: 6,
                  shape: const CircleBorder(),
                  color: context.colorScheme.primary,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: SizedBox.square(
                      dimension: 24,
                      child: SvgPicture.asset(
                        'assets/icons/arrow_down.svg',
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
