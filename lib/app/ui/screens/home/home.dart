import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investors/app/ui/widgets/common/common_loading.dart';
import 'package:investors/app/ui/widgets/common/no-data.dart';
import 'package:shimmer/shimmer.dart';
import '../../../controller/dashboard.dart';
import '../../themes/colors.dart';
import '../../themes/font_size.dart';
import '../../widgets/common/common_alert.dart';
import '../../widgets/common/common_text.dart';
import '../../widgets/main_balance_card.dart';
import '../../widgets/transaction_history_card_home.dart';

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
                    // user name
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: media.width * 0.04,
                          vertical: media.height * 0.02),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Obx(() => CommonText(
                                text:
                                    "Hello, ${DashboardController.to.profileDetails.name ?? "..."} ",
                                fontColor: AppColors.white,
                                fontSize: AppFontSize.twenty,
                                fontWeight: FontWeight.w500,
                              )),
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

                    // main interest balance card
                    Obx(() => DashboardController.to.getProfileLoading == true
                        ? const MainBalanceCard(
                            isLoading: true,
                          )
                        : const MainBalanceCard(
                            isLoading: false,
                          )),
                    SizedBox(
                      height: media.height * 0.03,
                    ),

                    // four menus
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildContainer(
                            context: context,
                            onPressed: () {
                              successAlert(context,
                                  content: "Coming soon...",
                                  confirmButtonPressed: () {
                                Get.back();
                              });
                            }),
                        buildWhiteContainer(
                            context: context,
                            title: "Analytics",
                            icon: Icons.bar_chart,
                            onPressed: () {
                              successAlert(context,
                                  content: "Coming soon...",
                                  confirmButtonPressed: () {
                                Get.back();
                              });
                            }),
                        buildWhiteContainer(
                            context: context,
                            title: "Chart",
                            icon: Icons.pie_chart,
                            onPressed: () {
                              successAlert(context,
                                  content: "Coming soon...",
                                  confirmButtonPressed: () {
                                Get.back();
                              });
                            }),
                        buildWhiteContainer(
                            context: context,
                            title: "Add Card",
                            icon: Icons.credit_card,
                            onPressed: () {
                              successAlert(context,
                                  content: "Coming soon...",
                                  confirmButtonPressed: () {
                                Get.back();
                              });
                            }),
                      ],
                    ),
                    SizedBox(
                      height: media.height * 0.03,
                    ),

                    // recent transactions text
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

                // recent transactions list
                Obx(() => DashboardController.to.getLedgerLoading == true
                    ? Padding(
                        padding: EdgeInsets.only(top: media.height / 1.95),
                        child: const CommonLoading(
                          size: 100,
                        ),
                      )
                    : DashboardController.to.isLedgerEmpty == true
                        ? Padding(
                            padding: EdgeInsets.only(top: media.height / 2),
                            child: const NoData(msg: "No Recent Transactions"),
                          )
                        : Padding(
                            padding: EdgeInsets.only(top: media.height / 1.95),
                            child: ListView.builder(
                                itemCount:
                                    DashboardController.to.ledgerDetails.length,
                                shrinkWrap: true,
                                itemBuilder: (context, int index) {
                                  return TransactionHistoryCardHome(
                                      index: index);
                                }),
                          )),
              ],
            )),
      ),
    );
  }

  GestureDetector buildContainer(
      {required context, required Function() onPressed}) {
    var media = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onPressed,
      child: Column(
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
            text: "Invest",
            fontColor: AppColors.secondPrimary,
            fontSize: AppFontSize.fifteen,
          ),
        ],
      ),
    );
  }

  GestureDetector buildWhiteContainer(
      {required context,
      required title,
      required icon,
      required Function() onPressed}) {
    var media = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // color: AppColors.primary,
              border: Border.all(color: AppColors.white, width: 2),
            ),
            child: Icon(
              icon,
              color: AppColors.white,
            ),
          ),
          SizedBox(
            height: media.height * 0.007,
          ),
          CommonText(
            text: title,
            fontColor: AppColors.white,
            fontSize: AppFontSize.fifteen,
          ),
        ],
      ),
    );
  }
}
