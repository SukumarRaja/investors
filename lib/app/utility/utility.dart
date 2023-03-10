import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../ui/themes/colors.dart';

final Shader mainAmountGradient = const LinearGradient(
  colors: [AppColors.skilled, AppColors.green],
).createShader(
  const Rect.fromLTWH(20.0, 0.0, 100.0, 0.0),
);

final Shader nameGradient = const LinearGradient(
  colors: [AppColors.red, AppColors.primary, AppColors.secondPrimary],
).createShader(
  const Rect.fromLTWH(50.0, 0.0, 150.0, 0.0),
);
final Shader historyAmountGradient = const LinearGradient(
  colors: [AppColors.red, AppColors.green, AppColors.primary],
).createShader(
  const Rect.fromLTWH(150.0, 0.0, 550.0, 0.0),
);

String formatAmount({required amount}) {
  var formatter = NumberFormat('#,##,###');
  var v = formatter.format(amount);
  debugPrint("formatted amount is $v");
  return v;
}

int stringToInt({required text}) {
  var myInt = int.parse(text);
  debugPrint("$myInt");
  return myInt;
}


