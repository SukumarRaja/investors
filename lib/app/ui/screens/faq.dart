import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controller/faq.dart';
import '../themes/colors.dart';
import '../themes/font_size.dart';
import '../widgets/clipers/bottom_wave.dart';
import '../widgets/common/common_text.dart';
import '../widgets/faq/question_and_answer_card.dart';

class Faq extends StatelessWidget {
  const Faq({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: Get.height,
          decoration: const BoxDecoration(
            color: AppColors.primary,
            gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.secondary],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.arrow_back_ios,
                                color: AppColors.white,
                                size: 20,
                              ),
                              CommonText(
                                text: "FAQ",
                                fontSize: AppFontSize.twenty,
                                fontWeight: FontWeight.w100,
                                fontColor: AppColors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                    child: SvgPicture.asset(
                      "assets/svgs/faq.svg",color: AppColors.gradient,
                      height: media.height / 4,
                    )),
                const CommonText(
                  text: "FAQ",
                  letterSpacing: 0.9,
                  fontWeight: FontWeight.bold,
                  fontSize: AppFontSize.twentyFour,
                  fontColor: AppColors.white,
                ),
                Container(
                  height: 3,
                  margin: const EdgeInsets.only(top: 2),
                  width: 22,
                  color: AppColors.primary,
                ),
                SizedBox(height: media.width * 0.05),

                Container(
                  height: 250,
                  child: SizedBox(
                    height: media.height,
                    child: ListView.builder(
                        itemCount: 30,
                        shrinkWrap: true,
                        // primary: true,
                        physics: const ScrollPhysics(),
                        itemBuilder: (context, int index) {
                          return QuestionAndAnswerCard(
                            index: index,
                            question: "How to logout",
                            answer:
                            "klhkjhkjhkjlhjklhljkhjkhjkhkjhkjhkj QuestionAndAnswerCardQuestionAndAnswerCardQuestionAndAnswerCardQuestionAndAnswerCardQuestionAndAnswerCardQuestionAndAnswerCardQuestionAndAnswerCard",
                            onPressed: () {
                              if (FaqController.to.faqSelectedIndex == index) {
                                FaqController.to.faqSelectedIndex = 150;
                              } else {
                                FaqController.to.faqSelectedIndex = index;
                              }
                            },
                          );
                        }),
                  ),
                ),
                SizedBox(height: media.height*0.02,)
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ClipPath buildClipPath() {
  //   return ClipPath(
  //       clipper: WaveClipperTwo(reverse: true),
  //       child: Container(
  //         height: 70,
  //         decoration: BoxDecoration(
  //           // borderRadius: BorderRadius.circular(0.0),
  //           color: AppColors.yellow,
  //           gradient:  LinearGradient(
  //               colors: [AppColors.primary, AppColors.gradient],
  //               begin: Alignment.topRight,
  //               end: Alignment.topLeft),
  //         ),
  //         // child: const Center(
  //         //     child: Padding(
  //         //       padding: EdgeInsets.only(top: 50.0),
  //         //       child: CommonText(
  //         //         text: "Primedix",
  //         //         fontColor: AppColors.white,
  //         //         fontWeight: FontWeight.bold,
  //         //         letterSpacing: 1,
  //         //       ),
  //         //     )),
  //       ));
  // }
}
