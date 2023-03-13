import 'package:flutter/material.dart';

class PinInputController extends ChangeNotifier {
  int length;
  String text;
  PinInputController({required this.length, this.text = ''});

  changeText(String text) {
    this.text = text;
    notifyListeners();
  }
}