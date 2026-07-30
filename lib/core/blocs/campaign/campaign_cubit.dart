import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gainx/core/services/campaign/campaign_service.dart';
import 'package:gainx/core/services/campaign/models.dart';

class CampaignCubit extends Cubit<CampaignBanner?> {
  CampaignCubit({
    required this._campaignService,
  }) : super(null);

  final CampaignService _campaignService;
  Timer? _pollingTimer;
  bool _hasFetched = false;
  bool _isFetching = false;

  Future<void> fetch() async {
    if (_isFetching) return;
    _isFetching = true;

    try {
      final banner = await _campaignService.banner();
      if (isClosed) return;

      emit(banner);

      if (!_hasFetched) {
        _hasFetched = true;
        if (banner != null) {
          _startPolling();
        }
      } else if (banner == null) {
        _stopPolling();
      }
    } catch (_) {
    } finally {
      _isFetching = false;
    }
  }

  void _startPolling() {
    _pollingTimer ??= Timer.periodic(
      const Duration(minutes: 2),
      (_) => fetch(),
    );
  }

  void _stopPolling() {
    _pollingTimer?.cancel();
    _pollingTimer = null;
  }

  @override
  Future<void> close() {
    _stopPolling();
    return super.close();
  }
}
