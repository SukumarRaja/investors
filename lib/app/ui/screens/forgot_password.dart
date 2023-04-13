import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/auth.dart';
import '../themes/colors.dart';
import '../themes/font_size.dart';
import '../widgets/common/common_loading.dart';
import '../widgets/common/common_text.dart';
import '../widgets/common/common_textform_field.dart';
import 'otp_verify.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool isVerify = false;
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
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Icon(Icons.arrow_back_ios,color: AppColors.secondPrimary,),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: media.width * 0.01),
                              child: const CommonText(
                                text: "Forgot Password",
                                fontSize: AppFontSize.twentyFour,
                                fontWeight: FontWeight.w100,
                                fontColor: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                        Center(child: SvgPicture.asset("assets/svgs/forgot.svg",height: Get.height*0.5,)),
                        // SizedBox(
                        //   height: media.height * 0.09,
                        // ),
                        SizedBox(
                          height: media.height * 0.02,
                        ),
                        Form(
                            key: AuthController.to.validateEmailKey,
                            child: Column(
                              children: [
                                CommonTextFormField(
                                  hintText: "Enter your email",
                                  controller: AuthController.to.vEmail,
                                  prefixIcon: Icons.email,
                                  validator: (data) {
                                    if (data!.isEmpty || data == "") {
                                      return "Email field required";
                                    } else if (!data.contains("@")) {
                                      return "Enter valid email address";
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            )),
                        SizedBox(
                          height: media.width * 0.06,
                        ),
                        GestureDetector(
                          onTap: () {
                            // if (AuthController.to.validateEmailKey.currentState!
                            //     .validate()) {
                            //   AuthController.to.validateEmailForForgotPassword();
                            // }
                            Get.to(()=>const OtpVerify());
                          },
                          child: Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width - 40,
                              height: 50,
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
                              child: const Center(
                                child: CommonText(
                                  text: "SEND OTP",
                                  fontColor: AppColors.white,
                                  fontSize: AppFontSize.twenty,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: media.height * 0.02,
                        ),
                      ],
                    ),
                    Obx(() => AuthController.to.emailValidateLoading == true
                        ? Container(
                            height: media.height,
                            width: media.width,
                            color: AppColors.black.withOpacity(.6),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CommonNormalLoading(),
                                SizedBox(
                                  height: media.height * 0.02,
                                ),
                                const CommonText(
                                  text: "Please wait...",
                                  fontColor: AppColors.white,
                                )
                              ],
                            ))
                        : const SizedBox())
                  ],
                ),
              ),
            )));
  }
}
