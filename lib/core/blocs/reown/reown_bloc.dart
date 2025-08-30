import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gainx/core/services/auth_interceptor/auth_interceptor.dart';
import 'package:gainx/core/services/auth_service/auth_service.dart';
import 'package:gainx/core/services/auth_service/models.dart';
import 'package:gainx/core/services/reown/reown.dart';
import 'package:gainx/core/utils/future_timeout.dart';
import 'package:reown_appkit/reown_appkit.dart';
import 'package:toastification/toastification.dart';

part 'reown_event.dart';
part 'reown_state.dart';

class ReownBloc extends Bloc<ReownEvent, ReownState> {
  ReownBloc({
    required ReownService reownService,
    required AuthService authService,
    required AuthInterceptor authInterceptor,
  })  : _mainReownService = reownService,
        _authService = authService,
        _authInterceptor = authInterceptor,
        super(ReownState()) {
    on<ReownStarted>(_onReownStarted);
    on<ReownConnected>(_onReownConnected);
    on<ReownDisconnected>(_onReownDisConnected);
    on<ReownLogginButtonPressed>(_onReownLogginButtonPressed);
  }
  final AuthService _authService;
  final ReownService _mainReownService;
  final AuthInterceptor _authInterceptor;

  late StreamSubscription<ModalConnect>? _sub;

  Future<void> _onReownStarted(
    ReownStarted event,
    Emitter<ReownState> emit,
  ) async {
    _sub = _mainReownService.onModalConnectStream.listen((event) async {
      toastification.show(
        style: ToastificationStyle.fillColored,
        type: ToastificationType.success,
        title: const Text('Wallet connected! Please sign the message..'),
        borderRadius: BorderRadius.circular(6),
        autoCloseDuration: const Duration(seconds: 4),
      );

      add(ReownConnected(event: event));
    });

    _mainReownService.onModalDisconnectStream.listen((event) {
      if (!isClosed) {
        add(ReownDisconnected());
      }
    });
  }

  Future<void> _onReownDisConnected(
    ReownDisconnected event,
    Emitter<ReownState> emit,
  ) async {
    emit(state.copyWith(
      address: () => null,
      nonce: () => null,
    ));

    _authInterceptor.clear();
  }

  Future<void> _onReownConnected(
    ReownConnected event,
    Emitter<ReownState> emit,
  ) async {
    try {
      final appKitModal = _mainReownService.appKitModal;

      if (appKitModal.selectedChain == null) {
        await appKitModal.selectChain(
          ReownAppKitModalNetworks.getNetworkInfo('eip155', '56'),
          switchChain: true,
        );
      }

      final topic = event.event.session.topic;

      final chainId = appKitModal.selectedChain!.chainId;

      final namespace = NamespaceUtils.getNamespaceFromChain(
        chainId,
      );

      final rawAddress = event.event.session.getAddress(namespace)!;

      final EthereumAddress(:hexEip55) = EthereumAddress.fromHex(rawAddress);

      emit(state.copyWith(
        status: AppReownLoadingStatus.getNonce,
      ));

      final nonce = await _authService.getNonce(hexEip55);

      emit(state.copyWith(
        status: AppReownLoadingStatus.none,
      ));

      if (nonce == null) {
        return;
      }

      emit(state.copyWith(
        nonce: () => nonce,
        address: () => hexEip55,
      ));

      emit(state.copyWith(
        status: AppReownLoadingStatus.signing,
      ));

      final signature = await futureTimeout(
        appKitModal.request(
          topic: topic,
          chainId: chainId,
          request: SessionRequestParams(
            method: 'personal_sign',
            params: [nonce.message, hexEip55],
          ),
        ),
        const Duration(seconds: 30),
        () {
          emit(state.copyWith(
            status: AppReownLoadingStatus.none,
          ));
          toastification.show(
            style: ToastificationStyle.fillColored,
            type: ToastificationType.error,
            title: const Text(
                'Connection timed out! Please reconnect your wallet.'),
            borderRadius: BorderRadius.circular(6),
            autoCloseDuration: const Duration(seconds: 4),
          );
        },
      );

      emit(state.copyWith(
        status: AppReownLoadingStatus.none,
      ));

      if (signature is String) {
        _authInterceptor.setSignature(signature);
        add(ReownLogginButtonPressed());
      }
    } catch (_) {}
  }

  Future<void> _onReownLogginButtonPressed(
    ReownLogginButtonPressed event,
    Emitter<ReownState> emit,
  ) async {
    _authInterceptor.check();

    if (!_mainReownService.appKitModal.isConnected) {
      await _mainReownService.appKitModal.openModalView();
      return;
    }

    if (_authInterceptor.stream.value.signature == null) {
      if (_mainReownService.appKitModal.session != null) {
        add(
          ReownConnected(
            event: ModalConnect(_mainReownService.appKitModal.session!),
          ),
        );
      }

      return;
    } else if (state.nonce != null && state.address != null) {
      final signature = _authInterceptor.stream.value.signature!.signature;

      emit(state.copyWith(
        status: AppReownLoadingStatus.getToken,
      ));

      final token = await _authService.getToken(
        walletAddress: state.address!,
        nonce: state.nonce!.nonce,
        signature: signature,
      );

      emit(state.copyWith(
        status: AppReownLoadingStatus.none,
      ));

      if (token != null) {
        _authInterceptor.setToken(token);

        try {
          unawaited(_mainReownService.appKitModal.loadAccountData());
        } catch (_) {}

        toastification.show(
          style: ToastificationStyle.fillColored,
          type: ToastificationType.success,
          title: const Text('Logged in successfully!'),
          borderRadius: BorderRadius.circular(6),
          autoCloseDuration: const Duration(seconds: 4),
        );
      }
    }
  }

  @override
  Future<void> close() async {
    await _sub?.cancel();
    await super.close();
  }
}
