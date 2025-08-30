import 'package:decimal/decimal.dart' show Decimal;
import 'package:gainx/contract_abi/contract_abi.dart';
import 'package:gainx/core/services/reown/reown.dart';
import 'package:reown_appkit/reown_appkit.dart';

class TransactionService {
  TransactionService({
    required ReownService reownService,
  }) : _reownService = reownService;

  final ReownService _reownService;

  Future<void> loadAccountData() async {
    try {
      await _reownService.appKitModal.loadAccountData();
    } catch (_) {}
  }

  Future<(String network, double balance)> balance() async {
    await loadAccountData();

    final topic = _reownService.appKitModal.session?.topic;
    final chainId = _reownService.appKitModal.selectedChain!.chainId;
    final namespace = NamespaceUtils.getNamespaceFromChain(chainId);
    final owner = _reownService.appKitModal.session!.getAddress(namespace);
    final ownerAddress = EthereumAddress.fromHex(owner!);

    final decRes = await _reownService.appKitModal.requestReadContract(
      topic: _reownService.appKitModal.session?.topic,
      chainId: chainId,
      deployedContract: AppContractAbi.erc20Contract,
      functionName: AppContractAbi.erc20Contract.function('decimals').name,
    );

    final decimals = (decRes.first as BigInt).toInt();

    final balRes = await _reownService.appKitModal.requestReadContract(
      topic: topic,
      chainId: chainId,
      deployedContract: AppContractAbi.erc20Contract,
      functionName: 'balanceOf',
      parameters: [ownerAddress],
    );
    final raw = balRes.first as BigInt;

    final balance = toHumanDouble(raw, decimals, fractionDigits: 4);
    return (_reownService.appKitModal.selectedChain?.name ?? '', balance);
  }

  Decimal toHumanExact(BigInt raw, int decimals) {
    if (decimals <= 0) return Decimal.parse(raw.toString());

    final s = raw.toString().padLeft(decimals + 1, '0');
    final whole = s.substring(0, s.length - decimals);
    final frac = s.substring(s.length - decimals);

    return Decimal.parse('$whole.$frac');
  }

  double toHumanDouble(BigInt raw, int decimals, {int fractionDigits = 6}) {
    final d = toHumanExact(raw, decimals).toDouble();
    return fractionDigits >= 0
        ? double.parse(d.toStringAsFixed(fractionDigits))
        : d;
  }

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
