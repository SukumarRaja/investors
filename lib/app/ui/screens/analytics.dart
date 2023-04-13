import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investors/app/ui/themes/font_size.dart';
import 'package:investors/app/ui/widgets/analytics/details.dart';
import 'package:investors/app/ui/widgets/analytics/percent_indicator.dart';
import 'package:investors/app/ui/widgets/analytics/total_card.dart';
import 'package:investors/app/ui/widgets/common/common_alert.dart';
import 'package:investors/app/ui/widgets/common/common_text.dart';
import 'package:investors/app/utility/utility.dart';

import '../../controller/main.dart';
import '../themes/colors.dart';

class Analytics extends StatelessWidget {
  const Analytics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Current date : ${getCurrentDate()}");
    var da = monthNameToMonthNumberForAnalytics(date: getCurrentDate());
    print(da);
    var date = dateSeparate(date: getCurrentDate());
    var month = months(month: da);
    var year = yearSeparate(date: getCurrentDate());
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
          child: Center(
            child: Stack(
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
                              text: "Analytics",
                              fontSize: AppFontSize.twentyFour,
                              fontWeight: FontWeight.w100,
                              fontColor: AppColors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        updateMonthYearDialog(context, content: "Months",
                            confirmButtonPressed: () {
                          Get.back();
                        }, cancelButtonPressed: () {
                          MainController.to.monthIndex = "";
                          MainController.to.yearIndex = "";
                          Get.back();
                        });
                        // showDatePicker(
                        //         initialDatePickerMode: DatePickerMode.day,
                        //         context: context,
                        //         initialDate: DateTime.now(),
                        //         firstDate: DateTime(1995),
                        //         lastDate: DateTime(2025))
                        //     .then((value) {
                        //   var test =
                        //       getIsoToLocalDate(date: value.toString());
                        //   var test2 =
                        //       monthNameToMonthNumberForAnalytics(date: test);
                        //   var m = months(month: test2);
                        //   print(test);
                        //   print("selected month: $m");
                        //   setState(() {
                        //     changemonth = m;
                        //     isChangeDate = true;
                        //   });
                        // });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Obx(
                          () => MainController.to.monthIndex != "" &&
                                  MainController.to.yearIndex != ""
                              ? CommonText(
                                  text:
                                      "${MainController.to.monthIndex} ${MainController.to.yearIndex}",
                                  fontSize: AppFontSize.twentyFour,
                                  fontWeight: FontWeight.bold,
                                  fontColor: AppColors.secondPrimary,
                                )
                              : CommonText(
                                  text: "$month $year",
                                  fontSize: AppFontSize.twentyFour,
                                  fontWeight: FontWeight.bold,
                                  fontColor: AppColors.secondPrimary,
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    PercentIndicator(),
                    Spacer(),
                    Details(),

                    Total(),
                    Spacer(),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Container(
                    //     height: 50,
                    //     child: ListView.builder(
                    //       itemCount: 12,
                    //       shrinkWrap: true,
                    //       scrollDirection: Axis.horizontal,
                    //       itemBuilder: (context, int index) {
                    //         return GestureDetector(
                    //           onTap: () {
                    //             setState(() {
                    //               activeDay = index;
                    //               isSelectMonth = months[index]['day'];
                    //             });
                    //           },
                    //           child: Container(
                    //             width: (MediaQuery.of(context).size.width - 40) / 6,
                    //             child: Column(
                    //               children: [
                    //                 GestureDetector(
                    //                   onTap: () {
                    //                     setState(() {
                    //                       isSelectYear = months[index]['label'];
                    //                       print(
                    //                           "Selected Year is : ${isSelectYear} Selected Month is : ${isSelectMonth}");
                    //                     });
                    //                   },
                    //                   child: Text(
                    //                     months[index]['label'],
                    //                     style: TextStyle(
                    //                         fontSize: 10,
                    //                         color: isSelectYear ==
                    //                                 months[index]['label']
                    //                             ? AppColors.gradient
                    //                             : AppColors.white),
                    //                   ),
                    //                 ),
                    //                 SizedBox(
                    //                   height: 10,
                    //                 ),
                    //                 Container(
                    //                   decoration: BoxDecoration(
                    //                       color: activeDay == index
                    //                           ? AppColors.primary
                    //                           : AppColors.white.withOpacity(0.05),
                    //                       borderRadius: BorderRadius.circular(5),
                    //                       border: Border.all(
                    //                           color: activeDay == index
                    //                               ? AppColors.primary
                    //                               : AppColors.white
                    //                                   .withOpacity(0.3))),
                    //                   child: Padding(
                    //                     padding: const EdgeInsets.only(
                    //                         left: 12, right: 12, top: 7, bottom: 7),
                    //                     child: Text(
                    //                       months[index]['day'],
                    //                       style: TextStyle(
                    //                           fontSize: 10,
                    //                           fontWeight: FontWeight.w600,
                    //                           color: activeDay == index
                    //                               ? AppColors.gradient
                    //                               : AppColors.primary),
                    //                     ),
                    //                   ),
                    //                 )
                    //               ],
                    //             ),
                    //           ),
                    //         );
                    //       },
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

bool isChangeDate = false;
var changemonth;
var changeyear;
