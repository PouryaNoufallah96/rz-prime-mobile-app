import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gainx/core/utils/theme_utils.dart';
import 'package:gainx/pages/nested_page/cubit/overlay_cubit.dart';
import 'package:go_router/go_router.dart';

class NestedPage extends StatelessWidget {
  const NestedPage({
    required this.child,
    super.key,
  });

  final StatefulNavigationShell child;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<OverlayCubit, AppOverlayState, bool>(
      selector: (state) {
        return state.isAppLocked;
      },
      builder: (context, isAppLocked) {
        return IgnorePointer(
          ignoring: isAppLocked,
          child: Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  child,
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _BottomNav(
                          shell: child,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _BottomNav extends StatelessWidget {
  const _BottomNav({
    required this.shell,
  });

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: const Color(0xff202023),
          border: Border.all(
            color: context.colorExtension.neutral[700]!,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
          child: Row(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _NavItem(
                src: 'assets/icons/clock.svg',
                withBackground: false,
                onTap: shell.goBranch,
                index: 0,
                groupIndex: shell.currentIndex,
              ),
              _NavItem(
                src: 'assets/icons/arrow_reload.svg',
                withBackground: true,
                onTap: shell.goBranch,
                index: 1,
                groupIndex: shell.currentIndex,
              ),
              _NavItem(
                src: 'assets/icons/settings.svg',
                withBackground: false,
                onTap: shell.goBranch,
                index: 2,
                groupIndex: shell.currentIndex,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.src,
    required this.withBackground,
    required this.onTap,
    required this.index,
    required this.groupIndex,
  });

  final String src;
  final bool withBackground;
  final int index;
  final void Function(int index) onTap;
  final int groupIndex;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(100),
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: () => onTap(index),
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: withBackground
                ? context.colorScheme.primary
                : Colors.transparent,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              src,
              height: 24,
              width: 24,
              colorFilter: index == groupIndex && !withBackground
                  ? ColorFilter.mode(
                      context.colorScheme.primary, BlendMode.srcIn)
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
