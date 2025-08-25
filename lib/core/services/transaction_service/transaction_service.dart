import 'package:gainx/core/services/reown/reown.dart';

class TransactionService {
  TransactionService({
    required ReownService reownService,
  }) : _reownService = reownService;

  final ReownService _reownService;

  Future<void> signTransaction() async {}
}
