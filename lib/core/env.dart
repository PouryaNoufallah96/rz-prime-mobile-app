class Env {
  static final _env = _Env.get();

  static String reownProjectId = _env.reownProjectId;
  static String apiEndPoint = _env.apiEndPoint;
  static String clientId = _env.clientId;
  static String clientSecret = _env.clientSecret;
  static String publicSignature = _env.publicSignature;
  static String inventroyOrderHub = _env.inventroyOrderHub;
  static String paidOrderHub = _env.paidOrderHub;
  static String appContractAddress = _env.appContractAddress;
  static String appContractName = _env.appContractName;
  static String erc20Address = _env.erc20Address;
  static String erc20Name = _env.erc20Name;
  static String applicationId = _env.applicationId;
}

sealed class _Env {
  _Env({
    required this.reownProjectId,
    required this.apiEndPoint,
    required this.clientId,
    required this.clientSecret,
    required this.publicSignature,
    required this.paidOrderHub,
    required this.inventroyOrderHub,
    required this.appContractAddress,
    required this.appContractName,
    required this.erc20Address,
    required this.erc20Name,
    required this.applicationId,
  });

  factory _Env.get() {
    return _StageEnv();
  }

  final String reownProjectId;
  final String apiEndPoint;
  final String clientId;
  final String clientSecret;
  final String publicSignature;
  final String paidOrderHub;
  final String inventroyOrderHub;
  final String appContractAddress;
  final String appContractName;
  final String erc20Address;
  final String erc20Name;
  final String applicationId;
}

class _StageEnv extends _Env {
  _StageEnv()
      : super(
          reownProjectId: '7ce040c7d04f5849ebb722c29a169483',
          apiEndPoint: 'https://testnetapi.rzprime.com/api/v1/',
          clientId: 'app_iiastsswqz',
          clientSecret: 'chdnisuxnvvhsdswq',
          publicSignature: 'ikjhyfgrtydhAqHCUjV5P5Fjv5y',
          inventroyOrderHub: 'wss://testnetapi.rzprime.com/hubs/inventory',
          paidOrderHub: 'wss://testnetapi.rzprime.com/hubs/paidOrder',
          appContractAddress: '0xB0D6B2805C09A37c762c3599fA932DC5Dc0D65c3',
          appContractName: 'TokenForwardSale',
          erc20Address: '0xbeeAF6AEa7D96015b27a3D5a11eB47D0cF330E16',
          erc20Name: 'MockERC20',
          applicationId: 'rzprime.app',
        );
}
