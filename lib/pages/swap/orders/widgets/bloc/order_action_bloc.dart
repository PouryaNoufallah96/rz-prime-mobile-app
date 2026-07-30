import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gainx/core/env.dart';
import 'package:gainx/core/services/orders_service/orders_service.dart';
import 'package:gainx/core/services/reown/reown.dart';
import 'package:gainx/core/services/transaction_service/transaction_service.dart';
import 'package:gainx/core/utils/future_timeout.dart';
import 'package:reown_appkit/reown_appkit.dart';
import 'package:toastification/toastification.dart';
import 'package:web3dart/web3dart.dart' as crypto;

part 'order_action_event.dart';
part 'order_action_state.dart';

class OrderActionBloc extends Bloc<OrderActionEvent, OrderActionState> {
  OrderActionBloc({
    required OrdersService ordersService,
    required TransactionService transactionService,
    required ReownService reownService,
  }) : _ordersService = ordersService,
       _transactionService = transactionService,
       _reownService = reownService,
       super(OrderActionState()) {
    on<OrderActionDropped>(_onOrderActionDropped);
    on<OrderActionPayed>(_onOrderActionPayed);
  }

  final OrdersService _ordersService;
  final TransactionService _transactionService;
  final ReownService _reownService;

  Future<void> _onOrderActionDropped(
    OrderActionDropped event,
    Emitter<OrderActionState> emit,
  ) async {
    emit(state.copyWith(dropOrderStatus: DropOrderStatus.inProgress));

    final domain = {
      'name': Env.appContractName,
      'version': '1',
      'chainId': 56,
      'verifyingContract': Env.appContractAddress,
    };

    final types = {
      'DropOrder': [
        {'name': 'user', 'type': 'address'},
        {'name': 'orderId', 'type': 'bytes32'},
      ],
    };

    final bytes = Uint8List.fromList(utf8.encode(event.id));
    final hash = crypto.keccak256(bytes);
    final hex = crypto.bytesToHex(hash, include0x: true);

    final chainId = _reownService.appKitModal.selectedChain!.chainId;
    final namespace = NamespaceUtils.getNamespaceFromChain(chainId);
    final owner = _reownService.appKitModal.session!.getAddress(namespace);
    final ownerAddress = EthereumAddress.fromHex(owner!);
    final topic = _reownService.appKitModal.session!.topic;
    final address = ownerAddress.eip55With0x;
    final message = {'user': address, 'orderId': hex};

    final typedData = {
      'types': types,
      'domain': domain,
      'primaryType': 'DropOrder',
      'message': message,
    };

    final signature = await futureTimeout(
      _reownService.appKitModal
          .request(
            topic: topic,
            chainId: chainId,
            request: SessionRequestParams(
              method: 'eth_signTypedData_v4',
              params: [address, jsonEncode(typedData)],
            ),
          )
          .then((value) => value as String?),
      const Duration(seconds: 30),
      () {
        emit(state.copyWith(payOrderStatus: PayOrderStatus.idle));

        toastification.show(
          style: ToastificationStyle.fillColored,
          type: ToastificationType.error,
          title: const Text('There was a problem connecting to your wallet.'),
          borderRadius: BorderRadius.circular(6),
          autoCloseDuration: const Duration(seconds: 4),
        );
      },
    );

    if (signature == null) {
      emit(state.copyWith(payOrderStatus: PayOrderStatus.idle));

      return;
    }

    final isSucceed = await _ordersService.dropOrder(
      orderId: event.id,
      signature: signature,
    );

    if (isSucceed) {
      // toastification.show(
      //   style: ToastificationStyle.fillColored,
      //   type: ToastificationType.success,
      //   title: const Text('Order dropped Successfully.'),
      //   borderRadius: BorderRadius.circular(6),
      //   autoCloseDuration: const Duration(seconds: 4),
      // );
    }

    emit(
      state.copyWith(
        updateTime: isSucceed
            ? DateTime.now().millisecondsSinceEpoch
            : state.updateTime,
        dropOrderStatus: DropOrderStatus.idle,
      ),
    );
  }

