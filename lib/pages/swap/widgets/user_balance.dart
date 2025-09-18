import 'package:flutter/material.dart';
import 'package:gainx/core/utils/number_formatter.dart';
import 'package:gainx/core/utils/theme_utils.dart';

class UserBalance extends StatelessWidget {
  const UserBalance({
    required this.balance,
    required this.title,
    super.key,
  });

  final double balance;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$ ${AppNumberFormatter.format(balance, decimal:2)}',
          style: const TextStyle(
            fontFamily: 'CentraNo1-Bold',
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontFamily: 'CentraNo1-Book',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: context.colorExtension.neutral[400],
          ),
        ),
      ],
    );
  }
}
