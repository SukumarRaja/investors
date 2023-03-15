import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investors/app/controller/dashboard.dart';
import 'package:investors/app/controller/withdraw.dart';
import '../../utility/utility.dart';
import '../themes/colors.dart';
import '../themes/font_size.dart';
import '../widgets/common/common_loading.dart';
import '../widgets/common/common_text.dart';
import '../widgets/common/common_textform_field.dart';
import '../widgets/otp_and_amount/controller.dart';

class WithDraw extends StatelessWidget {
  const WithDraw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var amount = "";
    var i =
        stringToDouble(text: DashboardController.to.profileDetails.investment);
    amount = formatAmount(amount: i);
    var media = MediaQuery.of(context).size;
    PinInputController pinInputController = PinInputController(length: 15);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          maintainBottomViewPadding: true,
          child: Container(
            height: Get.height,
            decoration: BoxDecoration(
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
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.white,
                          size: 20,
                        ),
                        CommonText(
                          text: "WithDraw",
                          fontSize: AppFontSize.twentyFour,
                          fontWeight: FontWeight.w100,
                          fontColor: AppColors.white,
                        )
                      ],
                    ),
                  ),
                ),

                Container(
                  width: media.width,
                  margin: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: LinearGradient(
                          colors: [AppColors.primary, AppColors.secondary],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.white.withOpacity(.2),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0.2, 0.6))
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text:
                                  "Acc No : ${DashboardController.to.profileDetails.bankAccnumber.toString().replaceAllMapped(RegExp(r".{4}"), (match) => "${match.group(0)} ")}",
                              fontColor: AppColors.white,
                              fontSize: AppFontSize.eighteen,
                            ),
                            CommonText(
                              text: "Invest - Own",
                              fontColor: AppColors.white.withOpacity(.6),
                              fontSize: AppFontSize.fifteen,
                            ),
                            SizedBox(
                              height: media.height * 0.02,
                            ),
                            CommonText(
                              text: "Account Balance",
                              fontColor: AppColors.green,
                              fontSize: AppFontSize.fifteen,
                            ),
                            CommonText(
                              text: "\u20B9 $amount",
                              fontColor: AppColors.white,
                              fontSize: AppFontSize.twentyFour,
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(
                          Icons.person,
                          color: AppColors.white,
                        )
                      ],
                    ),
                  ),
                ),
                // Container(
                //   height: 160,
                //   child: ListView.builder(
                //       itemCount: 2,
                //       shrinkWrap: true,
                //       scrollDirection: Axis.horizontal,
                //       itemBuilder: (context, int index) {
                //         return Container(
                //           width: media.width / 1.2,
                //           margin: EdgeInsets.all(10.0),
                //           decoration: BoxDecoration(
                //               color: AppColors.white,
                //               borderRadius: BorderRadius.circular(10.0),
                //               gradient: LinearGradient(
                //                   colors: [
                //                     AppColors.primary,
                //                     AppColors.secondary
                //                   ],
                //                   begin: Alignment.topCenter,
                //                   end: Alignment.bottomCenter),
                //               boxShadow: [
                //                 BoxShadow(
                //                     color: AppColors.white.withOpacity(.2),
                //                     spreadRadius: 1,
                //                     blurRadius: 1,
                //                     offset: const Offset(0.2, 0.6))
                //               ]),
                //           child: Padding(
                //             padding: const EdgeInsets.symmetric(
                //                 horizontal: 15.0, vertical: 15),
                //             child: Row(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     CommonText(
                //                       text:
                //                           "Acc No : ${DashboardController.to.profileDetails.bankAccnumber.toString().replaceAllMapped(RegExp(r".{4}"), (match) => "${match.group(0)} ")}",
                //                       fontColor: AppColors.white,
                //                       fontSize: AppFontSize.eighteen,
                //                     ),
                //                     CommonText(
                //                       text: "Invest - Own",
                //                       fontColor: AppColors.white.withOpacity(.6),
                //                       fontSize: AppFontSize.fifteen,
                //                     ),
                //                     SizedBox(
                //                       height: media.height * 0.02,
                //                     ),
                //                     CommonText(
                //                       text: "Account Balance",
                //                       fontColor: AppColors.green,
                //                       fontSize: AppFontSize.fifteen,
                //                     ),
                //                     CommonText(
                //                       text: "\u20B9 $amount",
                //                       fontColor: AppColors.white,
                //                       fontSize: AppFontSize.twentyFour,
                //                     ),
                //                   ],
                //                 ),
                //                 Spacer(),
                //                 Icon(
                //                   Icons.person,
                //                   color: AppColors.white,
                //                 )
                //               ],
                //             ),
                //           ),
                //         );
                //       }),
                // ),
                // Container(
                //   width: media.width,
                //   height: 50,
                //   margin: EdgeInsets.all(10.0),
                //   decoration: BoxDecoration(
                //       color: AppColors.white,
                //       borderRadius: BorderRadius.circular(8.0),
                //       boxShadow: [
                //         BoxShadow(
                //             color: AppColors.white.withOpacity(.2),
                //             spreadRadius: 1,
                //             blurRadius: 1,
                //             offset: const Offset(0.2, 0.6))
                //       ]),
                //   child: Row(
                //     children: [
                //       SizedBox(
                //         width: media.width * 0.04,
                //       ),
                //       Obx(() => WithDrawController.to.isShowHintAmount == true
                //           ? CommonText(
                //               text: "Enter withdraw amount",
                //               fontColor: AppColors.black.withOpacity(.3),
                //             )
                //           : const SizedBox()),
                //       Obx(() => WithDrawController.to.isShowHintAmount == false
                //           ? CommonText(
                //               text: "${WithDrawController.to.separatedAmount}",
                //               fontColor: AppColors.black,
                //               fontWeight: FontWeight.w400,
                //               fontSize: AppFontSize.twenty,
                //             )
                //           : const SizedBox()),
                //       Spacer(),
                //       Obx(() => WithDrawController.to.isShowHintAmount == false
                //           ? CommonText(
                //               text: "\u20B9",
                //               fontColor: AppColors.black,
                //               fontWeight: FontWeight.w400,
                //               fontSize: AppFontSize.twenty,
                //             )
                //           : const SizedBox()),
                //       SizedBox(
                //         width: media.width * 0.04,
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: media.width * 0.06,
                ),

                Stack(
                  children: [
                    Form(
                      key: WithDrawController.to.key,
                      child: CommonTextFormField(
                          hintText: "Enter your amount",
                          enableBorderSide: true,
                          keyboardType: TextInputType.number,
                          isPrefixIcon: false,
                          prefixIcon: Icons.email,
                          fontSize: 20,
                          controller: WithDrawController.to.amount,
                          validator: (data) {
                            if (data!.isEmpty || data == "") {
                              return "Amount field required";
                            }
                            return null;
                          }),
                    ),
                    const Positioned(
                      right: 25,
                      top: 20,
                      child: CommonText(
                        text: "\u20B9",
                        fontColor: AppColors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: AppFontSize.twenty,
                      ),
                    )
                  ],
                ),

                // PinPlusKeyBoardPackage(
                //   spacing: media.height * 0.06,
                //   inputShape: InputShape.circular,
                //   keyboardButtonShape: KeyboardButtonShape.circular,
                //   buttonBorderColor: AppColors.white,
                //   btnTextColor: AppColors.secondPrimary,
                //   pinInputController: pinInputController,
                //   doneButton: const Icon(
                //     Icons.check,
                //     color: AppColors.white,
                //   ),
                //   backButton: const Icon(
                //     Icons.backspace,
                //     color: AppColors.white,
                //   ),
                //   onSubmit: () {
                //     if (pinInputController.text.isNotEmpty) {
                //       WithDrawController.to.isShowHintAmount = false;
                //       WithDrawController.to.amount = pinInputController.text;
                //       var value = stringToInt(text: WithDrawController.to.amount);
                //
                //       var v = formatAmount(amount: value);
                //       WithDrawController.to.separatedAmount = v;
                //     } else {
                //       WithDrawController.to.isShowHintAmount = true;
                //       WithDrawController.to.amount = "";
                //     }
                //   },
                //   keyboardFontFamily: '',
                // ),

                Obx(() => WithDrawController.to.loading == true
                    ? const Center(
                        child: CommonLoading(
                        size: 150,
                      ))
                    : const SizedBox()),
                const Spacer(),
                // GestureDetector(
                //   onTap: () {
                //     // if (WithDrawController.to.amount != "") {
                //     //   print("amount is : ${WithDrawController.to.amount}");
                //     //   // if (WithDrawController.to.buttonText == "0") {
                //     //   if (WithDrawController.to.amount.toString().length <
                //     //       2) {
                //     //     commonSnackBar(
                //     //         title: "Alert",
                //     //         msg: "Amount should be greater than 0");
                //     //
                //     //     print("must be greater than 0");
                //     //   } else {
                //     //     WithDrawController.to.withdrawRequest();
                //     //     print("ok");
                //     //   }
                //     // } else {
                //     //   commonSnackBar(
                //     //       title: "Alert", msg: "Amount cannot be empty");
                //     //   print("please enter amount");
                //     // }
                //
                //     if (WithDrawController.to.key.currentState!.validate()) {
                //       WithDrawController.to.withdrawRequest();
                //     }
                //   },
                //   child: Center(
                //     child: Container(
                //       width: MediaQuery.of(context).size.width - 40,
                //       height: 50,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(10.0),
                //         color: AppColors.primary,
                //         boxShadow: [
                //           BoxShadow(
                //               color: AppColors.white.withOpacity(.4),
                //               spreadRadius: 1,
                //               blurRadius: 1,
                //               offset: const Offset(0.4, 0.6)),
                //         ],
                //         gradient: const LinearGradient(
                //             colors: [AppColors.primary, AppColors.secondary],
                //             begin: Alignment.topRight,
                //             end: Alignment.topLeft),
                //       ),
                //       child: const Center(
                //         child: CommonText(
                //           text: "Request",
                //           fontColor: AppColors.white,
                //           fontSize: AppFontSize.twenty,
                //           fontWeight: FontWeight.bold,
                //           letterSpacing: 1,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: media.width * 0.15,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        height: 60,
        color: AppColors.secondary,
        child: GestureDetector(
          onTap: () {
            if (WithDrawController.to.key.currentState!.validate()) {
              WithDrawController.to.withdrawRequest();
            }
          },
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 50,
              margin: const EdgeInsets.only(bottom: 10),
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
                  text: "Request",
                  fontColor: AppColors.white,
                  fontSize: AppFontSize.twenty,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
