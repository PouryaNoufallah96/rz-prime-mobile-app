import 'package:gainx/core/services/campaign/models.dart';
import 'package:gainx/core/services/http_service/http_service.dart';

class CampaignService {
  CampaignService({
    required HttpService adapter,
  }) : _adapter = adapter;

  final HttpService _adapter;

  Future<CampaignBanner?> banner() async {
    final res = await _adapter.requestUri<Map<String, dynamic>>(
      Uri.parse('Campaign/GetCampaignBannerData'),
    );

    return switch (res) {
      AppSuccessResponse(:final data) => _parse(data),
      AppFailureResponse(:final message) => throw StateError(message),
    };
  }

  CampaignBanner? _parse(Map<String, dynamic>? json) {
    if (json == null) return null;
    final data = json['data'] ?? json;
    if (data is! Map<String, dynamic>) return null;
    if (!data.containsKey('discountPercentage')) return null;
    return CampaignBanner.fromJson(data);
  }
}
