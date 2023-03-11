import 'package:flutter/material.dart';

import '../../../utility/utility.dart';
import '../../themes/colors.dart';
import '../../themes/font_size.dart';
import '../common/common_text.dart';

class InterestAndWithdraw extends StatelessWidget {
  const InterestAndWithdraw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
              height: 50,
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.white.withOpacity(.2),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(0.2, 0.6))
                  ]),
              child: Stack(
                children: [
                  Center(
                    child: CommonText(
                      text: "\u20B9 56,269",
                      // fontColor: AppColors.secondPrimary,
                      foreground: Paint()..shader = mainAmountGradient,
                      fontSize: AppFontSize.twentyFour,
                      isForeground: true,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Positioned(
                      bottom: 0,
                      right: 2,
                      child: CommonText(
                        text: "* interest",
                        fontSize: AppFontSize.twelve,
                      ))
                ],
              )),
        ),
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.center,
            height: 50,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(15),
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
            child: const CommonText(
              text: "Withdraw",
              fontSize: AppFontSize.twenty,
              fontColor: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
