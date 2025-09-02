import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gainx/core/services/auth_service/auth_service.dart';
import 'package:gainx/core/services/reown/reown.dart';
import 'package:reown_appkit/reown_appkit.dart';

part 'qr_code_event.dart';
part 'qr_code_state.dart';

class QrCodeBloc extends Bloc<QrCodeEvent, QrCodeState> {
  QrCodeBloc({
    required ReownService reownService,
    required AuthService authService,
  })  : _authService = authService,
        _reownService = reownService,
        super(QrCodeState()) {
    on<QrCodeSubmitedEvent>(_onQrCodeSubmitedEvent);
    on<QrCodeReceivedEvent>(_onQrCodeReceivedEvent);
    on<QrCodeManulaEvent>(_onQrCodeManulaEvent);
  }

  final AuthService _authService;
  final ReownService _reownService;

  Future<void> _onQrCodeSubmitedEvent(
    QrCodeSubmitedEvent event,
    Emitter<QrCodeState> emit,
  ) async {
    final chainId = _reownService.appKitModal.selectedChain!.chainId;
    final namespace = NamespaceUtils.getNamespaceFromChain(chainId);
    final owner = _reownService.appKitModal.session!.getAddress(namespace);
    final address = EthereumAddress.fromHex(owner!);

    emit(state.copyWith(status: SubmitQrCodeStatus.inProgress));
    final isSucceed = await _authService.activateNonce(
      address: address.hexEip55,
      code: state.message,
      nonce: state.code,
    );

    if (isSucceed) {
      emit(state.copyWith(status: SubmitQrCodeStatus.success));
    } else {
      emit(state.copyWith(status: SubmitQrCodeStatus.failure));
    }
  }

  Future<void> _onQrCodeReceivedEvent(
    QrCodeReceivedEvent event,
    Emitter<QrCodeState> emit,
  ) async {
    emit(
      state.copyWith(
        code: () => event.nonce,
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
