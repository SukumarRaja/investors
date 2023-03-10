import 'package:flutter/material.dart';

class OtpInput extends StatelessWidget {
  const OtpInput({Key? key, required this.autoFocus, required this.controller})
      : super(key: key);
  final bool autoFocus;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 45,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
            counterText: '',
            hintStyle: const TextStyle(
                color: Colors.black, fontSize: 20.0, fontFamily: "Oswald")),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }
}
