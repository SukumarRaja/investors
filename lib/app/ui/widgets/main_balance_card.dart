import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utility/utility.dart';
import '../themes/colors.dart';
import '../themes/font_size.dart';
import 'common/common_text.dart';

class MainBalanceCard extends StatelessWidget {
  const MainBalanceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      height: media.height * 0.2,
      width: media.width,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
              color: AppColors.white.withOpacity(.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0.4, 0.2))
        ],
        gradient: const LinearGradient(colors: [
          AppColors.primary,
          AppColors.secondPrimary,
        ], begin: Alignment.topRight, end: Alignment.center),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              height: media.height,
              // color: AppColors.secondaryColor,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: media.width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: media.height * 0.02,
                    ),
                    const CommonText(
                      text: "Balance",
                      fontColor: AppColors.black,
                    ),
                    SizedBox(
                      height: media.height * 0.01,
                    ),
                    CommonText(
                      text: "\u20B9 56,269",
                      // fontColor: AppColors.secondPrimary,
                      foreground: Paint()..shader = mainAmountGradient,
                      fontSize: AppFontSize.twentyEight,
                      isForeground: true,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: media.height * 0.04,
                    ),
                    const CommonText(
                      text: "SUKUMAR RAJA",
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                      fontColor: AppColors.primary,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              height: media.height,
              // color: AppColors.tertiaryColor,
              child: Column(
                children: [
                  SvgPicture.asset("assets/svgs/mastercard.svg"),
                  SizedBox(
                    height: media.height * 0.06,
                  ),
                  const CommonText(
                    text: "**** **** **** 1234",
                    fontColor: AppColors.secondary,
                  ),
                  SizedBox(
                    height: media.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const CommonText(
                        text: "* interest balance",
                        fontSize: AppFontSize.twelve,
                      ),
                      SizedBox(
                        width: media.width * 0.02,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
