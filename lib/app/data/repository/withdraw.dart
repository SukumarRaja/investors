import 'dart:convert';
import '../../service/api.dart';
import '../../service/http_service.dart';
import '../model/withdraw_requests.dart';

class WithdrawRepository {
  final HttpHelper helper = HttpHelper();

  Future<dynamic> withdrawRequest({required body}) async {
    var response =
        await helper.post(url: ApiService.withdrawRequest, body: body);
    var res = jsonDecode(response);
    return res;
  }

  Future<WithdrawRequestsRes> getWithdrawRequestList({required id}) async {
    var response =
        await helper.get(url: "${ApiService.withdrawRequestList}$id");
    var res = WithdrawRequestsRes.fromMap(jsonDecode(response));
    return res;
  }
}
