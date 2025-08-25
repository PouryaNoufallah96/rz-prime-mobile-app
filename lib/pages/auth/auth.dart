import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gainx/components/app_logo.dart';
import 'package:gainx/core/blocs/reown/reown_bloc.dart';
import 'package:gainx/core/services/reown/reown.dart';
import 'package:gainx/core/utils/theme_utils.dart';
import 'package:gainx/gen/assets.gen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reown_appkit/modal/i_appkit_modal_impl.dart';
import 'package:reown_appkit/reown_appkit.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReownBloc(
        authInterceptor: context.read(),
        authService: context.read(),
        reownService: context.read(),
      )..add(ReownStarted()),
      lazy: false,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              const SizedBox(height: 16),
              Assets.images.logoText.svg(),
              // Center(
              //   child: Text(
              //     'GainX',
              //     style: GoogleFonts.poppins(
              //       fontSize: 24,
              //       fontWeight: FontWeight.w400,
              //     ),
              //   ),
              // ),
              const SizedBox(height: 36),
              const Align(child: AppLogo()),
              const SizedBox(height: 16),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 320),
                child: const Column(
                  children: [
                    Text(
                      'Set Up Your Wallet',
                      style: TextStyle(
                        fontFamily: 'CentraNo1-Bold',
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    Text(
                      // ignore: lines_longer_than_80_chars
                      'Choose how you like to get started: Please choose a wallet to proceed',
                      style: TextStyle(
                        fontFamily: 'CentraNo1-Book',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              _Auth(
                appKit: context.read<ReownService>().appKitModal,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Auth extends StatefulHookWidget {
  const _Auth({
    required this.appKit,
  });

  final ReownAppKitModal appKit;

  @override
  State<_Auth> createState() => __AuthState();
}

class __AuthState extends State<_Auth> {
  ConnectButtonState _state = ConnectButtonState.none;
  ReownAppKitModalStatus _status = ReownAppKitModalStatus.initializing;
  bool _isConnected = false;

  @override
  void initState() {
    super.initState();
    _updateState();
    widget.appKit.addListener(_updateState);
  }

  @override
  void didUpdateWidget(covariant _Auth oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateState();
  }

  @override
  void dispose() {
    super.dispose();
    widget.appKit.removeListener(_updateState);
  }

  void _updateState() {
    setState(() {
      _status = widget.appKit.status;
      _isConnected = widget.appKit.isConnected;
    });

    if (_state == ConnectButtonState.none && !_isConnected) {
      return;
    }
    if (widget.appKit.status == ReownAppKitModalStatus.error) {
      return setState(() => _state = ConnectButtonState.error);
    } else if (widget.appKit.isConnected) {
      return setState(() => _state = ConnectButtonState.connected);
    } else if (!widget.appKit.hasNamespaces) {
      return setState(() => _state = ConnectButtonState.disabled);
    } else if (!widget.appKit.isOpen && !widget.appKit.isConnected) {
      return setState(() => _state = ConnectButtonState.idle);
    } else if (widget.appKit.isOpen && !widget.appKit.isConnected) {
      return setState(() => _state = ConnectButtonState.connecting);
    }
  }

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
        duration: const Duration(seconds: 1), lowerBound: .5);

    useEffect(() {
      animationController.repeat(reverse: true);
      return null;
    }, []);

    final color = switch (_state) {
      ConnectButtonState.connected => context.colorExtension.success,
      ConnectButtonState.connecting => context.colorScheme.error,
      _ => context.colorScheme.error,
    };

    final text = switch (_state) {
      ConnectButtonState.connected => 'Connected',
      ConnectButtonState.connecting => 'Connecting',
      _ => 'Disconnected',
    };

    // final buttonText = switch (_state) {
    //   ConnectButtonState.connected => 'Login',
    //   ConnectButtonState.connecting => 'Connecting to wallet...',
    //   _ => 'Connect',
    // };

    final isLoading =
        _state == ConnectButtonState.connecting || _status.isLoading;

    return Column(
      children: [
        Row(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: animationController,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
                child: const SizedBox.square(
                  dimension: 8,
                ),
              ),
            ),
            Text(
              text,
              style: const TextStyle(
                fontFamily: 'CentraNo1-Book',
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.fromLTRB(35, 0, 35, 8),
          child: BlocSelector<ReownBloc, ReownState, AppReownLoadingStatus>(
            selector: (state) => state.status,
            builder: (context, status) {
              final showLoading =
                  status != AppReownLoadingStatus.none || isLoading;

              final loadingText = switch (status) {
                AppReownLoadingStatus.none => null,
                AppReownLoadingStatus.getNonce => 'Get Nonce',
                AppReownLoadingStatus.signing => 'Signing',
                AppReownLoadingStatus.getToken => 'Get Token',
              };

              return ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 320),
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                    ),
                  ),
                  onPressed: showLoading
                      ? null
                      : () {
                          context
                              .read<ReownBloc>()
                              .add(ReownLogginButtonPressed());
                        },
                  child: showLoading
                      ? const SizedBox.square(
                          dimension: 24,
                          child: Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                        )
                      : Text(
                          loadingText ?? 'Login',
                          style: const TextStyle(
                            fontFamily: 'CentraNo1-Medium',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                ),
              );
            },
          ),
        ),
        if (_isConnected)
          Padding(
            padding: const EdgeInsets.fromLTRB(35, 0, 35, 40),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 320),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12),
                  ),
                  side: BorderSide(
                    color: context.colorScheme.primary,
                  ),
                ),
                onPressed: isLoading
                    ? null
                    : () {
                        widget.appKit.openModalView();
                      },
                child: const Text(
                  'Current wallet',
                  style: TextStyle(
                    fontFamily: 'CentraNo1-Medium',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
