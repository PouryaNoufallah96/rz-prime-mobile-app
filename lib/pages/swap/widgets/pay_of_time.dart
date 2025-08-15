import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gainx/core/utils/theme_utils.dart';
import 'package:gainx/pages/swap/blocs/swap/swap_bloc.dart';

class SelectPayOfTime extends StatelessWidget {
  const SelectPayOfTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pay of time',
          style: TextStyle(
            fontFamily: 'CentraNo1-Medium',
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        BlocSelector<SwapBloc, SwapState, SwapPayOfTime?>(
          selector: (state) {
            return state.swapPayOfTime;
          },
          builder: (context, payOfTime) {
            return OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
                side: BorderSide(
                  color: context.colorExtension.neutral,
                ),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                ),
              ),
              onPressed: () async {
                final res = await showModalBottomSheet<SwapPayOfTime>(
                  context: context,
                  useRootNavigator: true,
                  isScrollControlled: true,
                  useSafeArea: true,
                  backgroundColor: const Color(0xff202023),
                  constraints: BoxConstraints(
                    maxHeight: context.mSize.height * .8,
                  ),
                  showDragHandle: true,
                  builder: (context) => _SelectPayOfTime(
                    payOfTime: payOfTime,
                  ),
                );

                if (res != null && context.mounted) {
                  context
                      .read<SwapBloc>()
                      .add(SwapPayOfTimeChanged(payOfTime: res));
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    payOfTime?.text ?? 'select pay of time',
                    style: const TextStyle(
                      fontFamily: 'CentraNo1-Medium',
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 24,
                  )
                ],
              ),
            );
          },
        )
      ],
    );
  }
}

class _SelectPayOfTime extends StatelessWidget {
  const _SelectPayOfTime({
    required this.payOfTime,
  });

  final SwapPayOfTime? payOfTime;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text(
            'Pay of time',
            style: TextStyle(
              fontFamily: 'CentraNo1-Bold',
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
          ...SwapPayOfTime.values.map(
            (e) {
              return Material(
                color: e == payOfTime
                    ? context.colorScheme.primary.withValues(alpha: .24)
                    : Colors.transparent,
                child: InkWell(
                  onTap: () => Navigator.pop(context, e),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: e == payOfTime
                                ? context.colorScheme.primary
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const SizedBox(
                            width: 4,
                            height: 56,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                          child: Text.rich(
                            TextSpan(
                              text: '${e.month}',
                              style: const TextStyle(
                                fontFamily: 'CentraNo1-Medium',
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                              children: const [
                                TextSpan(
                                  text: '   month',
                                  style: TextStyle(
                                    fontFamily: 'CentraNo1-Book',
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
