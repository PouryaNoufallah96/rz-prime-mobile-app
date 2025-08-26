import 'package:gainx/contract_abi/contract_abi.dart';
import 'package:gainx/core/services/reown/reown.dart';
import 'package:reown_appkit/reown_appkit.dart';

class TransactionService {
  TransactionService({
    required ReownService reownService,
  }) : _reownService = reownService;

  final ReownService _reownService;

  Future<bool> approve(double amount) async {
    final chainId = _reownService.appKitModal.selectedChain?.chainId;

    if (chainId == null) {
      return false;
    }

    final value = _parseUnits('$amount');
    final addressCheckSum = _address();
    final spenderAddress = AppContractAbi.appContract.address;

    final res = await _reownService.appKitModal.requestWriteContract(
      topic: _reownService.appKitModal.session?.topic,
      chainId: chainId,
      deployedContract: AppContractAbi.erc20Contract,
      functionName: AppContractAbi.approveFunction.name,
      transaction: Transaction(from: addressCheckSum),
      parameters: [
        spenderAddress,
        value,
      ],
    );

    await _reownService.appKitModal.loadAccountData();

    return res is String && res.startsWith('0x');
  }

  Future<bool> payOrder(String orderId) async {
    final chainId = _reownService.appKitModal.selectedChain?.chainId;

    final addressCheckSum = _address();

    if (chainId == null) {
      return false;
    }

    final res = await _reownService.appKitModal.requestWriteContract(
      topic: _reownService.appKitModal.session?.topic,
      chainId: chainId,
      deployedContract: AppContractAbi.appContract,
      functionName: AppContractAbi.executeOrderFunction.name,
      transaction: Transaction(from: addressCheckSum),
      parameters: [orderId],
    );

    await _reownService.appKitModal.loadAccountData();

    return res is String && res.startsWith('0x');
  }

  EthereumAddress? _address() {
    final chainId = _reownService.appKitModal.selectedChain!.chainId;

    final namespace = NamespaceUtils.getNamespaceFromChain(
      chainId,
    );

    final rawAddress = _reownService.appKitModal.session?.getAddress(namespace);

    if (rawAddress == null) {
      return null;
    }

    return EthereumAddress.fromHex(rawAddress);
  }

  BigInt _parseUnits(
    String amountStr, {
    int decimals = 18,
  }) {
    final parts = amountStr.split('.');
    final whole = parts[0];
    final frac = parts.length > 1 ? parts[1] : '';
    final fixed = frac.length > decimals
        ? frac.substring(0, decimals)
        : frac.padRight(decimals, '0');
    return BigInt.parse(whole + fixed);
  }
}
