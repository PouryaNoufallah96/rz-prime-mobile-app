import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gainx/core/utils/theme_utils.dart';
import 'package:gainx/pages/nested_page/cubit/overlay_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class NestedPage extends StatefulWidget {
  const NestedPage({
    required this.child,
    super.key,
  });

  final StatefulNavigationShell child;

  @override
  State<NestedPage> createState() => _NestedPageState();
}

class _NestedPageState extends State<NestedPage> {
  OverlayEntry? _entry;

  void _hideOverlay() {
    _entry?.remove();
    _entry = null;
  }

  @override
  void dispose() {
    _hideOverlay();
    super.dispose();
  }

  void _showOverlay() {
    if (_entry != null) return;
    final overlay = Overlay.of(context, rootOverlay: true);

    _entry = OverlayEntry(
      builder: (_) => Stack(
        children: [
          Positioned.fill(
            child: IgnorePointer(
              ignoring: false,
              child: Container(color: const Color(0x99000000)),
            ),
          ),
          Positioned.fill(
            child: Center(
              child: HookBuilder(builder: (context) {
                final cont = useAnimationController();

                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Material(
                    elevation: 12,
                    borderRadius: BorderRadius.circular(12),
                    clipBehavior: Clip.antiAlias,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 360),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          spacing: 12,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 120,
                              child: Lottie.asset(
                                'assets/images/animation.json',
                                controller: cont,
                                onLoaded: (p0) {
                                  cont
                                    ..duration = p0.duration
                                    ..forward();
                                },
                              ),
                            ),
                            const Text(
                              'You transaction is being submitted.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'CentraNo1-Medium',
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Text(
                              // ignore: lines_longer_than_80_chars
                              'You will be redirected to your wallet to confirm the transaction. This process may take time.',
                              textAlign: TextAlign.center,

                              style: TextStyle(
                                fontFamily: 'CentraNo1-Book',
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );

    overlay.insert(_entry!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OverlayCubit, AppOverlayState>(
      listener: (context, state) {
        if (state.isAppLocked) {
          _showOverlay();
        } else {
          _hideOverlay();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              widget.child,
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _BottomNav(
                      shell: widget.child,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
