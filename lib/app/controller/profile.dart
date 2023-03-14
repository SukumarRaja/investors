import 'package:get/get.dart';

import '../data/repository/profile.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.put(ProfileController());

  final repository = ProfileRepository();
}
