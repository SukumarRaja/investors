import 'package:get/get.dart';

int statusCode = 0;

class MainController extends GetxController {
  static MainController get to => Get.put(MainController());

  final _pageIndex = 1.obs;

  get pageIndex => _pageIndex.value;

  set pageIndex(value) {
    _pageIndex.value = value;
  }

  final _isSelectIcon = 5.obs;

  get isSelectIcon => _isSelectIcon.value;

  set isSelectIcon(value) {
    _isSelectIcon.value = value;
  }

  final _languageIndex = 10.obs;

  get languageIndex => _languageIndex.value;

  set languageIndex(value) {
    _languageIndex.value = value;
  }

  final _monthIndex = "".obs;

  get monthIndex => _monthIndex.value;

  set monthIndex(value) {
    _monthIndex.value = value;
  }

  final _yearIndex = "".obs;

  get yearIndex => _yearIndex.value;

  set yearIndex(value) {
    _yearIndex.value = value;
  }
}
