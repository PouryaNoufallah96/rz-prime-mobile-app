import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gainx/core/utils/number_formatter.dart';

class AppToken extends StatelessWidget {
  const AppToken({
    required this.src,
    required this.name,
    this.textStyle,
    this.price,
    this.size = 24,
    super.key,
  });

  final String src;
  final String name;
  final double size;
  final TextStyle? textStyle;
  final double? price;

  bool get _isSvg => src.endsWith('.svg');

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (_isSvg)
          SvgPicture.asset(
            src,
            height: size,
            width: size,
          )
        else
          Image.asset(
            src,
            height: size,
            width: size,
            errorBuilder: (context, error, stackTrace) {
              return const SizedBox();
            },
          ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 2,
          children: [
            Text(
              name,
              style: textStyle ??
                  const TextStyle(
                    fontFamily: 'CentraNo1-Book',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            if (price != null)
              Text(
                '\$ ${AppNumberFromatter.format(price!, decimal: 2)}',
                style: const TextStyle(
                  fontFamily: 'CentraNo1-Medium',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
