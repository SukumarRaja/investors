import 'package:flutter/material.dart';
import '../../../../controller/dashboard.dart';
import '../../../../utility/utility.dart';
import '../../../themes/colors.dart';
import '../../../themes/font_size.dart';
import '../../common/common_text.dart';

class BankInfoCard extends StatelessWidget {
  const BankInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: CommonText(
            text: "Bank Account Details",
            fontColor: AppColors.white,
            fontSize: AppFontSize.twenty,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: "Account Number",
                          fontColor: AppColors.white.withOpacity(.8),
                          fontSize: AppFontSize.sixteen,
                          letterSpacing: 1,
                        ),
                        CommonText(
                          text: "IFSC Code",
                          fontColor: AppColors.white.withOpacity(.8),
                          fontSize: AppFontSize.sixteen,
                          letterSpacing: 1,
                        ),
                        CommonText(
                          text: "Bank Name",
                          fontColor: AppColors.white.withOpacity(.8),
                          fontSize: AppFontSize.sixteen,
                          letterSpacing: 1,
                        ),
                        CommonText(
                          text: "Bank Branch",
                          fontColor: AppColors.white.withOpacity(.8),
                          fontSize: AppFontSize.sixteen,
                          letterSpacing: 1,
                        ),
                        CommonText(
                          text: "Mode of Investment",
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
                      width: media.width * 0.02,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: addSpace(
                              text:
                                  "${DashboardController.to.profileDetails.bankAccnumber}"),
                          fontColor: AppColors.white.withOpacity(.8),
                          fontSize: AppFontSize.sixteen,
                          letterSpacing: 1,
                        ),
                        CommonText(
                          text:
                              "${DashboardController.to.profileDetails.bankIfsc}",
                          fontColor: AppColors.white.withOpacity(.8),
                          fontSize: AppFontSize.sixteen,
                          letterSpacing: 1,
                        ),
                        CommonText(
                          text:
                              "${DashboardController.to.profileDetails.bankName}",
                          fontColor: AppColors.white.withOpacity(.8),
                          fontSize: AppFontSize.sixteen,
                          letterSpacing: 1,
                        ),
                        CommonText(
                          text:
                              "${DashboardController.to.profileDetails.bankBranch}",
                          fontColor: AppColors.white.withOpacity(.8),
                          fontSize: AppFontSize.sixteen,
                          letterSpacing: 1,
                        ),
                        CommonText(
                          text:
                              "${DashboardController.to.profileDetails.paymentMode}",
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
        ),
      ],
    );
  }
}
