part of 'finalize_order_cubit.dart';

enum FinalizeOrderLoadingStatus { idle, inProgress, success, error }

class FinalizeOrderState with EquatableMixin {
  FinalizeOrderState({
    this.orders = const [],
    this.loadingStaus = FinalizeOrderLoadingStatus.idle,
    this.loadingMoreStatus = FinalizeOrderLoadingStatus.idle,
    this.page = 1,
    this.total = -1,
  });

  final List<HistoryOrder> orders;
  final FinalizeOrderLoadingStatus loadingStaus;
  final FinalizeOrderLoadingStatus loadingMoreStatus;
  final int page;
  final int total;

  @override
  List<Object?> get props => [orders, loadingStaus, loadingMoreStatus];

  FinalizeOrderState copyWith({
    List<HistoryOrder>? orders,
    FinalizeOrderLoadingStatus? loadingStaus,
    FinalizeOrderLoadingStatus? loadingMoreStatus,
    int? page,
    int? total,
  }) {
    return FinalizeOrderState(
      orders: orders ?? this.orders,
      loadingStaus: loadingStaus ?? this.loadingStaus,
      loadingMoreStatus: loadingMoreStatus ?? this.loadingMoreStatus,
      page: page ?? this.page,
      total: total ?? this.total,
    );
  }
}
// totalCount
