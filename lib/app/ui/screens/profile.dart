import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investors/app/config/config.dart';

import '../../utility/utility.dart';
import '../themes/colors.dart';
import '../themes/font_size.dart';
import '../widgets/common/common_text.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              gradient: LinearGradient(
                  colors: [AppColors.primary, AppColors.secondary],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(AppConfig.noImage)),
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.white.withOpacity(.2),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: const Offset(0.2, 0.6))
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: "Test User",
                            fontColor: AppColors.white,
                            fontSize: AppFontSize.twentyFour,
                            fontWeight: FontWeight.bold,
                          ),
                          CommonText(
                            text: "1234567890",
                            fontColor: AppColors.grey,
                            fontSize: AppFontSize.sixteen,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColors.white.withOpacity(.2),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: const Offset(0.2, 0.6))
                                ]),
                            child: Stack(
                              children: [
                                Center(
                                  child: CommonText(
                                    text: "\u20B9 56,269",
                                    // fontColor: AppColors.secondPrimary,
                                    foreground: Paint()
                                      ..shader = mainAmountGradient,
                                    fontSize: AppFontSize.twentyFour,
                                    isForeground: true,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: 2,
                                    child: CommonText(
                                      text: "* interest",
                                      fontSize: AppFontSize.twelve,
                                    ))
                              ],
                            )




                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 90,
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(15),
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
                                  colors: [
                                    AppColors.primary,
                                    AppColors.secondary
                                  ],
                                  begin: Alignment.topRight,
                                  end: Alignment.topLeft),
                            ),
                            child: CommonText(
                              text: "Withdraw",
                              fontSize: AppFontSize.twenty,
                              fontColor: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 5.0, bottom: 5.0, right: 25, left: 25),
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
                              children: [
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
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                    ),
                    SizedBox(
                      height: media.height * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.white.withOpacity(.5),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(0.2, 0.6)),
                              ],
                            ),
                            child: Icon(Icons.person),
                          ),
                          SizedBox(
                            width: media.width * 0.06,
                          ),
                          CommonText(
                            text: "Profile",
                            fontColor: AppColors.white,
                            fontSize: AppFontSize.twenty,
                          ),
                          Spacer(),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.white.withOpacity(.5),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(0.2, 0.6)),
                              ],
                            ),
                            child: Icon(Icons.keyboard_arrow_right),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: media.height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.white.withOpacity(.5),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(0.2, 0.6)),
                              ],
                            ),
                            child: Icon(Icons.settings),
                          ),
                          SizedBox(
                            width: media.width * 0.06,
                          ),
                          CommonText(
                            text: "Settings",
                            fontColor: AppColors.white,
                            fontSize: AppFontSize.twenty,
                          ),
                          Spacer(),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.white.withOpacity(.5),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(0.2, 0.6)),
                              ],
                            ),
                            child: Icon(Icons.keyboard_arrow_right),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: media.height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.white.withOpacity(.5),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(0.2, 0.6)),
                              ],
                            ),
                            child: Icon(Icons.lock),
                          ),
                          SizedBox(
                            width: media.width * 0.06,
                          ),
                          CommonText(
                            text: "Change Password",
                            fontColor: AppColors.white,
                            fontSize: AppFontSize.twenty,
                          ),
                          Spacer(),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.white.withOpacity(.5),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(0.2, 0.6)),
                              ],
                            ),
                            child: Icon(Icons.keyboard_arrow_right),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: media.height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.white.withOpacity(.5),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(0.2, 0.6)),
                              ],
                            ),
                            child: Icon(Icons.insert_drive_file_sharp),
                          ),
                          SizedBox(
                            width: media.width * 0.06,
                          ),
                          CommonText(
                            text: "Reports",
                            fontColor: AppColors.white,
                            fontSize: AppFontSize.twenty,
                          ),
                          Spacer(),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.white.withOpacity(.5),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(0.2, 0.6)),
                              ],
                            ),
                            child: Icon(Icons.keyboard_arrow_right),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: media.height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.white.withOpacity(.5),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(0.2, 0.6)),
                              ],
                            ),
                            child: Icon(Icons.file_copy),
                          ),
                          SizedBox(
                            width: media.width * 0.06,
                          ),
                          CommonText(
                            text: "E-Statement",
                            fontColor: AppColors.white,
                            fontSize: AppFontSize.twenty,
                          ),
                          Spacer(),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.white.withOpacity(.5),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(0.2, 0.6)),
                              ],
                            ),
                            child: Icon(Icons.keyboard_arrow_right),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: media.height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.white.withOpacity(.5),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(0.2, 0.6)),
                              ],
                            ),
                            child: Icon(Icons.question_answer),
                          ),
                          SizedBox(
                            width: media.width * 0.06,
                          ),
                          CommonText(
                            text: "FAQ",
                            fontColor: AppColors.white,
                            fontSize: AppFontSize.twenty,
                          ),
                          Spacer(),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.white.withOpacity(.5),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(0.2, 0.6)),
                              ],
                            ),
                            child: Icon(Icons.keyboard_arrow_right),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 2,
                  child: Container(
                    alignment: Alignment.center,
                    // width: 90,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(15),
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
                          colors: [
                            AppColors.primary,
                            AppColors.secondary
                          ],
                          begin: Alignment.topRight,
                          end: Alignment.topLeft),
                    ),
                    child: Column(
                      children: [
                        CommonText(
                          text: "Invest Amount",
                          fontSize: AppFontSize.eighteen,
                          fontColor: AppColors.white,
                        ),
                        CommonText(
                          text: "\u20B9 5,35,363",
                          fontSize: AppFontSize.twenty,
                          fontColor: AppColors.white,
                        ),
                      ],
                    ),
                  ),
                )
                // Padding(
                //   padding: EdgeInsets.only(top: media.height / 2.2),
                //   child: ListView.builder(
                //       itemCount: 15,
                //       shrinkWrap: true,
                //       itemBuilder: (context, int index) {
                //         return const TransactionHistoryCard();
                //       }),
                // ),
              ],
            )),
      ),
    );
  }

  Column buildContainer({required context}) {
    var media = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.secondPrimary,
              boxShadow: [
                BoxShadow(
                    color: AppColors.white.withOpacity(.2),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0.2, 0.6))
              ]),
          child: const Icon(
            Icons.send,
          ),
        ),
        SizedBox(
          height: media.height * 0.007,
        ),
        const CommonText(
          text: "Send",
          fontColor: AppColors.secondPrimary,
          fontSize: AppFontSize.fifteen,
        ),
      ],
    );
  }

  Column buildWhiteContainer({required context}) {
    var media = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // color: AppColors.primary,
            border: Border.all(color: AppColors.white, width: 2),
          ),
          child: const Icon(
            Icons.analytics,
            color: AppColors.white,
          ),
        ),
        SizedBox(
          height: media.height * 0.007,
        ),
        const CommonText(
          text: "Analytics",
          fontColor: AppColors.white,
          fontSize: AppFontSize.fifteen,
        ),
      ],
    );
  }
}
