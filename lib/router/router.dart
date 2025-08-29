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
        authStream: context.read<AuthInterceptor>().stream,
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
          return '/';
        }

        final streamValue = context.read<AuthInterceptor>().stream.value;
        final token = streamValue.token;

        final isLoggingIn = state.uri.path == '/';

        if (isLoggingIn) return token != null ? '/swap' : null;

        return token != null ? null : '/';
      },
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return MultiRepositoryProvider(
              providers: [
                RepositoryProvider(
                  create: (context) => TransactionService(
                    reownService: context.read(),
                  ),
                ),
                RepositoryProvider(
                  create: (context) {
                    final reownService = context.read<ReownService>();
                    final chainId =
                        reownService.appKitModal.selectedChain!.chainId;

                    final namespace = NamespaceUtils.getNamespaceFromChain(
                      chainId,
                    );

                    final rawAddress = reownService.appKitModal.session!
                        .getAddress(namespace)!;

                    return SocketService(
                      authInterceptor: context.read(),
                    )..connect(EthereumAddress.fromHex(rawAddress).hexEip55);
                  },
                  dispose: (value) => value.dispose(),
                ),
              ],
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => InventoryBloc(
                      socketService: context.read(),
                      statsService: context.read(),
                    )..add(InventoryStartedEvent()),
                  ),
                  BlocProvider(
                    create: (context) => FinalizeOrderCubit(
                      ordersService: context.read(),
                    )..getOrders(),
                  ),
                  BlocProvider(
                    lazy: false,
                    create: (context) => NotifyPaidOrderBloc(
                      socketService: context.read(),
                    )..add(NotifyPaidOrderStarted()),
                  ),
                ],
                child: NestedPage(child: navigationShell),
              ),
            );
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
    required ValueStream<AuthContainer> authStream,
  }) {
    notifyListeners();
    _subscription = preferencesStream.listen((_) {
      notifyListeners();
    });
    _authSubscription = authStream.listen((_) {
      notifyListeners();
    });
  }

  late final StreamSubscription<dynamic> _subscription;
  late final StreamSubscription<AuthContainer> _authSubscription;

  @override
  void dispose() {
    _authSubscription.cancel();
    _subscription.cancel();
    super.dispose();
  }
}
