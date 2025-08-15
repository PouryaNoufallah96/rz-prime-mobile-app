import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gainx/core/blocs/preferences_bloc/preferences_bloc.dart';
import 'package:gainx/core/utils/theme_utils.dart';

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
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 23),
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
        BlocSelector<PreferencesBloc, PreferencesState, bool>(
          selector: (state) => state.isDark,
          builder: (context, isDark) {
            return SwitchListTile(
              value: isDark,
              onChanged: (_) => context
                  .read<PreferencesBloc>()
                  .add(PreferencesThemeToggled()),
              subtitle: const Text(
                'Choose your preferred GinX theme.',
                style: TextStyle(
                  fontFamily: 'CentraNo1-Book',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              title: const Text(
                'Dard Mode',
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
        SwitchListTile(
          value: false,
          onChanged: (_) {},
          subtitle: const Text(
            'Stay in the loop on what’s happening in your wallet with notification',
            style: TextStyle(
              fontFamily: 'CentraNo1-Book',
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          title: const Text(
            'Notifications',
            style: TextStyle(
              fontFamily: 'CentraNo1-Medium',
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: FilledButton(
              onPressed: () {},
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
              child: const Text('Log out'),
            ),
          ),
        )
      ],
    );
  }
}
