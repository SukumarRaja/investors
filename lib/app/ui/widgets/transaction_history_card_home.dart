import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/dashboard.dart';
import '../../utility/utility.dart';
import '../themes/colors.dart';
import '../themes/font_size.dart';
import 'common/common_text.dart';

class TransactionHistoryCardHome extends StatelessWidget {
  const TransactionHistoryCardHome({Key? key, required this.index})
      : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    var ca = stringToDouble(
        text: "${DashboardController.to.ledgerDetails[index].amount}");
    var creditAmount = formatAmount(amount: ca);
    var d = getIsoToLocalDate(
        date: "${DashboardController.to.ledgerDetails[index].createdOn}");
    var da = monthNameToMonthNumber(date: d);
    var date = months(month: da);
    print("month is: $date");
    var media = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
            alignment: Alignment.center,
            height: 70,
            width: 70,
            margin:
                const EdgeInsets.only(right: 15, left: 15, bottom: 8, top: 2),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
                gradient: const LinearGradient(
                    colors: [AppColors.primary, AppColors.secondary],
                    begin: Alignment.topRight,
                    end: Alignment.topLeft),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.white.withOpacity(.2),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0.2, 0.6))
                ]),
            child: CommonText(
              text: getIsoToLocalDate(
                  date:
                      "${DashboardController.to.ledgerDetails[index].createdOn}"),
              fontColor: AppColors.white,
              fontWeight: FontWeight.bold,
              fontSize: AppFontSize.sixteen,
              textAlign: TextAlign.center,
            )),
        SizedBox(
          width: media.height * 0.02,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              text:
                  "${date.capitalize} ${DashboardController.to.ledgerDetails[index].amountType == "Cr" ? "Interest Credited" : "Withdraw"}",
              fontWeight: FontWeight.bold,
              fontColor: AppColors.secondPrimary,
            ),
            Row(
              children: [
                const CommonText(
                  text: "Time : ",
                  fontSize: AppFontSize.fourteen,
                  fontColor: AppColors.grey,
                  fontFamily: "GtAmerica-Thin",
                ),
                CommonText(
                  text: getIsoToLocalTime(
                      date:
                          "${DashboardController.to.ledgerDetails[index].createdOn}"),
                  fontSize: AppFontSize.fourteen,
                  fontColor: AppColors.grey,
                  fontFamily: "GtAmerica-Thin",
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CommonText(
              text: "\u20B9 $creditAmount",
              fontWeight: FontWeight.bold,
              fontColor: AppColors.white,
              fontFamily: "GtAmerica-Standard-Black",
            ),
            CommonText(
              text:
                  DashboardController.to.ledgerDetails[index].amountType == "Cr"
                      ? "Credited"
                      : "Debited",
              fontSize: AppFontSize.fourteen,
              fontColor:
                  DashboardController.to.ledgerDetails[index].amountType == "Cr"
                      ? AppColors.green
                      : AppColors.red,
              fontFamily: "GtAmerica-Thin",
            ),
          ],
        ),
        SizedBox(
          width: media.height * 0.02,
        ),
      ],
    );
  }
}
