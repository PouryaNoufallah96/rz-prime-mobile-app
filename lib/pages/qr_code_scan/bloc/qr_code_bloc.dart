import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gainx/core/services/auth_service/auth_service.dart';
import 'package:gainx/core/services/reown/reown.dart';
import 'package:reown_appkit/reown_appkit.dart';
import 'package:toastification/toastification.dart';

part 'qr_code_event.dart';
part 'qr_code_state.dart';

class QrCodeBloc extends Bloc<QrCodeEvent, QrCodeState> {
  QrCodeBloc({
    required ReownService reownService,
    required AuthService authService,
    this.manualAddress,
    String? nonce,
  })  : _authService = authService,
        _reownService = reownService,
        super(QrCodeState(code: nonce)) {
    on<QrCodeSubmitedEvent>(_onQrCodeSubmitedEvent);
    on<QrCodeReceivedEvent>(_onQrCodeReceivedEvent);
    on<QrCodeManulaEvent>(_onQrCodeManulaEvent);
  }

  final AuthService _authService;
  final ReownService _reownService;
  final String? manualAddress;

  Future<void> _onQrCodeSubmitedEvent(
    QrCodeSubmitedEvent event,
    Emitter<QrCodeState> emit,
  ) async {
    final address = () {
      if (manualAddress != null) {
        return EthereumAddress.fromHex(manualAddress!).hexEip55;
      }

      final chainId = _reownService.appKitModal.selectedChain!.chainId;
      final namespace = NamespaceUtils.getNamespaceFromChain(chainId);
      final owner = _reownService.appKitModal.session!.getAddress(namespace);
      return EthereumAddress.fromHex(owner!).hexEip55;
    }();

    emit(state.copyWith(status: SubmitQrCodeStatus.inProgress));

    final isSucceed = await _authService.activateNonce(
      address: address,
      code: state.message,
      nonce: state.code,
    );

    if (isSucceed) {
      emit(state.copyWith(status: SubmitQrCodeStatus.success));
    } else {
      emit(
        state.copyWith(
          status: SubmitQrCodeStatus.failure,
          code: () => null,
          message: () => null,
        ),
      );
    }
  }

  Future<void> _onQrCodeReceivedEvent(
    QrCodeReceivedEvent event,
    Emitter<QrCodeState> emit,
  ) async {
    if (state.code != null) {
      return;
    }

    final url = Uri.tryParse(event.nonce);

    if (url == null ||
        url.queryParameters['nonce'] == null ||
        url.scheme != 'rzprime') {
      toastification.show(
        style: ToastificationStyle.fillColored,
        type: ToastificationType.error,
        title: const Text('Unable to Scan'),
        borderRadius: BorderRadius.circular(6),
        autoCloseDuration: const Duration(seconds: 4),
      );

      return;
    }

    final nonce = url.queryParameters['nonce']!;

    emit(
      state.copyWith(
        code: () => nonce,
        message: () => null,
      ),
    );

    await Future<void>.delayed(const Duration(seconds: 1));
    add(QrCodeSubmitedEvent());
  }

  void _onQrCodeManulaEvent(
    QrCodeManulaEvent event,
    Emitter<QrCodeState> emit,
  ) {
    emit(
      state.copyWith(
        message: () => event.message,
        code: () => null,
      ),
    );
    add(QrCodeSubmitedEvent());
  }
}
