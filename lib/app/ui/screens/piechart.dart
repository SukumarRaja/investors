import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investors/app/ui/themes/font_size.dart';
import 'package:investors/app/ui/widgets/common/common_text.dart';
import 'package:investors/app/ui/widgets/pie.dart';

import '../themes/colors.dart';
import '../widgets/pie/indicator.dart';

class Pie extends StatelessWidget {
  const Pie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: Get.height,
          decoration: const BoxDecoration(
            color: AppColors.primary,
            gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.secondary],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.white,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              CommonText(
                text: "PIE CHART ANALYSIS",
                fontColor: AppColors.white,
                fontWeight: FontWeight.bold,
                fontSize: AppFontSize.twentyEight,
              ),
              SizedBox(height: 40),
              PieChartSample3(),
              Spacer(),
              pie_info(),
              SizedBox(height: Get.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }

  Row pie_info() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Indicator(
              color: AppColors.gradient,
              text: 'Investment',
              isSquare: false,
            ),
            SizedBox(
              height: 4,
            ),
            Indicator(
              color: AppColors.green,
              text: 'Profit',
              isSquare: false,
            ),
            SizedBox(
              height: 4,
            ),
            Indicator(
              color: AppColors.red,
              text: 'Withdrawal',
              isSquare: false,
            ),
          ],
        ),
        SizedBox(width: Get.width * 0.05),
      ],
    );
  }
}
