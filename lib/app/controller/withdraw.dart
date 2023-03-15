// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/model/withdraw_requests.dart';
import '../data/repository/withdraw.dart';
import '../ui/widgets/common/common_alert.dart';
import '../ui/widgets/common/common_print.dart';
import 'main.dart';

class WithDrawController extends GetxController {
  static WithDrawController get to => Get.put(WithDrawController());

  TextEditingController amount = TextEditingController();

  final repository = WithdrawRepository();

  final key = GlobalKey<FormState>();

  final _isShowHintAmount = true.obs;

  get isShowHintAmount => _isShowHintAmount.value;

  set isShowHintAmount(value) {
    _isShowHintAmount.value = value;
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

  final _loading = false.obs;

  get loading => _loading.value;

  set loading(value) {
    _loading.value = value;
  }

  final _getWithDrawRequestLoading = false.obs;

  get getWithDrawRequestLoading => _getWithDrawRequestLoading.value;

  set getWithDrawRequestLoading(value) {
    _getWithDrawRequestLoading.value = value;
  }

  final _isWithdrawRequestEmpty = false.obs;

  get isWithdrawRequestEmpty => _isWithdrawRequestEmpty.value;

  set isWithdrawRequestEmpty(value) {
    _isWithdrawRequestEmpty.value = value;
  }

  final _withRequestsDetail = <Datum>[].obs;

  get withRequestsDetail => _withRequestsDetail.value;

  set withRequestsDetail(value) {
    _withRequestsDetail.value = value;
  }

  withdrawRequest() async {
    loading = true;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var id = preferences.getString('investorID');
    var body = {
      "investor_id": "$id",
      "amount": amount.text,
      "action": "withdrawal"
    };
    print("body is $body");
    try {
      var res = await repository.withdrawRequest(body: body);
      if (statusCode == 200) {
        if (res['status'] == "200") {
          loading = false;
          commonPrint(status: res['status'], msg: res['message']);
          isShowHintAmount = true;
          successAlert(Get.context!, content: "Withdraw Requested Successfully",
              confirmButtonPressed: () {
            amount.text = "";
            separatedAmount = "";
            Get.back();
          });
        } else if (res['status'] == "422") {
          loading = false;
          commonPrint(status: res['status'], msg: "Id Wrong");
          errorAlert(Get.context!, content: "Id Wrong",
              confirmButtonPressed: () {
            Get.back();
          });
        }
      } else {
        loading = false;
        commonPrint(status: "500", msg: "Error from server or No Internet");
      }
    } catch (e) {
      loading = false;
      commonPrint(
          status: "$statusCode",
          msg: "Error from login due to data mismatch or format $e");
    }
  }

  getWithdrawRequests() async {
    getWithDrawRequestLoading = true;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var id = preferences.getString('investorID');
    try {
      var res = await repository.getWithdrawRequestList(id: id);
      if (statusCode == 200) {
        if (res.status == "200") {
          getWithDrawRequestLoading = false;
          if (res.data == null || res.data == "") {
            commonPrint(status: res.status, msg: "No data or id wrong");
            isWithdrawRequestEmpty = true;
          } else {
            isWithdrawRequestEmpty = false;
            withRequestsDetail = res.data;
            commonPrint(
                status: res.status,
                msg:
                    "Withdraw request list get successfully with data : ${res.data}");
          }
        } else {
          getWithDrawRequestLoading = false;
          isWithdrawRequestEmpty = true;
          commonPrint(status: "${res.status}", msg: "UnProcessable Data");
        }
      } else {
        commonPrint(
            status: "${res.status}",
            msg: "Error from server on get withdraw request list");
        getWithDrawRequestLoading = false;
        isWithdrawRequestEmpty = true;
      }
    } catch (e) {
      commonPrint(
          status: "500",
          msg: "Withdraw request list get error due to wrong credentials");
      getWithDrawRequestLoading = false;
      isWithdrawRequestEmpty = true;
    }
  }
}
