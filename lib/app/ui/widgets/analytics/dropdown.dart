import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investors/app/controller/main.dart';
import 'package:investors/app/ui/themes/colors.dart';
import 'package:investors/app/ui/widgets/common/common_text.dart';

import '../../../data/model/day_month.dart';

class Dropdownmonth extends StatelessWidget {
  const Dropdownmonth({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 8),
      child: Obx(
        () =>

            Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, right: 10, top: 5, bottom: 5),
              decoration: BoxDecoration(
                color: AppColors.primary,
                border: Border.all(color: AppColors.gradient, width: 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: DropdownButton<dynamic>(
                isDense: true,
                underline: SizedBox(),
                hint: CommonText(text: "Months", fontColor: Colors.white),
                dropdownColor: AppColors.gradient,
                value: MainController.to.monthIndex!=""?MainController.to.monthIndex:null,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                onChanged: (newValue) {
                  MainController.to.monthIndex = newValue;
                  print("Selected month is : ${MainController.to.monthIndex}");
                },
                items: amonths.map((dynamic valueItem) {
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(valueItem),
                  );
                }).toList(),
              ),
            ),
            SizedBox(width: 5),
            Container(
              padding: EdgeInsets.only(left: 20, right: 10, top: 5, bottom: 5),
              decoration: BoxDecoration(
                color: AppColors.primary,
                border: Border.all(color: AppColors.gradient, width: 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: DropdownButton<dynamic>(
                isDense: true,
                underline: SizedBox(),
                hint: CommonText(text: "Year", fontColor: Colors.white),
                dropdownColor: AppColors.gradient,
                value: MainController.to.yearIndex!=""?MainController.to.yearIndex:null,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                onChanged: (newValue) {
                  MainController.to.yearIndex = newValue;
                  print("Selected year is : ${MainController.to.yearIndex}");
                },
                items: years.map((dynamic valueItem) {
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(valueItem),
                  );
                }).toList(),
              ),
            ),
            SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}
