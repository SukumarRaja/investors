import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../themes/colors.dart';
import '../../themes/font_size.dart';
import '../common/common_text.dart';

class ProfileMenuCard extends StatelessWidget {
  const ProfileMenuCard(
      {Key? key,
      required this.icon,
      required this.name,
      required this.onPressed})
      : super(key: key);
  final String name;
  final String icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.white.withOpacity(.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0.2, 0.6)),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset("assets/svgs/$icon.svg"),
              ),
            ),
            SizedBox(
              width: media.width * 0.06,
            ),
            CommonText(
              text: name,
              fontColor: AppColors.white,
              fontSize: AppFontSize.twenty,
            ),
            const Spacer(),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.white.withOpacity(.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0.2, 0.6)),
                ],
              ),
              child: const Icon(Icons.keyboard_arrow_right),
            ),
          ],
        ),
      ),
    );
  }
}
