import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/auth.dart';
import '../themes/colors.dart';
import '../themes/font_size.dart';
import '../widgets/common/common_loading.dart';
import '../widgets/common/common_text.dart';
import '../widgets/common/common_textform_field.dart';
import 'login.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
          maintainBottomViewPadding: true,
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
                          child: Icon(Icons.arrow_back_ios),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: media.width * 0.01),
                        child: const CommonText(
                          text: "Set Password",
                          fontSize: AppFontSize.twentyFour,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: media.height * 0.3,
                      child: SvgPicture.asset("assets/svgs/reset.svg")),
                  // SizedBox(
                  //   height: media.height * 0.09,
                  // ),
                  SizedBox(
                    height: media.height * 0.02,
                  ),
                  Center(
                    child: CommonText(
                      text: "Change or set your new password",
                      fontColor: AppColors.black.withOpacity(.4),
                    ),
                  ),
                  SizedBox(
                    height: media.width * 0.06,
                  ),
                  Form(
                      key: AuthController.to.updatePasswordKey,
                      child: Column(
                        children: [
                          CommonTextFormField(
                              hintText: "New password",
                              obscureText: true,
                              controller: AuthController.to.uPassword,
                              validator: (data) {
                                if (data!.isEmpty || data == "") {
                                  return "Password field required";
                                } else if (data.length < 6) {
                                  return "Password atleast 6 character";
                                }
                                return null;
                              }),
                          CommonTextFormField(
                              hintText: "Confirm new password",
                              obscureText: true,
                              controller: AuthController.to.cuPassword,
                              validator: (data) {
                                if (data!.isEmpty || data == "") {
                                  return "Confirm Password field required";
                                } else if (data.length < 6) {
                                  return "Confirm Password atleast 6 character";
                                } else if (data !=
                                    AuthController.to.uPassword.text) {
                                  return "Password mismatch";
                                }
                                return null;
                              }),
                        ],
                      )),

                  SizedBox(
                    height: media.width * 0.06,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (AuthController.to.updatePasswordKey.currentState!
                          .validate()) {
                        AuthController.to.updatePassword();
                      }
                    },
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width - 40,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: AppColors.primary,
                          gradient: const LinearGradient(
                              colors: [AppColors.primary, AppColors.secondary],
                              begin: Alignment.topRight,
                              end: Alignment.topLeft),
                        ),
                        child: const Center(
                          child: CommonText(
                            text: "Submit",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CommonText(text: "Don't change?"),
                      SizedBox(width: media.width * 0.02),
                      GestureDetector(
                          onTap: () {
                            Get.off(() => const Login());
                          },
                          child: const CommonText(
                            text: "Login",
                            fontColor: AppColors.primary,
                          )),
                    ],
                  ),

                  SizedBox(
                    height: media.height * 0.02,
                  ),
                ],
              ),
              Obx(() => AuthController.to.updatePasswordLoading == true
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
                            text: "Password updating...",
                            fontColor: AppColors.white,
                          )
                        ],
                      ))
                  : const SizedBox())
            ],
          )),
    ));
  }
}
