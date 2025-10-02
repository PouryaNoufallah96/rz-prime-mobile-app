import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gainx/components/app_logo.dart';
import 'package:gainx/core/blocs/reown/reown_bloc.dart';
import 'package:gainx/core/services/reown/reown.dart';
import 'package:gainx/core/utils/theme_utils.dart';
import 'package:gainx/gen/assets.gen.dart';
import 'package:gainx/pages/auth/widgets/auth_status.dart';
import 'package:reown_appkit/modal/i_appkit_modal_impl.dart';
import 'package:reown_appkit/reown_appkit.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _AuthPage();
  }
}

class _AuthPage extends StatelessWidget {
  const _AuthPage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              child: Column(
                children: [
                  const Text(
                    'Set Up Your Wallet',
                    style: TextStyle(
                      fontFamily: 'CentraNo1-Bold',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  // Binance SmartChain to proceed
                  Text.rich(
                    TextSpan(
                      text:
                          // ignore: lines_longer_than_80_chars
                          'Choose how you like to get started Please choose a wallet connected to ',
                      style: const TextStyle(
                        fontFamily: 'CentraNo1-Book',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: InkWell(
                            onTap: () async {
                              final uri =
                                  Uri.parse('https://docs.bnbchain.org/');
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(uri);
                              }
                            },
                            child: const Text(
                              'Binance SmartChain',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontFamily: 'CentraNo1-Bold',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const TextSpan(
                          text: ' to proceed',
                          style: TextStyle(
                            fontFamily: 'CentraNo1-Book',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
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
  ReownAppKitModalStatus _status = ReownAppKitModalStatus.idle;
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
    // final buttonText = switch (_state) {
    //   ConnectButtonState.connected => 'Login',
    //   ConnectButtonState.connecting => 'Connecting to wallet...',
    //   _ => 'Connect',
    // };

    final isLoading =
        _state == ConnectButtonState.connecting || !_status.isInitialized;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
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
                      borderRadius: BorderRadiusGeometry.circular(48),
                    ),
                  ),
                  onPressed: !_isConnected
                      ? () async {
                          await showModalBottomSheet<String>(
                            context: context,
                            useRootNavigator: true,
                            isScrollControlled: true,
                            useSafeArea: true,
                            backgroundColor: const Color(0xff202023),
                            showDragHandle: true,
                            builder: (_) {
                              return const _PublicWallet();
                            },
                          );
                        }
                      : showLoading
                          ? null
                          : () {
                              context
                                  .read<ReownBloc>()
                                  .add(ReownLogginButtonPressed());
                            },
                  child: _isConnected && showLoading
                      ? const SizedBox.square(
                          dimension: 24,
                          child: Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                        )
                      : Text(
                          loadingText ?? 'Log In',
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
        Padding(
          padding: const EdgeInsets.fromLTRB(35, 32, 35, 0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 320),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(48),
                ),
                side: BorderSide(
                  color: context.colorScheme.primary,
                ),
              ),
              onPressed: isLoading
                  ? null
                  : () {
                      if (_isConnected) {
                        widget.appKit.openModalView();
                      } else {
                        context
                            .read<ReownBloc>()
                            .add(ReownLogginButtonPressed());
                      }
                    },
              child: Text(
                _isConnected
                    ? 'Connected wallet'
                    : 'Connected with WalletConnect',
                style: const TextStyle(
                  fontFamily: 'CentraNo1-Medium',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        AppAuthStatus(appKit: widget.appKit),
        const SizedBox(height: 40),
      ],
    );
  }
}

class _PublicWallet extends HookWidget {
  const _PublicWallet();

  @override
  Widget build(BuildContext context) {
    final message = useState('');

    return BlocListener<ReownBloc, ReownState>(
      listenWhen: (previous, current) {
        return previous.manualLoginStatus == ManualLoginStatus.inLoading &&
            current.manualLoginStatus == ManualLoginStatus.success;
      },
      listener: (context, state) {
        Navigator.pop(context);
      },
      child: Padding(
        padding: EdgeInsetsGeometry.only(
          bottom: MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Log In',
                style: TextStyle(
                  fontFamily: 'CentraNo1-Bold',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Wallet Address',
                      style: TextStyle(
                        fontFamily: 'CentraNo1-medium',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      style: const TextStyle(
                        fontFamily: 'CentraNo1-medium',
                        fontSize: 16,
                      ),
                      onChanged: (value) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          message.value = value;
                        });
                      },
                      decoration: InputDecoration(
                        counterText: '',
                        filled: false,
                        hintText: 'Wallet Address',
                        hintStyle: TextStyle(
                          fontFamily: 'CentraNo1-Book',
                          fontSize: 14,
                          color: context.colorExtension.neutral,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: context.colorScheme.primary,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: context.colorExtension.neutral,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: context.colorExtension.neutral,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              BlocSelector<ReownBloc, ReownState, bool>(
                selector: (state) =>
                    state.manualLoginStatus == ManualLoginStatus.inLoading,
                builder: (context, inLoading) {
                  return ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 320),
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        minimumSize: const Size.fromHeight(48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(48),
                        ),
                      ),
                      onPressed: inLoading || message.value.isEmpty
                          ? null
                          : () {
                              context
                                  .read<ReownBloc>()
                                  .add(ReownAddressLogginButtonPressed(
                                    address: message.value,
                                  ));
                            },
                      child: inLoading
                          ? const SizedBox.square(
                              dimension: 24,
                              child: Center(
                                child: CircularProgressIndicator.adaptive(),
                              ),
                            )
                          : const Text(
                              'Confirm',
                              style: TextStyle(
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
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
