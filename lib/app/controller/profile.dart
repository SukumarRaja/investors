import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/repository/profile.dart';
import '../ui/screens/login.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.put(ProfileController());

  final _logoutLoading = false.obs;

  get logoutLoading => _logoutLoading.value;

  set logoutLoading(value) {
    _logoutLoading.value = value;
  }

  logout() async {
    Get.back();
    logoutLoading = true;
    SharedPreferences pref = await SharedPreferences.getInstance();
    var id = pref.getString('investorID');
    Future.delayed(const Duration(seconds: 4), () async {
      logoutLoading = false;
      if (id != null && id.isNotEmpty) {
        pref.remove('investorID');
        debugPrint("Logout Successfully in Token: $id");
        await Get.off(() => const Login());
      } else {
        return false;
      }
    });
  }

  final repository = ProfileRepository();
}
