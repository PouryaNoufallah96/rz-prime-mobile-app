class Env {
  static final _env = _Env.get();

  static String reownProjectId = _env.reownProjectId;
  static String apiEndPoint = _env.apiEndPoint;
  static String clientId = _env.clientId;
  static String clientSecret = _env.clientSecret;
  static String publicSignature = _env.publicSignature;
}

sealed class _Env {
  _Env({
    required this.reownProjectId,
    required this.apiEndPoint,
    required this.clientId,
    required this.clientSecret,
    required this.publicSignature,
  });

  factory _Env.get() {
    return _StageEnv();
  }

  final String reownProjectId;
  final String apiEndPoint;
  final String clientId;
  final String clientSecret;
  final String publicSignature;
}

class _StageEnv extends _Env {
  _StageEnv()
      : super(
          reownProjectId: '7ce040c7d04f5849ebb722c29a169483',
          apiEndPoint: 'https://api.rzprime.com/api/v1/',
          clientId: 'app_iiastsswqz',
          clientSecret: 'chdnisuxnvvhsdswq',
          publicSignature: 'ikjhyfgrtydhAqHCUjV5P5Fjv5y',
        );
}
