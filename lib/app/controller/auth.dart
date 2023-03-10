import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ui/screens/home/main.dart';
import '../ui/screens/initial.dart';
import '../ui/screens/otp_verify.dart';

import 'main.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.put(AuthController());

  // final repository = AuthRepository();

  final loginKey = GlobalKey<FormState>();
  final registerKey = GlobalKey<FormState>();
  final validateEmailKey = GlobalKey<FormState>();
  final updatePasswordKey = GlobalKey<FormState>();

  // login textController
  TextEditingController lEmail = TextEditingController();
  TextEditingController lPassword = TextEditingController();

  // register textController
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  // validate email controller
  TextEditingController vEmail = TextEditingController();

  // update password controller
  TextEditingController uPassword = TextEditingController();
  TextEditingController cuPassword = TextEditingController();

  final _loginLoading = false.obs;

  get loginLoading => _loginLoading.value;

  set loginLoading(value) {
    _loginLoading.value = value;
  }

  final _registerLoading = false.obs;

  get registerLoading => _registerLoading.value;

  set registerLoading(value) {
    _registerLoading.value = value;
  }

  final _emailValidateLoading = false.obs;

  get emailValidateLoading => _emailValidateLoading.value;

  set emailValidateLoading(value) {
    _emailValidateLoading.value = value;
  }

  final _validEmailLoginId = "".obs;

  get validEmailLoginId => _validEmailLoginId.value;

  set validEmailLoginId(value) {
    _validEmailLoginId.value = value;
  }

  final _updatePasswordLoading = false.obs;

  get updatePasswordLoading => _updatePasswordLoading.value;

  set updatePasswordLoading(value) {
    _updatePasswordLoading.value = value;
  }

  storeLocalDevice({required Map body}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    body.forEach((key, value) {
      debugPrint('index=$key, value=$value');
      preferences.setString(key, value);
    });
  }

  registerFieldsEmpty() {
    name.text = "";
    email.text = "";
    phone.text = "";
    password.text = "";
  }

  loginFieldsEmpty() {
    lEmail.text = "";
    lPassword.text = "";
  }

  loginCheck() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('patientId');
    debugPrint("patientId $token");
    if (token != null && token.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    debugPrint("token $token");
    if (token != null && token.isNotEmpty) {
      preferences.remove('token');
      // await Get.off(() => const LoadingPage());
    } else {
      return false;
    }
  }

  checkOnBoarding() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('on_boarding');
    if (token == null) {
      return true;
    } else {
      return false;
    }
  }

  setOnBoardDataAfterScreenCompleted() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("on_boarding", "onBoarding");
    var onBoard = preferences.getString('on_boarding');
    debugPrint("on boarding data $onBoard");
    await Get.off(() => const Initial());
    return onBoard;
  }

  login() async {
    // loginLoading = true;
    // var body = {"email": lEmail.text.trimRight(), "password": lPassword.text};
    // try {
    //   var res = await repository.login(body: body);
    //   if (statusCode == 200) {
    //     if (res['status'] == "200") {
    //       loginLoading = false;
    //       commonPrint(status: res['status'], msg: res['message']);
    //       Map storedData = {"patientId": "${res['patient_id']}"};
    //       storeLocalDevice(body: storedData);
    //       Get.off(() => HomeMain());
    //       commonSnackBar(title: "Success", msg: "Login Successfully");
    //       loginFieldsEmpty();
    //     } else if (res['status'] == "422") {
    //       loginLoading = false;
    //       commonPrint(
    //           status: res['status'],
    //           msg: "${res['message']}\nEmail or Password Wrong");
    //       errorAlert(Get.context!,
    //           content: "${res['message']}\nEmail or Password Wrong",
    //           confirmButtonPressed: () {
    //         Get.back();
    //       });
    //     }
    //   } else {
    //     loginLoading = false;
    //     commonPrint(status: "500", msg: "Error from server or No Internet");
    //   }
    // } catch (e) {
    //   loginLoading = false;
    //   commonPrint(
    //       status: "$statusCode",
    //       msg: "Error from login due to data mismatch or format $e");
    // }
  }

  register() async {
    // registerLoading = true;
    // var body = {
    //   "name": name.text,
    //   "email": email.text.trimRight(),
    //   "mobile": phone.text,
    //   "password": password.text
    // };
    // try {
    //   var res = await repository.register(body: body);
    //   if (statusCode == 200) {
    //     if (res['status'] == "200") {
    //       if (res['message'] == "Email Duplicated") {
    //         registerLoading = false;
    //         commonPrint(status: res['status'], msg: res['message']);
    //         errorAlert(Get.context!,
    //             content: "${res['message']}\nEmail already exist",
    //             confirmButtonPressed: () {
    //           Get.back();
    //         });
    //       } else {
    //         registerLoading = false;
    //         commonPrint(status: res['status'], msg: res['message']);
    //         Map storedData = {"patientId": "${res['patient_id']}"};
    //         storeLocalDevice(body: storedData);
    //         Get.off(() => HomeMain());
    //         commonSnackBar(title: "Success", msg: "Register Successfully");
    //         registerFieldsEmpty();
    //       }
    //     } else if (res['status'] == "422") {
    //       registerLoading = false;
    //       commonPrint(status: res['status'], msg: "All fields are required");
    //       errorAlert(Get.context!, content: "All fields are required",
    //           confirmButtonPressed: () {
    //         Get.back();
    //       });
    //     }
    //   } else {
    //     registerLoading = false;
    //     commonPrint(status: "500", msg: "Error from server or No Internet");
    //   }
    // } catch (e) {
    //   registerLoading = false;
    //   commonPrint(
    //       status: "$statusCode",
    //       msg: "Error from register due to data mismatch or format $e");
    // }
  }

  validateEmailForForgotPassword() async {
    // emailValidateLoading = true;
    // var body = {
    //   "email": vEmail.text.trimRight(),
    // };
    // try {
    //   var res = await repository.validateEmailForForgotPassword(body: body);
    //   if (statusCode == 200) {
    //     if (res['status'] == "200") {
    //       emailValidateLoading = false;
    //       validEmailLoginId = res['login_id'];
    //       commonPrint(status: res['status'], msg: res['message']);
    //       Get.to(() => const OtpVerify());
    //     } else if (res['status'] == "422") {
    //       emailValidateLoading = false;
    //       commonPrint(status: res['status'], msg: "${res['message']}");
    //       nothingSnackBar(msg: "${res['message']} or Wrong email");
    //     }
    //   } else {
    //     emailValidateLoading = false;
    //     commonPrint(
    //         status: "500",
    //         msg: "Error from server or No Internet on validateEmail");
    //   }
    // } catch (e) {
    //   emailValidateLoading = false;
    //   commonPrint(
    //       status: "$statusCode",
    //       msg: "Error from validateEmail due to data mismatch or format $e");
    // }
  }

  updatePassword() async {
    // updatePasswordLoading = true;
    // var body = {
    //   "password": cuPassword.text,
    //   "login_id": validEmailLoginId == "" ? "1090" : validEmailLoginId
    // };
    // try {
    //   var res = await repository.updatePassword(body: body);
    //   if (statusCode == 200) {
    //     if (res['status'] == "200") {
    //       if (res['patient_id'] == null) {
    //         updatePasswordLoading = false;
    //         commonPrint(
    //             status: res['status'], msg: "${res['message']} but no data");
    //       } else {
    //         updatePasswordLoading = false;
    //         commonPrint(
    //             status: res['status'],
    //             msg:
    //                 "${res['message']} with data or patient id: ${res['patient_id']}");
    //         Get.off(() => const Login());
    //         nothingSnackBar(msg: "${res['message']}");
    //       }
    //     } else if (res['status'] == "422") {
    //       updatePasswordLoading = false;
    //       commonPrint(
    //           status: res['status'], msg: "${res['message']} on password");
    //       nothingSnackBar(msg: "Password update error please try again later");
    //     }
    //   } else {
    //     updatePasswordLoading = false;
    //     commonPrint(
    //         status: "500",
    //         msg: "Error from server or No Internet on updatePassword");
    //   }
    // } catch (e) {
    //   updatePasswordLoading = false;
    //   commonPrint(
    //       status: "$statusCode",
    //       msg: "Error from updatePassword due to data mismatch or format $e");
    // }
  }
}
