import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:investors/app/controller/dashboard.dart';
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
    var media = MediaQuery.of(context).size;
    var s = monthNameToMonthNumber(date: '2030-02-23');
    print("jkljkl $s");
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
                boxShadow: [
                  BoxShadow(
                      color: AppColors.white.withOpacity(.2),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0.2, 0.6))
                ]),
            child: CommonText(
              text:
                  "${monthNameToMonthNumber(date: "${DashboardController.to.ledgerDetails[index].withdrawOn}")}-${normalDateToIndividualYear(date: "${DashboardController.to.ledgerDetails[index].withdrawOn}")}",
              fontColor: AppColors.secondary,
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
              text: "May Interest",
              fontWeight: FontWeight.bold,
              fontColor: AppColors.white,
            ),
            CommonText(
              text: "Monthly interest credited",
              fontSize: AppFontSize.twelve,
              fontColor: AppColors.grey,
            ),
          ],
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CommonText(
              text:
                  "\u20B9 ${DashboardController.to.ledgerDetails[index].amount}",
              fontWeight: FontWeight.bold,
              fontColor: AppColors.white,
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
