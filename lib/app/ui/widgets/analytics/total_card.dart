import 'package:flutter/material.dart';

import '../../themes/colors.dart';
import '../../themes/font_size.dart';
import '../common/common_text.dart';

class Total extends StatelessWidget {
  const Total({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media=MediaQuery.of(context).size;
    return Container(
      width: media.width,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
              color: AppColors.white.withOpacity(.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0.2, 0.6)),
        ],
        gradient: const LinearGradient(
            colors: [AppColors.primary, AppColors.secondary],
            begin: Alignment.topRight,
            end: Alignment.topLeft),
      ),
      child: Padding(
        padding:  EdgeInsets.all(3.0),
        child: Row(
          children: [
            Column(
              children: [
                const CommonText(
                  text: "TOTAL INVESTMENT",
                  fontSize: AppFontSize.twenty,
                  fontColor: AppColors.white,
                ),
                CommonText(
                  text: "\u20B9 5,00,000",
                  fontSize: AppFontSize.twenty,
                  fontColor: AppColors.gradient,
                ),
              ],
            ),
            SizedBox(width: media.width*0.12),
            Column(
              children: [
                const CommonText(
                  text: "TOTAL PROFIT",
                  fontSize: AppFontSize.twenty,
                  fontColor: AppColors.white,
                ),
                CommonText(
                  text: "\u20B9 20,000",
                  fontSize: AppFontSize.twenty,
                  fontColor: AppColors.gradient,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


