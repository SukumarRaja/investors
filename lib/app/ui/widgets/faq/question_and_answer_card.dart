import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/faq.dart';
import '../../themes/colors.dart';
import '../../themes/font_size.dart';
import '../common/common_text.dart';


class QuestionAndAnswerCard extends StatelessWidget {
  const QuestionAndAnswerCard(
      {Key? key,
      required this.question,
      required this.answer,
      required this.onPressed,
      required this.index})
      : super(key: key);
  final String question;
  final String answer;
  final Function() onPressed;
  final int index;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: onPressed,
            child: Row(
              children: [
                SizedBox(width: media.width * 0.04),
                CommonText(
                  text: question,
                  fontWeight: FontWeight.w500,
                  fontSize: AppFontSize.eighteen,
                  fontColor: AppColors.white,
                ),
                const Spacer(),
                const Icon(
                  Icons.add,
                  color: AppColors.white,
                ),
                SizedBox(width: media.width * 0.04)
              ],
            ),
          ),
          SizedBox(height: media.width * 0.01),
          Obx(() => FaqController.to.faqSelectedIndex == index
              ? Padding(
                  padding: EdgeInsets.only(
                      right: media.width * 0.04, left: media.width * 0.04),
                  child: CommonText(
                    text: answer,
                    textAlign: TextAlign.start,
                    fontColor: AppColors.white.withOpacity(0.4),
                    fontSize: AppFontSize.fourteen,
                  ),
                )
              : const SizedBox()),
          Padding(
            padding: EdgeInsets.only(
                right: media.width * 0.04, left: media.width * 0.04),
            child: Divider(
              color: AppColors.black.withOpacity(.4),
            ),
          )
        ],
      ),
    );
  }
}
