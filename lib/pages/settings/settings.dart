import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gainx/core/blocs/cubit/health_status_cubit.dart';
import 'package:gainx/core/blocs/preferences_bloc/preferences_bloc.dart';
import 'package:gainx/core/services/auth_interceptor/auth_interceptor.dart';
import 'package:gainx/core/services/auth_service/auth_service.dart';
import 'package:gainx/core/services/reown/reown.dart';
import 'package:gainx/core/utils/theme_utils.dart';
import 'package:gainx/pages/auth/widgets/auth_status.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Body();
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final canShowAction =
        context.watch<HealthStatusCubit>().state.status?.checked ?? false;

    return Column(
      children: [
        const SizedBox(height: 23),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Setting',
            style: TextStyle(
              fontFamily: 'CentraNo1-Bold',
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        if (canShowAction) ...[
          AppAuthStatus(
            appKit: context.read<ReownService>().appKitModal,
            mainAxisAlignment: MainAxisAlignment.start,
            builder: (context, isConnected, child) {
              return InkWell(
                onTap: () {
                  if (isConnected) {
                    context.read<ReownService>().appKitModal.openModalView();
                  } else {
                    context.read<ReownService>().appKitModal.openModalView();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              isConnected
                                  ? 'Connected Wallet'
                                  : 'Connected with WalletConnect',
                              style: const TextStyle(
                                fontFamily: 'CentraNo1-Medium',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Icon(Icons.keyboard_arrow_right_rounded)
                          ],
                        ),
                      ),
                      child,
                    ],
                  ),
                ),
              );
            },
          ),
          const Divider(height: 0),
        ],
        const SizedBox(height: 24),
        BlocSelector<PreferencesBloc, PreferencesState, bool>(
          selector: (state) => state.isDark,
          builder: (context, isDark) {
            return SwitchListTile(
              value: isDark,
              onChanged: null,
              subtitle: const Text(
                'Choose your preferred GinX theme.',
                style: TextStyle(
                  fontFamily: 'CentraNo1-Book',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              title: const Text(
                'Dark Mode',
                style: TextStyle(
                  fontFamily: 'CentraNo1-Medium',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          },
        ),
        const Divider(),
        // SwitchListTile(
        //   value: false,
        //   onChanged: (_) {},
        //   subtitle: const Text(
        //     // ignore: lines_longer_than_80_chars
        //     'Stay in the loop on what’s happening in your wallet with notification',
        //     style: TextStyle(
        //       fontFamily: 'CentraNo1-Book',
        //       fontSize: 14,
        //       fontWeight: FontWeight.w400,
        //     ),
        //   ),
        //   title: const Text(
        //     'Notifications',
        //     style: TextStyle(
        //       fontFamily: 'CentraNo1-Medium',
        //       fontSize: 16,
        //       fontWeight: FontWeight.w500,
        //     ),
        //   ),
        // ),
        // const Divider(),
        const _Logout()
      ],
    );
  }
}

class _Logout extends HookWidget {
  const _Logout();

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: FilledButton(
          onPressed: () async {
            isLoading.value = true;
            final isSucceed = await context.read<AuthService>().logout();

            isLoading.value = false;
            if (context.mounted && isSucceed) {
              context.read<AuthInterceptor>().clear();
            }
          },
          style: FilledButton.styleFrom(
            textStyle: const TextStyle(
              fontFamily: 'CentraNo1-Medium',
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            foregroundColor: const Color(0xffffffff),
            backgroundColor: context.colorScheme.error,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(80),
            ),
          ),
          child: isLoading.value
              ? const SizedBox.square(
                  dimension: 24,
                  child: CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation(
                      Colors.white,
                    ),
                  ),
                )
              : const Text('Log out'),
        ),
      ),
    );
  }
}
