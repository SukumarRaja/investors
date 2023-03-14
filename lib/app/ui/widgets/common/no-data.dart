import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investors/app/ui/themes/colors.dart';

import 'common_text.dart';

class NoData extends StatelessWidget {
  const NoData({Key? key, required this.msg, this.height}) : super(key: key);
  final String msg;
  final double? height;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
            height: height ?? media.width / 2,
            child: SvgPicture.asset("assets/svgs/no_data.svg")),
        CommonText(
          text: msg,
          fontColor: AppColors.white,
        )
      ],
    );
  }
}
