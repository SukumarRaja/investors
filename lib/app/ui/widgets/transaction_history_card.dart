import 'package:flutter/material.dart';

import '../themes/colors.dart';
import '../themes/font_size.dart';
import 'common/common_text.dart';

class TransactionHistoryCard extends StatelessWidget {
  const TransactionHistoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                boxShadow: [
                  BoxShadow(
                      color: AppColors.white.withOpacity(.2),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0.2, 0.6))
                ]),
            child: CommonText(
              text: "MAY\n2023",
              fontColor: AppColors.green,
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
              text: "\u20B9 1500",
              fontWeight: FontWeight.bold,
              fontColor: AppColors.white,
            ),
            CommonText(
              text: "Received",
              fontSize: AppFontSize.fourteen,
              fontColor: AppColors.green,
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
