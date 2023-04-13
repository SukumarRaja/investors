import 'package:get/get.dart';

class FaqController extends GetxController {
  static FaqController get to => Get.put(FaqController());

  final _faqSelectedIndex = 150.obs;

  get faqSelectedIndex => _faqSelectedIndex.value;

  set faqSelectedIndex(value) {
    _faqSelectedIndex.value = value;
  }
}
