part of '../main.dart';

final GlobalKey<NavigatorState> routerKey = GlobalKey();
final GlobalKey<NavigatorState> _sectionANavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionANav');
mixin GainXAppRouter on State<GainXApp> {
  GoRouter get router {
    return GoRouter(
      initialLocation: '/swap',
      navigatorKey: routerKey,
      refreshListenable: _RouterRefreshStream(
        preferencesStream: context.read<PreferencesBloc>().stream,
      ),
      redirect: (context, state) async {
        final path = state.uri.path;

        final isOnBoardingPassed =
            context.read<PreferencesBloc>().state.isOnBoardingPass;

        if (!isOnBoardingPassed) {
          return '/on_boarding';
        }

        if (isOnBoardingPassed && path == '/on_boarding') {
          return '/swap';
        }

        return null;
      },
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return NestedPage(child: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/history',
                  builder: (context, state) {
                    return const HistoryPage();
                  },
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _sectionANavigatorKey,
              routes: [
                GoRoute(
                  path: '/swap',
                  builder: (context, state) {
                    return const SwapPage();
                  },
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/settings',
                  builder: (context, state) {
                    return const SettingsPage();
                  },
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: '/',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const AuthPage(),
              transitionDuration: const Duration(milliseconds: 400),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                final offsetAnimation = Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).animate(animation);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          path: '/on_boarding',
          builder: (context, state) => const OnBoardingPage(),
        )
      ],
    );
  }
}

class _RouterRefreshStream extends ChangeNotifier {
  _RouterRefreshStream({
    required Stream<PreferencesState> preferencesStream,
  }) {
    notifyListeners();
    _subscription = preferencesStream.listen((_) {
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
