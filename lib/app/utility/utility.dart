import 'package:flutter/material.dart';
import '../ui/themes/colors.dart';

final Shader mainAmountGradient = const LinearGradient(
  colors: [AppColors.red, AppColors.primary, AppColors.secondPrimary],
).createShader(
  const Rect.fromLTWH(50.0, 0.0, 350.0, 50.0),
);
