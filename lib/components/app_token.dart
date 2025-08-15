import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppToken extends StatelessWidget {
  const AppToken({
    required this.src,
    required this.name,
    this.textStyle,
    this.size = 24,
    super.key,
  });

  final String src;
  final String name;
  final double size;
  final TextStyle? textStyle;

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
          ),
        const SizedBox(width: 8),
        Text(
          name,
          style: textStyle ??
              const TextStyle(
                fontFamily: 'CentraNo1-Book',
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
        ),
      ],
    );
  }
}
