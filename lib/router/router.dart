part of '../main.dart';

mixin GainXAppRouter on State<GainXApp> {
  GoRouter get router {
    return GoRouter(
      refreshListenable: _RouterRefreshStream(const Stream.empty()),
      redirect: (context, state) async {
        return null;
      },
      routes: [],
    );
  }
}

class _RouterRefreshStream extends ChangeNotifier {
  _RouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.listen((_) {
      notifyListeners();
    });
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
