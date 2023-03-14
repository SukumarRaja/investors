import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/model/ledger_res.dart';
import '../data/model/profile_res.dart';
import '../data/repository/ledger.dart';
import '../data/repository/profile.dart';
import '../ui/widgets/common/common_print.dart';
import 'auth.dart';
import 'main.dart';

class DashboardController extends GetxController {
  static DashboardController get to => Get.put(DashboardController());

  final repository = ProfileRepository();
  final ledgerRepository = LedgerRepository();

  final _getProfileLoading = false.obs;

  get getProfileLoading => _getProfileLoading.value;

  set getProfileLoading(value) {
    _getProfileLoading.value = value;
  }

  final _profileDetails = Data().obs;

  get profileDetails => _profileDetails.value;

  set profileDetails(value) {
    _profileDetails.value = value;
  }

  final _getLedgerLoading = false.obs;

  get getLedgerLoading => _getLedgerLoading.value;

  set getLedgerLoading(value) {
    _getLedgerLoading.value = value;
  }

  final _isLedgerEmpty = false.obs;

  get isLedgerEmpty => _isLedgerEmpty.value;

  set isLedgerEmpty(value) {
    _isLedgerEmpty.value = value;
  }

  final _ledgerDetails = <Datum>[].obs;

  get ledgerDetails => _ledgerDetails.value;

  set ledgerDetails(value) {
    _ledgerDetails.value = value;
  }

  getProfile() async {
    getProfileLoading = true;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var id = preferences.getString('investorID');
    try {
      var res = await repository.getProfile(id: id);
      if (statusCode == 200) {
        if (res.status == "200") {
          getProfileLoading = false;
          if (res.data == null || res.data == "") {
            commonPrint(status: res.status, msg: "No data or id wrong");
            isLedgerEmpty = true;
          } else {
            isLedgerEmpty = false;
            profileDetails = res.data;
            commonPrint(
                status: res.status,
                msg: "Profile get successfully with data : ${res.data}");
            Map storedData = {
              "name": "${res.data!.name}",
              "email": "${res.data!.email}",
              "phone": "${res.data!.mobile}",
            };
            AuthController.to.storeLocalDevice(body: storedData);
          }
        } else {
          isLedgerEmpty = true;
          getProfileLoading = false;
          commonPrint(status: "${res.status}", msg: "UnProcessable Data");
        }
      } else {
        commonPrint(
            status: "${res.status}", msg: "Error from server on get profile");
        getProfileLoading = false;
        isLedgerEmpty = true;
      }
    } catch (e) {
      commonPrint(
          status: "500", msg: "Profile get error due to wrong credentials");
      getProfileLoading = false;
      isLedgerEmpty = true;
    }
  }

  getLedger() async {
    getLedgerLoading = true;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var id = preferences.getString('investorID');
    try {
      var res = await ledgerRepository.getLedger(id: id);
      if (statusCode == 200) {
        if (res.status == "200") {
          getLedgerLoading = false;
          if (res.data == null || res.data == "") {
            commonPrint(status: res.status, msg: "No data or id wrong");
            isLedgerEmpty = true;
          } else {
            isLedgerEmpty = false;
            ledgerDetails = res.data;
            commonPrint(
                status: res.status,
                msg: "Ledger get successfully with data : ${res.data}");
          }
        } else {
          getLedgerLoading = false;
          isLedgerEmpty = true;
          commonPrint(status: "${res.status}", msg: "UnProcessable Data");
        }
      } else {
        commonPrint(
            status: "${res.status}", msg: "Error from server on get ledger");
        getLedgerLoading = false;
        isLedgerEmpty = true;
      }
    } catch (e) {
      commonPrint(
          status: "500", msg: "Ledger get error due to wrong credentials");
      getLedgerLoading = false;
      isLedgerEmpty = true;
    }
  }
}
