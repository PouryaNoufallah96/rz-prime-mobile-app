import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gainx/core/blocs/campaign/campaign_cubit.dart';
import 'package:gainx/core/services/campaign/models.dart';
import 'package:gainx/core/utils/theme_utils.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  static const _borderGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0x804EA1FF), Color(0x8014B8A6), Color(0x80A855F7)],
  );

  static const _backgroundGradient = LinearGradient(
    colors: [Color(0xFF0B1020), Color(0xFF1E1B4B), Color(0xFF0F766E)],
  );

  static const _iconGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF7373FB), Color(0xFF90C7FF)],
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CampaignCubit, CampaignBanner?>(
      builder: (context, banner) {
        if (banner == null || !banner.isActive) {
          return const SizedBox.shrink();
        }

        final discount = banner.discountPercentage;
        final discountLabel = discount == discount.roundToDouble()
            ? discount.toStringAsFixed(0)
            : '$discount';
        final titlePrefix = banner.isAvailableForUser
            ? "You're eligible for "
            : 'Campaign offer: ';
        final subtitle = switch ((banner.isWalletDiscount, banner.maxUsers)) {
          (true, _) => 'Exclusive to your wallet',
          (false, > 0) => 'Exclusive for the first ${banner.maxUsers} users',
          _ => 'Limited-time campaign offer',
        };

        return DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: _borderGradient,
            boxShadow: const [
              BoxShadow(
                color: Color(0x334EA1FF),
                offset: Offset(0, 10),
                blurRadius: 28,
                spreadRadius: -8,
              ),
              BoxShadow(
                color: Color(0x3314B8A6),
                offset: Offset(0, 6),
                blurRadius: 18,
                spreadRadius: -6,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(1),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: _backgroundGradient,
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 98),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  child: Row(
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: _iconGradient,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.auto_awesome,
                            size: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text.rich(
                              TextSpan(
                                text: titlePrefix,
                                style: const TextStyle(
                                  fontFamily: 'CentraNo1-Bold',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                                children: [
                                  TextSpan(
                                    text: '$discountLabel% OFF',
                                    style: const TextStyle(
                                      fontFamily: 'CentraNo1-Bold',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF2DD4BF),
                                    ),
                                  ),
                                  const TextSpan(text: ' at checkout!'),
                                ],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              subtitle,
                              style: TextStyle(
                                fontFamily: 'CentraNo1-Book',
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: context.colorExtension.neutral[300],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
