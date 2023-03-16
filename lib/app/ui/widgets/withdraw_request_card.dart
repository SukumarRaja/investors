import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/withdraw.dart';
import '../../utility/utility.dart';
import '../themes/colors.dart';
import '../themes/font_size.dart';
import 'common/common_text.dart';

class WithDrawRequestsCard extends StatelessWidget {
  const WithDrawRequestsCard({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    var a = stringToDouble(
        text: "${WithDrawController.to.withRequestsDetail[index].amount}.00");
    var amount = formatAmount(amount: a);
    var ca = stringToDouble(
        text: "${WithDrawController.to.withRequestsDetail[index].amount}.00");
    var creditAmount = formatAmount(amount: ca);
    var d = getIsoToLocalDate(
        date: "${WithDrawController.to.withRequestsDetail[index].requestedOn}");
    var da = monthNameToMonthNumber(date: d);
    var date = months(month: da);
    debugPrint("month is: $date");

    var media = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
      child: Container(
        width: media.width,
        padding:
            const EdgeInsets.only(top: 5.0, bottom: 5.0, right: 15, left: 15),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                color: AppColors.secondPrimary.withOpacity(.5),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(0.4, 0.6)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: 60,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.green.withOpacity(.4),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0.2, 0.6))
                      ],
                      gradient: const LinearGradient(
                          colors: [AppColors.primary, AppColors.secondary],
                          begin: Alignment.topRight,
                          end: Alignment.topLeft),
                    ),
                    child: CommonText(
                      text: getIsoToLocalDate(
                          date:
                              "${WithDrawController.to.withRequestsDetail[index].requestedOn}"),
                      fontColor: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: AppFontSize.sixteen,
                      textAlign: TextAlign.center,
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: "${date.capitalize}  Withdraw Request",
                      fontWeight: FontWeight.bold,
                      fontColor: AppColors.black,
                    ),
                    SizedBox(
                      height: media.height * 0.004,
                    ),
                    // Row(
                    //   children: [
                    //     const CommonText(
                    //       text: "Time : ",
                    //       fontSize: AppFontSize.fourteen,
                    //       fontColor: AppColors.black,
                    //     ),
                    //     CommonText(
                    //       text: getIsoToLocalTime(
                    //           date:
                    //               "${WithDrawController.to.withRequestsDetail[index].requestedOn}"),
                    //       fontSize: AppFontSize.fourteen,
                    //       fontColor: AppColors.secondary,
                    //       fontWeight: FontWeight.w700,
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
                Spacer(),
                CommonText(
                  text: "\u20B9 $creditAmount",
                  fontWeight: FontWeight.bold,
                  isForeground: true,
                  fontSize: AppFontSize.twentyFour,
                  foreground: Paint()..shader = historyAmountGradient,
                ),
              ],
            ),
            SizedBox(
              height: media.height * 0.008,
            ),
            Row(
              children: [
                const CommonText(
                  text: "Time : ",
                  fontSize: AppFontSize.fourteen,
                  fontColor: AppColors.black,
                ),
                CommonText(
                  text: getIsoToLocalTime(
                      date:
                          "${WithDrawController.to.withRequestsDetail[index].requestedOn}"),
                  fontSize: AppFontSize.fourteen,
                  fontColor: AppColors.secondary,
                  fontWeight: FontWeight.w700,
                ),
                Spacer(),
                CommonText(
                  text: "Status : ",
                  fontSize: AppFontSize.fourteen,
                  fontColor: AppColors.black,
                ),
                CommonText(
                  text:
                      "${WithDrawController.to.withRequestsDetail[index].status.toString().capitalize}",
                  fontSize: AppFontSize.fourteen,
                  fontColor:
                      WithDrawController.to.withRequestsDetail[index].status ==
                              "new"
                          ? AppColors.gradient
                          : WithDrawController
                                      .to.withRequestsDetail[index].status ==
                                  "approve"
                              ? AppColors.green
                              : AppColors.red,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            SizedBox(
              height: media.height * 0.008,
            ),
            Obx(() => WithDrawController.to.withRequestsDetail[index].status ==
                    "reject"
                ? CommonText(
                    text: "Reason : ${WithDrawController.to.withRequestsDetail[index].rejectReason}",
                    fontSize: AppFontSize.fifteen,
                    fontColor: AppColors.black.withOpacity(.5),
                    textAlign: TextAlign.justify,
                  )
                : SizedBox()),
          ],
        ),
      ),
    );
  }
}
