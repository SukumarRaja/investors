import 'package:flutter/material.dart';

import '../../../utility/utility.dart';
import '../../themes/colors.dart';
import '../../themes/font_size.dart';
import '../common/common_text.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Column(
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(right: 10,left: 10,bottom: 5),
            width: media.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: AppColors.primary,
              boxShadow: [
                BoxShadow(
                    color: AppColors.white.withOpacity(.4),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0.4, 0.6)),
              ],
              gradient: const LinearGradient(
                  colors: [AppColors.primary, AppColors.secondary],
                  begin: Alignment.topRight,
                  end: Alignment.topLeft),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: "Investment Amount",
                        fontColor: AppColors.white.withOpacity(.8),
                        fontSize: AppFontSize.sixteen,
                        letterSpacing: 1,
                      ),
                      CommonText(
                        text: "Withdrawal Amount",
                        fontColor: AppColors.white.withOpacity(.8),
                        fontSize: AppFontSize.sixteen,
                        letterSpacing: 1,
                      ),
                      CommonText(
                        text: "Profit Amount",
                        fontColor: AppColors.white.withOpacity(.8),
                        fontSize: AppFontSize.sixteen,
                        letterSpacing: 1,
                      ),
                      CommonText(
                        text: "Last Investment",
                        fontColor: AppColors.white.withOpacity(.8),
                        fontSize: AppFontSize.sixteen,
                        letterSpacing: 1,
                      ),
                      CommonText(
                        text: "Last Withdrawal",
                        fontColor: AppColors.white.withOpacity(.8),
                        fontSize: AppFontSize.sixteen,
                        letterSpacing: 1,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: media.width * 0.06,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: ":",
                        fontColor: AppColors.white.withOpacity(.8),
                        fontSize: AppFontSize.sixteen,
                        letterSpacing: 1,
                      ),
                      CommonText(
                        text: ":",
                        fontColor: AppColors.white.withOpacity(.8),
                        fontSize: AppFontSize.sixteen,
                        letterSpacing: 1,
                      ),
                      CommonText(
                        text: ":",
                        fontColor: AppColors.white.withOpacity(.8),
                        fontSize: AppFontSize.sixteen,
                        letterSpacing: 1,
                      ),
                      CommonText(
                        text: ":",
                        fontColor: AppColors.white.withOpacity(.8),
                        fontSize: AppFontSize.sixteen,
                        letterSpacing: 1,
                      ),
                      CommonText(
                        text: ":",
                        fontColor: AppColors.white.withOpacity(.8),
                        fontSize: AppFontSize.sixteen,
                        letterSpacing: 1,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: media.width * 0.1,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: addSpace(text: "\u20B9 20,000"),
                        fontColor: AppColors.white.withOpacity(.8),
                        fontSize: AppFontSize.sixteen,
                        letterSpacing: 1,
                      ),
                      CommonText(
                        text: "\u20B9 5,000",
                        fontColor: Colors.red,
                        fontSize: AppFontSize.sixteen,
                        letterSpacing: 1,
                      ),
                      CommonText(
                        text: "\u20B9 3,000",
                        fontColor: AppColors.green,
                        fontSize: AppFontSize.sixteen,
                        letterSpacing: 1,
                      ),
                      CommonText(
                        text: "\u20B9 500",
                        fontColor: AppColors.white.withOpacity(.8),
                        fontSize: AppFontSize.sixteen,
                        letterSpacing: 1,
                      ),
                      CommonText(
                        text: "\u20B9 0",
                        fontColor: AppColors.white.withOpacity(.8),
                        fontSize: AppFontSize.sixteen,
                        letterSpacing: 1,
                      ),
                    ],
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
