import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:investors/app/config/config.dart';
import '../../controller/dashboard.dart';
import '../../utility/utility.dart';
import '../themes/colors.dart';
import '../themes/font_size.dart';
import '../widgets/common/common_alert.dart';
import '../widgets/common/common_text.dart';
import '../widgets/profile/interest_and_withdraw.dart';
import '../widgets/profile/transactions_count.dart';
import '../widgets/profile/profile_menu_card.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var i = stringToInt(text: DashboardController.to.profileDetails.investment);
    var amount = formatAmount(amount: i);
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
                  children: [
                    // user photo
                    Container(
                      height: 90,
                      width: 90,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  "${AppConfig.imageUrl}${DashboardController.to.profileDetails.photos}" ==
                                              "" ||
                                          // ignore: unnecessary_null_comparison
                                          "${AppConfig.imageUrl}${DashboardController.to.profileDetails.photos}" ==
                                              null
                                      ? AppConfig.noImage
                                      : "${AppConfig.imageUrl}${DashboardController.to.profileDetails.photos}")),
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.white.withOpacity(.2),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: const Offset(0.2, 0.6))
                          ]),
                    ),

                    //user name and number
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text:
                                "${DashboardController.to.profileDetails.name}",
                            fontColor: AppColors.white,
                            fontSize: AppFontSize.twentyFour,
                            fontWeight: FontWeight.bold,
                          ),
                          CommonText(
                            text:
                                "${DashboardController.to.profileDetails.mobile}",
                            fontColor: AppColors.grey,
                            fontSize: AppFontSize.sixteen,
                          ),
                        ],
                      ),
                    ),

                    // interest amount and withdraw button
                    const InterestAndWithdraw(),

                    // transactions count
                    const TransactionsCountCard(),
                    SizedBox(
                      height: media.height * 0.03,
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(top: media.height / 2.5),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // menus
                        ProfileMenuCard(
                          name: "Profile",
                          icon: "profile",
                          onPressed: () {},
                        ),
                        ProfileMenuCard(
                          name: "Change Password",
                          icon: "lock",
                          onPressed: () {},
                        ),
                        ProfileMenuCard(
                          name: "Reports",
                          icon: "reports",
                          onPressed: () {},
                        ),
                        ProfileMenuCard(
                          name: "E-Statement",
                          icon: "statement",
                          onPressed: () {},
                        ),
                        ProfileMenuCard(
                          name: "Settings",
                          icon: "settings",
                          onPressed: () {},
                        ),
                        ProfileMenuCard(
                          name: "FAQ",
                          icon: "faq",
                          onPressed: () {},
                        ),
                        logoutButton(context, media)
                      ],
                    ),
                  ),
                ),

                // invest amount
                Positioned(
                  right: 2,
                  child: Container(
                    alignment: Alignment.center,
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
                          colors: [AppColors.primary, AppColors.secondary],
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
                          text: "\u20B9 $amount",
                          fontSize: AppFontSize.twenty,
                          fontColor: AppColors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  GestureDetector logoutButton(BuildContext context, Size media) {
    return GestureDetector(
      onTap: () {
        commonAlertDialog(context,
            content: "Are you sure logout", confirmButtonPressed: () {});
      },
      child: Container(
          alignment: Alignment.center,
          height: 50,
          width: media.width / 3,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(bottom: 8),
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
          child: const CommonText(
            text: "Logout",
            fontSize: AppFontSize.twenty,
            fontColor: AppColors.white,
          )),
    );
  }
}
