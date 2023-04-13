import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investors/app/controller/main.dart';
import 'package:investors/app/ui/widgets/language_card.dart';

import '../themes/colors.dart';
import '../themes/font_size.dart';
import '../widgets/common/common_text.dart';

class Lang extends StatelessWidget {
  const Lang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            alignment: Alignment.center,
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              gradient: LinearGradient(
                  colors: [AppColors.primary, AppColors.secondary],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            child: ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (context, int index) {
                  return langCard(
                    language: index == 0
                        ? "English"
                        : index == 1
                            ? "Tamil"
                            : "Hindi",
                    onPressed: () {
                      MainController.to.languageIndex = index;
                    },
                    index: index,
                  );
                })),
      ),
    );
  }
}
