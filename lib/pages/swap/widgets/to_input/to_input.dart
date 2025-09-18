import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gainx/components/app_token.dart';
import 'package:gainx/core/blocs/inventory/inventory_bloc.dart';
import 'package:gainx/core/services/stats_service/models.dart';
import 'package:gainx/core/utils/input_formatter.dart';
import 'package:gainx/core/utils/number_formatter.dart';
import 'package:gainx/core/utils/theme_utils.dart';
import 'package:gainx/pages/swap/blocs/swap/swap_bloc.dart';
import 'package:gainx/pages/swap/widgets/to_input/bloc/to_input_bloc.dart';
import 'package:gainx/pages/swap/widgets/to_input/widgets/price_per_unit.dart';

class SwapToInput extends StatelessWidget {
  const SwapToInput({
    required this.stats,
    super.key,
  });

  final UserStats stats;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToInputBloc(
        ordersService: context.read(),
      ),
      child: _SwapToInput(
        stats: stats,
      ),
    );
  }
}

class _SwapToInput extends HookWidget {
  const _SwapToInput({
    required this.stats,
  });

  final UserStats stats;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: '0');

    return MultiBlocListener(
      listeners: [
        BlocListener<ToInputBloc, ToInputState>(
          listener: (context, state) {
            if (state is ToInputStateSuccessState) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                controller.text = '${state.price}';
              });
              return;
            }

            WidgetsBinding.instance.addPostFrameCallback((_) {
              controller.text = '0';
            });
          },
        ),
      ],
      child: BlocSelector<SwapBloc, SwapState, InventoryModel?>(
        selector: (state) {
          return state.selectedToken;
        },
        builder: (context, selectedToken) {
          final balance = selectedToken == null ? 0.0 : selectedToken.quantity;

          return DecoratedBox(
            decoration: BoxDecoration(
              color: context.colorScheme.outlineVariant,
              borderRadius: BorderRadiusGeometry.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsetsGeometry.symmetric(
                horizontal: 16,
                vertical: 20,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: const Color(0xff121314),
                          borderRadius: BorderRadius.circular(80),
                        ),
                        child: Material(
                          clipBehavior: Clip.antiAlias,
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(80),
                            onTap: () async {
                              final res =
                                  await showModalBottomSheet<InventoryModel>(
                                context: context,
                                useRootNavigator: true,
                                isScrollControlled: true,
                                useSafeArea: true,
                                backgroundColor: const Color(0xff202023),
                                constraints: BoxConstraints(
                                  maxHeight: context.mSize.height * .8,
                                ),
                                showDragHandle: true,
                                builder: (_) => MultiBlocProvider(
                                  providers: [
                                    BlocProvider.value(
                                      value: context.read<InventoryBloc>(),
                                    ),
                                  ],
                                  child: _SelectToken(
                                    selectedInventory: selectedToken,
                                  ),
                                ),
                              );

                              if (res != null && context.mounted) {
                                context.read<SwapBloc>().add(
                                    SwapSelectedTokenChanged(inventory: res));
                              }
                            },
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(minWidth: 133),
                              child: Padding(
                                padding: const EdgeInsetsGeometry.all(8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    if (selectedToken == null)
                                      const Text(
                                        'Select token',
                                        style: TextStyle(
                                          fontFamily: 'CentraNo1-Book',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffffffff),
                                        ),
                                      )
                                    else
                                      AppToken(
                                        src: selectedToken.imageSrc,
                                        name: selectedToken.tokenName,
                                      ),
                                    const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          text: 'Balance: ',
                          children: [
                            TextSpan(
                              text: AppNumberFromatter.format(balance,
                                  decimal: 2),
                              style: const TextStyle(
                                fontFamily: 'CentraNo1-Medium',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ],
                        ),
                        style: TextStyle(
                          fontFamily: 'CentraNo1-Book',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: context.colorExtension.neutral[400],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    style: const TextStyle(
                      fontFamily: 'CentraNo1-Medium',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffffffff),
                    ),
                    inputFormatters: [
                      SwapAmountFormatter(),
                    ],
                    controller: controller,
                    readOnly: true,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    cursorHeight: 24,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const PricePerUnit(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SelectToken extends HookWidget {
  const _SelectToken({
    required this.selectedInventory,
  });

  final InventoryModel? selectedInventory;

  @override
  Widget build(BuildContext context) {
    final search = useState('');

    return BlocBuilder<InventoryBloc, InventoryState>(
      builder: (context, state) {
        if (state is! InventorySuccessState) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }

        return Padding(
          padding: EdgeInsetsGeometry.only(
            bottom: MediaQuery.viewInsetsOf(context).bottom,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Tokens',
                  style: TextStyle(
                    fontFamily: 'CentraNo1-Bold',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: TextFormField(
                    style: const TextStyle(
                      fontFamily: 'CentraNo1-medium',
                      fontSize: 16,
                    ),
                    onChanged: (value) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        search.value = value;
                      });
                    },
                    decoration: InputDecoration(
                      filled: false,
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search_rounded),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: context.colorScheme.primary,
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
                ),
                ...state.inventories
                    .where((e) =>
                        search.value.isEmpty ||
                        e.tokenName.toLowerCase().contains(search.value))
                    .map((e) {
                  return Material(
                    color: e.tokenName == selectedInventory?.tokenName
                        ? context.colorScheme.primary.withValues(alpha: .24)
                        : Colors.transparent,
                    child: InkWell(
                      onTap: e.quantity == 0
                          ? null
                          : () => Navigator.pop(context, e),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color:
                                    e.tokenName == selectedInventory?.tokenName
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppToken(
                                    size: 34,
                                    src: e.imageSrc,
                                    name: e.tokenName,
                                    price: e.price,
                                    textStyle: const TextStyle(
                                      fontFamily: 'CentraNo1-Book',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    AppNumberFromatter.format(e.quantity),
                                    style: const TextStyle(
                                      fontFamily: 'CentraNo1-Book',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
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
                }),
                const SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }
}
