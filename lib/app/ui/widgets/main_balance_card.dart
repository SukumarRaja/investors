import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../controller/dashboard.dart';
import '../../utility/utility.dart';
import '../themes/colors.dart';
import '../themes/font_size.dart';
import 'common/common_text.dart';

class MainBalanceCard extends StatelessWidget {
  const MainBalanceCard({Key? key, this.isLoading}) : super(key: key);
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var amount = "";
    if (isLoading == false) {
      var i = stringToDouble(
          text: DashboardController.to.profileDetails.investment);
      amount = formatAmount(amount: i);
    }

    return Container(
      height: media.height * 0.2,
      width: media.width,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
              color: isLoading == false
                  ? AppColors.white.withOpacity(.5)
                  : Colors.transparent,
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0.4, 0.2))
        ],
        gradient: isLoading == false
            ? const LinearGradient(colors: [
                AppColors.primary,
                AppColors.secondPrimary,
              ], begin: Alignment.topRight, end: Alignment.center)
            : null,
      ),
      child: isLoading == true
          ? Shimmer.fromColors(
              baseColor: Colors.transparent,
              highlightColor: Colors.white,
              loop: 6,
              child: Container(
                height: media.height,
                color: Colors.grey.withOpacity(.3),
              ),
            )
          : Row(
              children: [
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: media.height,
                    // color: AppColors.secondaryColor,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: media.width * 0.04),
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
                            text: "\u20B9 $amount",
                            // fontColor: AppColors.secondPrimary,
                            foreground: Paint()..shader = mainAmountGradient,
                            fontSize: AppFontSize.twentyEight,
                            isForeground: true,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: media.height * 0.04,
                          ),
                          CommonText(
                            text: DashboardController.to.profileDetails.name
                                .toString()
                                .toUpperCase(),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: AppColors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: isLoading == false
                                            ? AppColors.white.withOpacity(.2)
                                            : Colors.transparent,
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                        offset: const Offset(0.4, 0.2))
                                  ],
                                ),
                                child: Image.asset("assets/images/logo.png",height: 40,width: 60,)),
                            SizedBox(width: media.width*0.04,)
                          ],
                        ),
                        // SvgPicture.asset("assets/svgs/mastercard.svg"),
                        SizedBox(
                          height: media.height * 0.06,
                        ),
                        CommonText(
                          text: DashboardController
                              .to.profileDetails.bankAccnumber
                              .toString()
                              .replaceAllMapped(RegExp(r".{4}"),
                                  (match) => "${match.group(0)} "),
                          fontColor: AppColors.secondary,
                        ),
                        SizedBox(
                          height: media.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const CommonText(
                              text: "* total balance",
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
