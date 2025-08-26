import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gainx/core/services/stats_service/models.dart';
import 'package:gainx/core/utils/theme_utils.dart';
import 'package:gainx/pages/swap/blocs/user_stats_cubit/user_stats_cubit.dart';

class UserLevel extends StatelessWidget {
  const UserLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserStatsCubit, UserStatsState>(
      builder: (context, state) {
        if (state is! UserStatsSuccessState) {
          return const SizedBox.shrink();
        }

        return Center(
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color: context.colorExtension.neutral[600]!,
              ),
              borderRadius: BorderRadius.circular(80),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(80),
              onTap: () async {
                final res = await showModalBottomSheet<UserStage>(
                  context: context,
                  useRootNavigator: true,
                  isScrollControlled: true,
                  useSafeArea: true,
                  backgroundColor: const Color(0xff202023),
                  constraints: BoxConstraints(
                    maxHeight: context.mSize.height * .8,
                  ),
                  showDragHandle: true,
                  builder: (context) => _SelectStage(
                    stage: state.selectedStage,
                    enableStages: [...state.stats.map((e) => e.stage)],
                  ),
                );

                if (res != null && context.mounted) {
                  await context.read<UserStatsCubit>().changeStage(res);
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 16,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/${state.selectedStage.name}.png',
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      state.selectedStage.value,
                      style: const TextStyle(
                        fontFamily: 'CentraNo1-Medium',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 21),
                    const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SelectStage extends StatelessWidget {
  const _SelectStage({
    required this.stage,
    required this.enableStages,
  });

  final UserStage stage;
  final List<UserStage> enableStages;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...UserStage.values.map(
            (e) {
              final canSelect = enableStages.contains(e);

              return Material(
                color: e == stage
                    ? context.colorScheme.primary.withValues(alpha: .24)
                    : Colors.transparent,
                child: InkWell(
                  onTap: !canSelect ? null : () => Navigator.pop(context, e),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: e == stage
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
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            spacing: 16,
                            children: [
                              Image.asset(
                                canSelect
                                    ? 'assets/images/${e.name}.png'
                                    : 'assets/images/${e.name}_disable.png',
                                height: 36,
                                width: 36,
                              ),
                              Text(
                                e.value,
                                style: TextStyle(
                                  fontFamily: 'CentraNo1-Medium',
                                  fontSize: 16,
                                  color: canSelect
                                      ? Colors.white
                                      : context.colorExtension.neutral[400]!,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
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
