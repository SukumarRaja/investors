import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../themes/colors.dart';
import '../../themes/font_size.dart';
import '../common/common_text.dart';

class PercentIndicator extends StatelessWidget {
  const PercentIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 105,
      lineWidth: 13,
      animation: true,
      percent: 0.7,
      backgroundColor: AppColors.grey.withOpacity(0.1),
      progressColor: AppColors.gradient,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonText(
            text: "\u20B9 4,00,000",
            fontColor: AppColors.white,
            fontWeight: FontWeight.bold,
            fontSize: AppFontSize.twentyEight,
          ),
          CommonText(
            text: "of  \u20B9 5,00,000",
            fontColor: AppColors.white.withOpacity(0.5),
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
