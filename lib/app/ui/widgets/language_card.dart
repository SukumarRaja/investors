import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investors/app/controller/main.dart';

import '../themes/colors.dart';
import '../themes/font_size.dart';
import 'common/common_text.dart';

class langCard extends StatelessWidget {
  const langCard(
      {Key? key,
      required this.language,
      required this.onPressed,
      required this.index})
      : super(key: key);
  final String language;
  final Function() onPressed;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Obx(
        () => Container(
          alignment: Alignment.center,
          height: 50,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: MainController.to.languageIndex == index
                ? null
                : [
                    BoxShadow(
                      color: AppColors.white.withOpacity(.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                    ),
                  ],
            gradient: MainController.to.languageIndex == index
                ? const LinearGradient(
                    colors: [AppColors.primary, AppColors.gradient],
                    begin: Alignment.topRight,
                    end: Alignment.center)
                : const LinearGradient(
                    colors: [AppColors.primary, AppColors.secondary],
                    begin: Alignment.topRight,
                    end: Alignment.topLeft),
          ),
          child: CommonText(
            text: "$language",
            fontSize: AppFontSize.twenty,
            fontWeight: MainController.to.languageIndex == index
                ? FontWeight.bold
                : FontWeight.normal,
            fontColor: MainController.to.languageIndex == index
                ? AppColors.primary
                : AppColors.white,
          ),
        ),
      ),
    );
  }
}
