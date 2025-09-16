// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gainx/core/blocs/preferences_bloc/preferences_bloc.dart';
import 'package:gainx/core/utils/theme_utils.dart';
import 'package:gainx/gen/assets.gen.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: _Body(),
      ),
    );
  }
}

class _Body extends HookWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final index = useState(0);

    final texts = useMemoized(
        () => [
              (
                'Why RZ Prime?',
                'Invest in tokens without upfront payment and commit only when you Gain X times!'
              ),
              (
                'Zero Risk Investment',
                'Reserve token deals without locking your funds. Cancel anytime, no penalties and pay only if the price goes up.'
              ),
              (
                'Protected by Smart Contracts',
                'Deals on GainX are fully controlled by our smart contracts. No one can pause, change, or access them.'
              ),
            ][index.value],
        [index.value]);

    return Column(
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
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          layoutBuilder: (currentChild, previousChildren) {
            return Stack(
              alignment: Alignment.center,
              children: [
                ...previousChildren,
                if (currentChild != null) currentChild,
              ],
            );
          },
          transitionBuilder: (child, animation) {
            final isIncoming = child.key == ValueKey(index.value);

            if (!isIncoming) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            }

            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child),
            );
          },
          child: [
            Assets.images.onBoarding1,
            Assets.images.onBoarding2,
            Assets.images.onBoarding3,
          ][index.value]
              .image(
            key: ValueKey(index.value),
            width: context.mSize.width * .8,
            height: context.mSize.width * .8,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...[0, 1, 2].map((e) {
              final isSelected = e == index.value;

              return DecoratedBox(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected
                        ? context.colorScheme.primary
                        : context.colorExtension.neutral[400]),
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  child: SizedBox.square(
                    dimension: isSelected ? 12 : 8,
                  ),
                ),
              );
            })
          ],
        ),
        const SizedBox(height: 30),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          layoutBuilder: (currentChild, previousChildren) {
            return Stack(
              alignment: Alignment.center,
              children: [
                ...previousChildren,
                if (currentChild != null) currentChild,
              ],
            );
          },
          transitionBuilder: (child, animation) {
            final isIncoming = child.key == ValueKey(index.value);

            if (!isIncoming) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            }

            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            );
          },
          child: ConstrainedBox(
            key: ValueKey(index.value),
            constraints: const BoxConstraints(maxWidth: 320),
            child: Column(
              spacing: 16,
              children: [
                Text(
                  texts.$1,
                  style: const TextStyle(
                    fontFamily: 'CentraNo1-Bold',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  texts.$2,
                  style: const TextStyle(
                    fontFamily: 'CentraNo1-Book',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.fromLTRB(35, 0, 35, 40),
          child: OutlinedButton(
            onPressed: () {
              if (index.value < 2) {
                index.value += 1;
              } else {
                context
                    .read<PreferencesBloc>()
                    .add(PreferencesOnBoardingPassed());
              }
            },
            style: OutlinedButton.styleFrom(
              minimumSize: const Size.fromHeight(48),
              backgroundColor: context.colorExtension.neutral[900],
              side: BorderSide(color: context.colorExtension.primary),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(80),
              ),
            ),
            child: Text(
              index.value < 2 ? 'Next' : 'Get Started',
              style: const TextStyle(
                fontFamily: 'CentraNo1-Medium',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
