import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../themes/colors.dart';
import '../../themes/font_size.dart';
import '../../widgets/common/common_text.dart';
import '../../widgets/profile/view/amount_and_interest.dart';
import '../../widgets/profile/view/bank.dart';
import '../../widgets/profile/view/personal.dart';
import '../../widgets/profile/view/professional.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          maintainBottomViewPadding: true,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.white,
                            size: 20,
                          ),
                          CommonText(
                            text: "Profile",
                            fontSize: AppFontSize.twentyFour,
                            fontWeight: FontWeight.w100,
                            fontColor: AppColors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                  const AmountAndInterestCard(),
                  const PersonalInfoCard(),
                  const BankInfoCard(),
                  const ProfessionalInfoCard(),
                  SizedBox(height: 30,)
                ],
              ),
            ),
          ),
        ));
  }
}
