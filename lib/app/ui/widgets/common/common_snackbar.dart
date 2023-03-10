import 'package:get/get.dart';

import '../../themes/colors.dart';


commonSnackBar({required title, required msg}) {
  Get.snackbar(title, msg, snackPosition: SnackPosition.BOTTOM);
}

alertSnackBar({required msg}) {
  Get.snackbar("Alert", "$msg",
      backgroundColor: AppColors.red,
      snackStyle: SnackStyle.FLOATING,
      colorText: AppColors.white);
}

nothingSnackBar({required msg}) {
  Get.snackbar("Alert", "$msg", snackPosition: SnackPosition.BOTTOM);
}

successSnackBar({required msg}) {
  Get.snackbar("Alert", "$msg", snackPosition: SnackPosition.TOP);
}
