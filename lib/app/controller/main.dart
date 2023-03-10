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
}
