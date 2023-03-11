import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth.dart';
import '../themes/colors.dart';
import '../themes/font_size.dart';
import '../widgets/common/common_loading.dart';
import '../widgets/common/common_text.dart';
import '../widgets/common/common_textform_field.dart';
import '../widgets/common/intl_phone_field.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.secondPrimary,
                  ),
                ),
              ),
              SizedBox(
                height: media.height * 0.09,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: media.width * 0.05),
                child: const CommonText(
                  text: "Register",
                  fontSize: AppFontSize.twentyEight,
                  fontWeight: FontWeight.w100,
                  fontColor: AppColors.white,
                ),
              ),
              SizedBox(
                height: media.height * 0.02,
              ),
              Form(
                  key: AuthController.to.registerKey,
                  child: Column(
                    children: [
                      CommonTextFormField(
                          hintText: "Enter your name",
                          enableBorderSide: true,
                          prefixIcon: Icons.person,
                          controller: AuthController.to.name,
                          validator: (data) {
                            if (data!.isEmpty || data == "") {
                              return "Name field required";
                            }
                            return null;
                          }),
                      CommonTextFormField(
                          hintText: "Enter your email",
                          enableBorderSide: true,
                          prefixIcon: Icons.email,
                          controller: AuthController.to.email,
                          validator: (data) {
                            if (data!.isEmpty || data == "") {
                              return "Email field required";
                            }
                            return null;
                          }),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IntlPhoneField(
                          maxLength: 10,
                          hintText: "Phone",
                          controller: AuthController.to.phone,
                          initialCountryCode: "IN",
                          fontFamily: "Oswald",
                          validator: (data) {
                            if (data!.isEmpty || data == "") {
                              return "Phone field required";
                            } else if (data.length < 10) {
                              return "Phone number must be 10 character";
                            }
                            return null;
                          },
                        ),
                      ),
                      CommonTextFormField(
                          hintText: "Enter your password",
                          obscureText: true,
                          enableBorderSide: true,
                          prefixIcon: Icons.lock,
                          controller: AuthController.to.password,
                          validator: (data) {
                            if (data!.isEmpty || data == "") {
                              return "Password field required";
                            } else if (data.length < 6) {
                              return "Password atleast 6 character";
                            }
                            return null;
                          }),
                    ],
                  )),
              SizedBox(
                height: media.width * 0.06,
              ),
              Obx(() => AuthController.to.registerLoading == true
                  ? const CommonNormalLoading()
                  : GestureDetector(
                      onTap: () {
                        if (AuthController.to.registerKey.currentState!
                            .validate()) {
                          AuthController.to.register();
                        }
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
                                colors: [
                                  AppColors.primary,
                                  AppColors.secondary
                                ],
                                begin: Alignment.topRight,
                                end: Alignment.topLeft),
                          ),
                          child: const Center(
                            child: CommonText(
                              text: "Register",
                              fontColor: AppColors.white,
                              fontSize: AppFontSize.twenty,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                    )),
              SizedBox(
                height: media.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CommonText(text: "Already have an account?"),
                  SizedBox(
                    width: media.width * 0.02,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const CommonText(
                      text: "Login",
                      fontColor: AppColors.white,
                    ),
                  )
                ],
              ),
              const Center(child: CommonText(text: "OR")),
              const Center(
                  child: CommonText(
                text: "Continue Guest",
                fontColor: AppColors.secondPrimary,
              )),
              SizedBox(
                height: media.height * 0.02,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
