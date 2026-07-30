import 'package:flutter/material.dart';

class CampaignDiscountText extends StatelessWidget {
  const CampaignDiscountText(
    this.text, {
    super.key,
  });

  final String text;

  static const _gradient = LinearGradient(
    colors: [Color(0xFF7373FB), Color(0xFF90C7FF)],
  );

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => _gradient.createShader(bounds),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'CentraNo1-Book',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 1,
        ),
      ),
    );
  }
}
