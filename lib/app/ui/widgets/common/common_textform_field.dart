import 'package:flutter/material.dart';

import '../../themes/colors.dart';

class CommonTextFormField extends StatefulWidget {
  const CommonTextFormField(
      {Key? key,
      required this.hintText,
      required this.controller,
      this.validator,
      this.obscureText,
      this.maxLength,
      this.errorText,
      this.prefixIcon,
      this.enableBorderSide = false,
      this.keyboardType,
      this.isPrefixIcon = true,
      this.fontSize = 14})
      : super(key: key);
  final String hintText;
  final String? errorText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final bool? enableBorderSide;
  final bool? isPrefixIcon;
  final int? maxLength;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final double? fontSize;

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: TextStyle(
          fontFamily: "Oswald",
          fontSize: widget.fontSize,
        ),
        validator: widget.validator,
        cursorColor: AppColors.primary,
        controller: widget.controller,
        maxLength: widget.maxLength,
        keyboardType: widget.keyboardType,
        maxLines: 1,
        obscuringCharacter: "*",
        obscureText: widget.obscureText == true ? !passwordVisible : false,
        decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.white,
            hintText: widget.hintText,
            errorText: widget.errorText,
            hintStyle: const TextStyle(fontFamily: "Oswald"),
            counterText: "",
            contentPadding: const EdgeInsets.only(left: 15),
            border: OutlineInputBorder(
              borderSide: widget.enableBorderSide == true
                  ? BorderSide(
                      color: AppColors.primary.withOpacity(.2),
                    )
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.secondPrimary.withOpacity(.5), width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.red, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            suffixIcon: showPassword(),
            prefixIcon:
                widget.isPrefixIcon == true ? Icon(widget.prefixIcon) : null),
      ),
    );
  }

  bool passwordVisible = false;

  Widget showPassword() {
    if (widget.obscureText == true) {
      return ButtonTheme(
          child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(0),
        ),
        onPressed: () {
          setState(() {
            passwordVisible = !passwordVisible;
          });
        },
        child: Icon(
          passwordVisible == true ? Icons.visibility : Icons.visibility_off,
          color: AppColors.grey.withOpacity(.3),
        ),
      ));
    } else {
      return const SizedBox.shrink();
    }
  }
}
