import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/dashboard.dart';
import '../../../../utility/utility.dart';
import '../../../themes/colors.dart';
import '../../../themes/font_size.dart';
import '../../common/common_text.dart';

class AmountAndInterestCard extends StatelessWidget {
  const AmountAndInterestCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var i =
        stringToDouble(text: DashboardController.to.profileDetails.investment);
    var amount = formatAmount(amount: i);

    var d = getIsoToLocalDate(
        date: "${DashboardController.to.profileDetails.investmentDate}");
    var da = monthNameToMonthNumber(date: d);
    var date = dateSeparate(date: d);
    var month = months(month: da);
    var year = yearSeparate(date: d);

    return Row(
      children: [
        Expanded(
          flex: 4,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              // alignment: Alignment.center,
              // height: 50,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CommonText(
                    text: "Account Balance",
                    fontSize: AppFontSize.twenty,
                    fontColor: AppColors.white,
                  ),
                  CommonText(
                    text: "\u20B9 $amount",
                    fontSize: AppFontSize.twenty,
                    fontColor: AppColors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              // alignment: Alignment.center,
              // height: 50,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: "\u20B9 $amount",
                    fontSize: AppFontSize.twenty,
                    fontColor: AppColors.white,
                  ),
                  CommonText(
                    text: "Invested on $date ${month.capitalize}, $year",
                    fontSize: AppFontSize.sixteen,
                    fontColor: AppColors.grey,
                  ),
                  CommonText(
                    text:
                        "Returns: ${DashboardController.to.profileDetails.returnsPercent}% (PER ANNUM)",
                    fontSize: AppFontSize.sixteen,
                    fontColor: AppColors.grey,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
