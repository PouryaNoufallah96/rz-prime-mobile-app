part of 'qr_code_bloc.dart';

enum SubmitQrCodeStatus { idle, inProgress, success, failure }

class QrCodeState with EquatableMixin {
  QrCodeState({
    this.status = SubmitQrCodeStatus.idle,
    this.code,
    this.message,
  });

  final SubmitQrCodeStatus status;
  final String? code;
  final String? message;

  @override
  List<Object?> get props => [status, code, message];

  QrCodeState copyWith({
    SubmitQrCodeStatus? status,
    String? Function()? code,
    String? Function()? message,
  }) {
    return QrCodeState(
      status: status ?? this.status,
      code: code == null ? this.code : code(),
      message: message == null ? this.message : message(),
    );
  }
}
