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
        final isTermsAccepted =
            context.read<PreferencesBloc>().state.isTermsAccepted;

        if (!isOnBoardingPassed) {
          return '/on_boarding';
        }

        if (!isTermsAccepted) {
          return '/terms_of_use';
        }

        if (isTermsAccepted && path == '/terms_of_use') {
          return '/';
        }

        final streamValue = context.read<AuthInterceptor>().stream.value;
        final token = streamValue.token;

        final isLoggingIn = state.uri.path == '/';

        if (isLoggingIn) return token != null ? '/swap' : null;

        final uri = state.uri;

        if (uri.toString().startsWith('rzprime://app/qr_code?nonce')) {
          final query = uri.query;
          return '/swap/qr_code${query.isNotEmpty ? '?$query' : ''}';
        }

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
                    final socket = SocketService(
                      authInterceptor: context.read(),
                    );

                    try {
                      final reownService = context.read<ReownService>();
                      final chainId =
                          reownService.appKitModal.selectedChain!.chainId;

                      final namespace = NamespaceUtils.getNamespaceFromChain(
                        chainId,
                      );

                      final rawAddress = reownService.appKitModal.session!
                          .getAddress(namespace)!;

                      socket.connect(
                          EthereumAddress.fromHex(rawAddress).hexEip55);
                    } catch (_) {}

                    return socket;
                  },
                  dispose: (value) => value.dispose(),
                ),
              ],
              child: StreamBuilder(
                  stream: context
                      .read<AuthInterceptor>()
                      .stream
                      .map((event) => event.token?.token)
                      .distinctUnique(equals: (e1, e2) => e1 != e2),
                  builder: (context, asyncSnapshot) {
                    if (asyncSnapshot.data == null) {
                      return const Scaffold();
                    }

                    return MultiBlocProvider(
                      key: ValueKey(asyncSnapshot.data),
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
                        BlocProvider(
                          create: (context) => UserStatsCubit(
                            statsService: context.read(),
                          )..fetch(),
                        ),
                      ],
                      child: NestedPage(child: navigationShell),
                    );
                  }),
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
                  routes: [
                    GoRoute(
                      parentNavigatorKey: routerKey,
                      path: 'qr_code',
                      name: 'qr_code',
                      builder: (context, state) {
                        return QrCodeScanPage(
                          nonce: state.uri.queryParameters['nonce'],
                        );
                      },
                    ),
                  ],
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
        ),
        GoRoute(
          path: '/terms_of_use',
          builder: (context, state) => const TermsOfUsePage(),
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
