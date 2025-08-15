class Env {
  static final _env = _Env.get();

  static String reownProjectId = _env.reownProjectId;
  static String apiEndPoint = _env.apiEndPoint;
}

sealed class _Env {
  _Env({
    required this.reownProjectId,
    required this.apiEndPoint,
  });

  factory _Env.get() {
    return _StageEnv();
  }

  final String reownProjectId;
  final String apiEndPoint;
}

class _StageEnv extends _Env {
  _StageEnv()
      : super(
          reownProjectId: '7ce040c7d04f5849ebb722c29a169483',
          apiEndPoint: 'https://gainxglobal.com/api/v1/',
        );
}
