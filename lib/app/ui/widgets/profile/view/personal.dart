import 'package:flutter/material.dart';
import 'package:investors/app/controller/dashboard.dart';
import '../../../../config/config.dart';
import '../../../themes/colors.dart';
import '../../../themes/font_size.dart';
import '../../common/common_text.dart';

class PersonalInfoCard extends StatelessWidget {
  const PersonalInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: CommonText(
                text: "Personal Details",
                fontColor: AppColors.white,
                fontSize: AppFontSize.twenty,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                fontFamily: "GtAmerica-Standard-Black",
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width - 40,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: "${DashboardController.to.profileDetails.name}",
                          fontColor: AppColors.white,
                          fontSize: AppFontSize.twenty,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                        CommonText(
                          text:
                              "${DashboardController.to.profileDetails.mobile}, ${DashboardController.to.profileDetails.mobile2}",
                          fontColor: AppColors.white.withOpacity(.8),
                          fontSize: AppFontSize.sixteen,
                          letterSpacing: 1,
                        ),
                        CommonText(
                          text:
                              "${DashboardController.to.profileDetails.email}",
                          fontColor: AppColors.white.withOpacity(.8),
                          fontSize: AppFontSize.sixteen,
                          letterSpacing: 1,
                        ),
                        CommonText(
                          text:
                              "Address:\n${DashboardController.to.profileDetails.address}, ${DashboardController.to.profileDetails.city}",
                          fontColor: AppColors.white.withOpacity(.8),
                          textAlign: TextAlign.start,
                          fontSize: AppFontSize.sixteen,
                          letterSpacing: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
            right: 45,
            top: 10,
            child: Container(
              height: 90,
              width: 90,
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
            ))
      ],
    );
  }
}