  Future<void> _onOrderActionPayed(
    OrderActionPayed event,
    Emitter<OrderActionState> emit,
  ) async {
    emit(state.copyWith(payOrderStatus: PayOrderStatus.inProgress));

    final detail = await _ordersService.getOrderDetail(event.id);
    final amountWei = detail == null
        ? null
        : BigInt.tryParse(detail.payAmountInWei);

    if (amountWei == null) {
      toastification.show(
        style: ToastificationStyle.fillColored,
        type: ToastificationType.error,
        title: const Text(
          'Could not load the payment amount. Please try again.',
        ),
        borderRadius: BorderRadius.circular(6),
        autoCloseDuration: const Duration(seconds: 4),
      );

      emit(state.copyWith(payOrderStatus: PayOrderStatus.idle));

      return;
    }

    final amount = _transactionService.toHumanDouble(amountWei, 18);

    final balance = await futureTimeout(
      _transactionService.balance(),
      const Duration(seconds: 20),
      () {
        toastification.show(
          style: ToastificationStyle.fillColored,
          type: ToastificationType.error,
          title: const Text('There was a problem connecting to your wallet.'),
          borderRadius: BorderRadius.circular(6),
          autoCloseDuration: const Duration(seconds: 4),
        );
      },
    );

    if (balance == null) {
      emit(state.copyWith(payOrderStatus: PayOrderStatus.idle));

      return;
    }

    if (balance.$2 < amount) {
      toastification.show(
        style: ToastificationStyle.fillColored,
        type: ToastificationType.error,
        title: Text(
          // ignore: lines_longer_than_80_chars
          'Insufficient RZ USD on ${balance.$1}. Switch network or fund your wallet.',
        ),
        borderRadius: BorderRadius.circular(6),
        autoCloseDuration: const Duration(seconds: 4),
      );

      emit(state.copyWith(payOrderStatus: PayOrderStatus.idle));

      return;
    }

    try {
      final isApproved = await futureTimeout(
        _transactionService.approveRaw(amountWei),
        const Duration(seconds: 30),
        () {
          emit(state.copyWith(payOrderStatus: PayOrderStatus.idle));

          toastification.show(
            style: ToastificationStyle.fillColored,
            type: ToastificationType.error,
            title: const Text('There was a problem connecting to your wallet.'),
            borderRadius: BorderRadius.circular(6),
            autoCloseDuration: const Duration(seconds: 4),
          );
        },
      );

      bool? isPayed;

      if (isApproved ?? false) {
        isPayed = await futureTimeout(
          _transactionService.payOrder(event.id),
          const Duration(seconds: 30),
          () {
            emit(state.copyWith(payOrderStatus: PayOrderStatus.idle));

            toastification.show(
              style: ToastificationStyle.fillColored,
              type: ToastificationType.error,
              title: const Text(
                'There was a problem connecting to your wallet.',
              ),
              borderRadius: BorderRadius.circular(6),
              autoCloseDuration: const Duration(seconds: 4),
            );
          },
        );

        if (isPayed ?? false) {
          toastification.show(
            style: ToastificationStyle.fillColored,
            type: ToastificationType.info,
            title: const Text(
              'Transaction is in progress. This may take a while.',
            ),
            borderRadius: BorderRadius.circular(6),
            autoCloseDuration: const Duration(seconds: 4),
          );
        }
      } else {
        toastification.show(
          style: ToastificationStyle.fillColored,
          type: ToastificationType.error,
          title: const Text('The transaction was rejected.'),
          borderRadius: BorderRadius.circular(6),
          autoCloseDuration: const Duration(seconds: 4),
        );
      }

      emit(
        state.copyWith(
          isOrderCompeleted: () => isPayed,
          updateTime: DateTime.now().millisecondsSinceEpoch,
          payOrderStatus: PayOrderStatus.idle,
        ),
      );
    } catch (e) {
      toastification.show(
        style: ToastificationStyle.fillColored,
        type: ToastificationType.error,
        title: const Text('There was a problem connecting to your wallet'),
        borderRadius: BorderRadius.circular(6),
        autoCloseDuration: const Duration(seconds: 4),
      );

      emit(state.copyWith(payOrderStatus: PayOrderStatus.idle));
    } finally {
      await _transactionService.loadAccountData();
    }
  }
}
