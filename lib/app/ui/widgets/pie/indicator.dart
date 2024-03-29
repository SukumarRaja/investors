import 'package:flutter/material.dart';
import 'package:investors/app/ui/themes/colors.dart';
import 'package:investors/app/ui/themes/font_size.dart';

import '../common/common_text.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.color,
    required this.text,
    required this.isSquare,
    this.size = 16,
    this.textColor=AppColors.white,
  });
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        CommonText(
          text: text,
            fontSize: AppFontSize.eighteen,
            fontWeight: FontWeight.w400,
            fontColor: textColor,
          ),

      ],
    );
  }
}