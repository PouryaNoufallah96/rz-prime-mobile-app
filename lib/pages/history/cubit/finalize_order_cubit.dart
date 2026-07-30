import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' as mt;
import 'package:gainx/core/services/orders_service/models.dart';
import 'package:gainx/core/services/orders_service/orders_service.dart';
import 'package:toastification/toastification.dart';

part 'finalize_order_state.dart';

class FinalizeOrderCubit extends Cubit<FinalizeOrderState> {
  FinalizeOrderCubit({
    required OrdersService ordersService,
  })  : _ordersService = ordersService,
        super(FinalizeOrderState());

  final OrdersService _ordersService;

  final Set<String> _announcedCampaignOrderIds = {};
  bool _campaignsSeeded = false;

  Future<void> getOrders() async {
    emit(
      state.copyWith(
        loadingStaus: FinalizeOrderLoadingStatus.inProgress,
        page: 1,
        orders: [],
      ),
    );

    final data = await _ordersService.listOfFinalizedOrders(state.page);

    emit(
      state.copyWith(
        loadingStaus: FinalizeOrderLoadingStatus.success,
        orders: data.$1,
        total: data.$2,
      ),
    );

    _announceCampaigns(data.$1);
  }

  void _announceCampaigns(List<HistoryOrder> orders) {
    final campaignOrders = orders.where((o) => o.hasCampaignDiscount).toList();

    if (!_campaignsSeeded) {
      _campaignsSeeded = true;
      _announcedCampaignOrderIds.addAll(campaignOrders.map((o) => o.orderId));
      return;
    }

    for (final order in campaignOrders) {
      if (!_announcedCampaignOrderIds.add(order.orderId)) continue;

      toastification.show(
        style: ToastificationStyle.fillColored,
        type: ToastificationType.success,
        title: mt.Text(order.campaignDiscountMessage),
        borderRadius: mt.BorderRadius.circular(6),
        autoCloseDuration: const Duration(seconds: 4),
      );
    }
  }

  Future<void> nextPage() async {
    if (state.loadingMoreStatus == FinalizeOrderLoadingStatus.inProgress ||
        state.loadingStaus != FinalizeOrderLoadingStatus.success ||
        state.orders.length == state.total) {
      return;
    }

    final newPage = state.page + 1;

    emit(state.copyWith(
      page: newPage,
      loadingMoreStatus: FinalizeOrderLoadingStatus.inProgress,
    ));

    final data = await _ordersService.listOfFinalizedOrders(newPage);

    emit(
      state.copyWith(
        loadingMoreStatus: FinalizeOrderLoadingStatus.success,
        orders: [
          ...state.orders,
          ...data.$1,
        ],
        total: data.$2,
      ),
    );

    _announcedCampaignOrderIds.addAll(
      data.$1.where((o) => o.hasCampaignDiscount).map((o) => o.orderId),
    );
  }
}
