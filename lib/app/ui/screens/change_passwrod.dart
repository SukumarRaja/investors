import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controller/auth.dart';
import '../themes/colors.dart';
import '../themes/font_size.dart';
import '../widgets/common/common_text.dart';
import '../widgets/common/common_textform_field.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        maintainBottomViewPadding: true,
        child: Column(
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
                  padding: EdgeInsets.symmetric(horizontal: media.width * 0.01),
                  child: const CommonText(
                    text: "Change Password",
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
                text: "Change your new password",
                fontColor: AppColors.black.withOpacity(.4),
              ),
            ),
            SizedBox(
              height: media.width * 0.06,
            ),
            Form(
                child: Column(
              children: [
                CommonTextFormField(
                    hintText: "New password",
                    obscureText: true,
                    controller: AuthController.to.lPassword,
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
                    controller: AuthController.to.lPassword,
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
            GestureDetector(
              onTap: () {},
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: AppColors.primary,
                    gradient:  const LinearGradient(
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
          ],
        ),
      ),
    ));
  }
}
