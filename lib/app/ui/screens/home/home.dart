import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../config/config.dart';
import '../../../utility/utility.dart';
import '../../themes/colors.dart';
import '../../themes/font_size.dart';
import '../../widgets/common/common_text.dart';
import '../../widgets/transaction_history_card.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: media.width * 0.04,
                          vertical: media.height * 0.02),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CommonText(
                            text: "Hello, User",
                            fontColor: AppColors.white,
                            fontSize: AppFontSize.twenty,
                            fontWeight: FontWeight.w500,
                          ),
                          const Spacer(),
                          GestureDetector(
                              onTap: () {
                                // Get.to(() => const Notifications());
                              },
                              child: const Icon(
                                Icons.notifications_none,
                                color: AppColors.white,
                              ))
                        ],
                      ),
                    ),
                    Container(
                      height: media.height * 0.2,
                      width: media.width,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.white.withOpacity(.5),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0.4, 0.2))
                        ],
                        gradient: const LinearGradient(colors: [
                          AppColors.primary,
                          AppColors.secondPrimary,
                        ], begin: Alignment.topRight, end: Alignment.center),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              height: media.height,
                              // color: AppColors.secondaryColor,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: media.width * 0.04),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: media.height * 0.02,
                                    ),
                                    const CommonText(
                                      text: "Balance",
                                      fontColor: AppColors.black,
                                    ),
                                    SizedBox(
                                      height: media.height * 0.01,
                                    ),
                                    CommonText(
                                      text: "\u20B9 56,269",
                                      // fontColor: AppColors.secondPrimary,
                                      foreground: Paint()
                                        ..shader = mainAmountGradient,
                                      fontSize: AppFontSize.twentyEight,
                                      isForeground: true,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    SizedBox(
                                      height: media.height * 0.04,
                                    ),
                                    CommonText(
                                      text: "SUKUMAR RAJA",
                                      // foreground: Paint()
                                      //   ..shader = nameGradient,
                                      // fontSize: AppFontSize.twenty,
                                      // isForeground: true,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 1,
                                      fontColor: AppColors.primary,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              height: media.height,
                              // color: AppColors.tertiaryColor,
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                      "assets/svgs/mastercard.svg"),
                                  SizedBox(
                                    height: media.height * 0.06,
                                  ),
                                  const CommonText(
                                    text: "**** **** **** 1234",
                                    fontColor: AppColors.secondary,
                                  ),
                                  SizedBox(
                                    height: media.height * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      CommonText(
                                        text: "* interest balance",
                                        fontSize: AppFontSize.twelve,
                                      ),
                                      SizedBox(
                                        width: media.width * 0.02,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: media.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildContainer(context: context),
                        buildWhiteContainer(context: context),
                        buildWhiteContainer(context: context),
                        buildWhiteContainer(context: context),
                      ],
                    ),
                    SizedBox(
                      height: media.height * 0.03,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: CommonText(
                        text: "Recent Transactions",
                        fontColor: AppColors.white,
                        fontSize: AppFontSize.eighteen,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: media.height / 1.95),
                  child: ListView.builder(
                      itemCount: 15,
                      shrinkWrap: true,
                      itemBuilder: (context, int index) {
                        return const TransactionHistoryCard();
                      }),
                ),
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
