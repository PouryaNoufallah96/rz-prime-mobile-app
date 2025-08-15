import 'package:flutter/material.dart';
import 'package:gainx/components/app_logo.dart';
import 'package:gainx/core/env.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reown_appkit/reown_appkit.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 16),
            Center(
              child: Text(
                'GainX',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
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
            const _Auth(),
          ],
        ),
      ),
    );
  }
}

class _Auth extends StatefulWidget {
  const _Auth();

  @override
  State<_Auth> createState() => __AuthState();
}

class __AuthState extends State<_Auth> {
  late ReownAppKitModal _appKitModal;
  late ReownAppKit _appKit;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    _appKit = ReownAppKit(
      core: ReownCore(projectId: Env.reownProjectId),
      metadata: const PairingMetadata(
        name: 'Example App',
        description: 'Example app description',
        url: 'https://example.com/',
        icons: ['https://example.com/logo.png'],
        redirect: Redirect(
          native: 'com.example.gainx://',
          universal: 'https://reown.com/exampleapp',
          linkMode: true,
        ),
      ),
    );

    _appKitModal = ReownAppKitModal(
      context: context,
      appKit: _appKit,
      projectId: Env.reownProjectId,
      metadata: const PairingMetadata(
        name: 'Example App',
        description: 'Example app description',
        url: 'https://example.com/',
        icons: ['https://example.com/logo.png'],
        redirect: Redirect(
          native: 'com.example.gainx://',
          universal: 'https://reown.com/exampleapp',
          linkMode: true,
        ),
      ),
      includedWalletIds: {
        '4622a2b2d6af1c9844944291e5e7351a6aa24cd7b23099efac1b2fd875da31a0'
      },
      siweConfig: SIWEConfig(
        getNonce: () async {
          return SIWEUtils.generateNonce();
        },
        getMessageParams: () async {
          return SIWEMessageArgs(
            domain: Uri.parse(_appKitModal.appKit!.metadata.url).authority,
            uri: _appKitModal.appKit!.metadata.url,
            statement: '{Your custom message here}',
            methods: MethodsConstants.allMethods,
          );
        },
        createMessage: SIWEUtils.formatMessage,
        verifyMessage: (SIWEVerifyMessageArgs args) async {
          final chainId = SIWEUtils.getChainIdFromMessage(args.message);
          final address = SIWEUtils.getAddressFromMessage(args.message);
          final cacaoSignature = args.cacao != null
              ? args.cacao!.s
              : CacaoSignature(
                  t: CacaoSignature.EIP191,
                  s: args.signature,
                );
          return SIWEUtils.verifySignature(
            address,
            args.message,
            cacaoSignature,
            chainId,
            Env.reownProjectId,
          );
        },
        getSession: () async {
          final chainId = _appKitModal.selectedChain?.chainId ?? '1';
          final namespace = ReownAppKitModalNetworks.getNamespaceForChainId(
            chainId,
          );
          final address = _appKitModal.session!.getAddress(namespace)!;
          return SIWESession(address: address, chains: [chainId]);
        },
        signOut: () async {
          return true;
        },
      ),
    );

    await _appKit.init();
    await _appKitModal.init();

    // _appKitModal.dispatchEnvelope(url);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: AppKitModalConnectButton(
            appKit: _appKitModal,
          ),
        ),
        AppKitModalAccountButton(
          appKitModal: _appKitModal,
        ),
      ],
    );
  }
}
