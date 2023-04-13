import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investors/app/ui/widgets/custom_daterange/custom_daterangepicker.dart';

import '../../utility/utility.dart';
import '../themes/colors.dart';
import '../themes/font_size.dart';
import '../widgets/common/common_text.dart';

class Estatement extends StatefulWidget {
  const Estatement({Key? key}) : super(key: key);

  @override
  State<Estatement> createState() => _EstatementState();
}

class _EstatementState extends State<Estatement> {
  DateTime? startDate;
  String? startString;
  DateTime? endDate;
  String? endString;

  @override
  Widget build(BuildContext context) {
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.arrow_back_ios,
                              color: AppColors.white,
                              size: 20,
                            ),
                            CommonText(
                              text: "E-Statement",
                              fontSize: AppFontSize.twentyFour,
                              fontWeight: FontWeight.w100,
                              fontColor: AppColors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: AppColors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Container(
                                  height: 40,
                                  child: Image.asset(
                                      'assets/images/searchpic.png',
                                      color: Colors.grey[800]),
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter date",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[900]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          showCustomDateRangePicker(context,
                              dismissible: true,
                              minimumDate: DateTime.now()
                                  .subtract(const Duration(days: 30)),
                              maximumDate:
                                  DateTime.now().add(const Duration(days: 90)),
                              startDate: startDate,
                              endDate: endDate, onApplyClick: (start, end) {
                            setState(() {
                              endDate = end;
                              startDate = start;
                              startString =
                                  getIsoToLocalDate(date: startDate.toString());
                              endString =
                                  getIsoToLocalDate(date: endDate.toString());
                            });
                          }, onCancelClick: () {
                            setState(() {
                              endDate = null;
                              startDate = null;
                            });
                          },
                              backgroundColor: AppColors.white,
                              primaryColor: AppColors.primary);
                        },
                        child: Container(
                          height: 50,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.asset(
                            'assets/images/preferences.png',
                            color: AppColors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.white,
                    ),
                    child: Center(
                      child: Container(
                        // margin: EdgeInsets.only(right: 10, left: 10, bottom: 5),
                        width: Get.width,
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
                            children: [
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Spacer(),
                                  Row(
                                    children: [
                                      CommonText(
                                        text: "From:  ",
                                        fontColor:
                                            AppColors.white.withOpacity(0.8),
                                        fontWeight: FontWeight.w600,
                                      ),
                                      CommonText(
                                        text: "$startString ",
                                        fontColor: AppColors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      CommonText(
                                        text: "To:  ",
                                        fontColor:
                                            AppColors.white.withOpacity(0.8),
                                        fontWeight: FontWeight.w600,
                                      ),
                                      CommonText(
                                        text: "$endString",
                                        fontColor: AppColors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CommonText(
                                          text: "Investment Amount",
                                          fontColor:
                                              AppColors.white.withOpacity(.8),
                                          fontSize: AppFontSize.sixteen,
                                          letterSpacing: 1,
                                        ),
                                        CommonText(
                                          text: "Withdrawal Amount",
                                          fontColor:
                                              AppColors.white.withOpacity(.8),
                                          fontSize: AppFontSize.sixteen,
                                          letterSpacing: 1,
                                        ),
                                        CommonText(
                                          text: "Profit Amount",
                                          fontColor:
                                              AppColors.white.withOpacity(.8),
                                          fontSize: AppFontSize.sixteen,
                                          letterSpacing: 1,
                                        ),
                                        CommonText(
                                          text: "Last Investment",
                                          fontColor:
                                              AppColors.white.withOpacity(.8),
                                          fontSize: AppFontSize.sixteen,
                                          letterSpacing: 1,
                                        ),
                                        CommonText(
                                          text: "Last Withdrawal",
                                          fontColor:
                                              AppColors.white.withOpacity(.8),
                                          fontSize: AppFontSize.sixteen,
                                          letterSpacing: 1,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.06,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CommonText(
                                          text: ":",
                                          fontColor:
                                              AppColors.white.withOpacity(.8),
                                          fontSize: AppFontSize.sixteen,
                                          letterSpacing: 1,
                                        ),
                                        CommonText(
                                          text: ":",
                                          fontColor:
                                              AppColors.white.withOpacity(.8),
                                          fontSize: AppFontSize.sixteen,
                                          letterSpacing: 1,
                                        ),
                                        CommonText(
                                          text: ":",
                                          fontColor:
                                              AppColors.white.withOpacity(.8),
                                          fontSize: AppFontSize.sixteen,
                                          letterSpacing: 1,
                                        ),
                                        CommonText(
                                          text: ":",
                                          fontColor:
                                              AppColors.white.withOpacity(.8),
                                          fontSize: AppFontSize.sixteen,
                                          letterSpacing: 1,
                                        ),
                                        CommonText(
                                          text: ":",
                                          fontColor:
                                              AppColors.white.withOpacity(.8),
                                          fontSize: AppFontSize.sixteen,
                                          letterSpacing: 1,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.1,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CommonText(
                                          text: addSpace(text: "\u20B9 20,000"),
                                          fontColor:
                                              AppColors.white.withOpacity(.8),
                                          fontSize: AppFontSize.sixteen,
                                          letterSpacing: 1,
                                        ),
                                        CommonText(
                                          text: "\u20B9 5,000",
                                          fontColor: Colors.red,
                                          fontSize: AppFontSize.sixteen,
                                          letterSpacing: 1,
                                        ),
                                        CommonText(
                                          text: "\u20B9 3,000",
                                          fontColor: AppColors.green,
                                          fontSize: AppFontSize.sixteen,
                                          letterSpacing: 1,
                                        ),
                                        CommonText(
                                          text: "\u20B9 500",
                                          fontColor:
                                              AppColors.white.withOpacity(.8),
                                          fontSize: AppFontSize.sixteen,
                                          letterSpacing: 1,
                                        ),
                                        CommonText(
                                          text: "\u20B9 0",
                                          fontColor:
                                              AppColors.white.withOpacity(.8),
                                          fontSize: AppFontSize.sixteen,
                                          letterSpacing: 1,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    // CommonText(
                                    //   text: "For More Details:",
                                    //   fontColor: AppColors.white.withOpacity(0.8),
                                    //   fontWeight: FontWeight.w300,
                                    // ),
                                    // SizedBox(width: 5),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        height: 35,
                                        padding: EdgeInsets.all(7),
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: AppColors.white,
                                                blurRadius: 1,
                                                spreadRadius: 1,
                                              ),
                                            ],
                                            color: AppColors.primary,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                                color: AppColors.white)),
                                        child: Image.asset(
                                          "assets/images/download.png",
                                          color: AppColors.white,
                                          height: 25,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
