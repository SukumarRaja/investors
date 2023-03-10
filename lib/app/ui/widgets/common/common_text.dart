import 'package:flutter/material.dart';

import '../../themes/colors.dart';
import '../../themes/font_size.dart';

class CommonText extends StatelessWidget {
  const CommonText(
      {Key? key,
      required this.text,
      this.fontSize = AppFontSize.sixteen,
      this.fontColor = AppColors.black,
      this.fontWeight,
      this.letterSpacing,
      this.textAlign,
      this.foreground,
      this.isForeground})
      : super(key: key);
  final String text;
  final double fontSize;
  final double? letterSpacing;
  final Color? fontColor;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final Paint? foreground;
  final bool? isForeground;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: media.width * fontSize,
          fontWeight: fontWeight,
          color: isForeground == true ? null : fontColor,
          fontFamily: "Oswald",
          foreground: foreground,
          letterSpacing: letterSpacing),
    );
  }
}
