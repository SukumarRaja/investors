import 'package:flutter/material.dart';
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
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.white.withOpacity(.2),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: const Offset(0.2, 0.6))
                          ]),
                      child: Center(
                        child: Column(
                          children: [
                            CommonText(
                              text: "\u20B9 56,269",
                              // fontColor: AppColors.secondPrimary,
                              foreground: Paint()..shader = mainAmountGradient,
                              fontSize: AppFontSize.fifty,
                              isForeground: true,
                              fontWeight: FontWeight.w500,
                            ),
                            const CommonText(
                              text: "Your Balance",
                              fontColor: AppColors.grey,
                              fontSize: AppFontSize.twenty,
                            ),
                          ],
                        ),
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
                        text: "Transactions",
                        fontColor: AppColors.white,
                        fontSize: AppFontSize.eighteen,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: media.height / 2.2),
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
