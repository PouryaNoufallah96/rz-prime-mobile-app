part of 'reown_bloc.dart';

enum AppReownLoadingStatus {
  none,
  getNonce,
  signing,
  getToken,
}

class ReownState with EquatableMixin {
  ReownState({
    this.nonce,
    this.address,
    this.status = AppReownLoadingStatus.none,
  });

  final NonceData? nonce;
  final String? address;
  final AppReownLoadingStatus status;

  @override
  List<Object?> get props => [nonce, address, status];

  ReownState copyWith({
    NonceData? Function()? nonce,
    String? Function()? address,
    AppReownLoadingStatus? status,
  }) {
    return ReownState(
      status: status ?? this.status,
      nonce: nonce == null ? this.nonce : nonce(),
      address: address == null ? this.address : address(),
    );
  }
}
