part of 'qr_code_bloc.dart';

sealed class QrCodeEvent with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class QrCodeSubmitedEvent extends QrCodeEvent {}

class QrCodeReceivedEvent extends QrCodeEvent {
  QrCodeReceivedEvent({
    required this.nonce,
  });

  final String nonce;

  @override
  List<Object?> get props => [nonce];
}

class QrCodeManulaEvent extends QrCodeEvent {
  QrCodeManulaEvent({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => [message];
}
