import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/dashboard.dart';
import '../../utility/utility.dart';
import '../themes/colors.dart';
import '../themes/font_size.dart';
import 'common/common_text.dart';

class TransactionHistoryCard extends StatelessWidget {
  const TransactionHistoryCard({Key? key, required this.index})
      : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    var a =
        stringToDouble(text: DashboardController.to.profileDetails.investment);
    var amount = formatAmount(amount: a);
    var ca = stringToDouble(
        text: "${DashboardController.to.ledgerDetails[index].amount}");
    var creditAmount = formatAmount(amount: ca);
    var d = getIsoToLocalDate(
        date: "${DashboardController.to.ledgerDetails[index].createdOn}");
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
        child: Stack(
          children: [
            Container(
                alignment: Alignment.center,
                height: 60,
                width: 60,
                margin: const EdgeInsets.only(right: 5, bottom: 25, top: 2),
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
                          "${DashboardController.to.ledgerDetails[index].createdOn}"),
                  fontColor: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: AppFontSize.sixteen,
                  textAlign: TextAlign.center,
                )),
            // Positioned(
            //   bottom: 0,
            //   child: Row(
            //     children: [
            //       CommonText(
            //         text: "Status : ",
            //         fontSize: AppFontSize.fourteen,
            //         fontColor: AppColors.black,
            //       ),
            //       CommonText(
            //         text: DashboardController.to.ledgerDetails[index].status ==
            //                 "0"
            //             ? "Pending"
            //             : "Completed",
            //         fontSize: AppFontSize.fourteen,
            //         fontColor:
            //             DashboardController.to.ledgerDetails[index].status ==
            //                     "0"
            //                 ? AppColors.sandal
            //                 : AppColors.secondary,
            //         fontWeight: FontWeight.w700,
            //       ),
            //     ],
            //   ),
            // ),
            const Positioned(
              bottom: 0,
              child: CommonText(
                text: "Closing Balance:",
                fontSize: AppFontSize.fourteen,
                fontColor: AppColors.black,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Row(
                children: [
                  CommonText(
                    text: "\u20B9 $amount",
                    fontSize: AppFontSize.fourteen,
                    fontColor: AppColors.secondary,
                  )
                ],
              ),
            ),
            Positioned(
              top: 18,
              bottom: 0,
              left: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text:
                        "${date.capitalize} ${DashboardController.to.ledgerDetails[index].amountType == "Cr" ? "Interest Credited" : "Withdraw"}",
                    fontWeight: FontWeight.bold,
                    fontColor: AppColors.black,
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
                                "${DashboardController.to.ledgerDetails[index].createdOn}"),
                        fontSize: AppFontSize.fourteen,
                        fontColor: AppColors.secondary,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 18,
              bottom: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CommonText(
                    text: "\u20B9 $creditAmount",
                    fontWeight: FontWeight.bold,
                    isForeground: true,
                    fontSize: AppFontSize.twenty,
                    foreground: Paint()..shader = historyAmountGradient,
                  ),
                  CommonText(
                    text: DashboardController
                                .to.ledgerDetails[index].amountType ==
                            "Cr"
                        ? "Credited"
                        : "Debited",
                    fontSize: AppFontSize.fourteen,
                    fontColor: DashboardController
                                .to.ledgerDetails[index].amountType ==
                            "Cr"
                        ? AppColors.green
                        : AppColors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
