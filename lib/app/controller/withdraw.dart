import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class WithDrawController extends GetxController {
  static WithDrawController get to => Get.put(WithDrawController());

  final key = GlobalKey<FormState>();

  final _isShowHintAmount = true.obs;

  get isShowHintAmount => _isShowHintAmount.value;

  set isShowHintAmount(value) {
    _isShowHintAmount.value = value;
  }

  final _amount = "".obs;

  get amount => _amount.value;

  set amount(value) {
    _amount.value = value;
  }

  final _separatedAmount = "".obs;

  get separatedAmount => _separatedAmount.value;

  set separatedAmount(value) {
    _separatedAmount.value = value;
  }

  final _buttonText = "".obs;

  get buttonText => _buttonText.value;

  set buttonText(value) {
    _buttonText.value = value;
  }
}
