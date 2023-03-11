import 'package:flutter/material.dart';

import '../../themes/colors.dart';
import '../../themes/font_size.dart';
import '../common/common_text.dart';

class TransactionsCountCard extends StatelessWidget {
  const TransactionsCountCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        padding:
            const EdgeInsets.only(top: 5.0, bottom: 5.0, right: 25, left: 25),
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
        child: Row(
          children: [
            SizedBox(
              width: media.width * 0.01,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CommonText(
                  text: "Credited",
                  fontColor: AppColors.grey,
                  textAlign: TextAlign.center,
                ),
                CommonText(
                  text: "2653",
                  fontColor: AppColors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: AppFontSize.twenty,
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CommonText(
                  text: "Debited",
                  fontColor: AppColors.grey,
                  textAlign: TextAlign.center,
                ),
                CommonText(
                  text: "545",
                  fontColor: AppColors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: AppFontSize.twenty,
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CommonText(
                  text: "Transactions",
                  fontColor: AppColors.grey,
                  textAlign: TextAlign.center,
                ),
                CommonText(
                  text: "89894",
                  fontColor: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: AppFontSize.twenty,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
