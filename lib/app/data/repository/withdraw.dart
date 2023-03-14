import 'dart:convert';
import '../../service/api.dart';
import '../../service/http_service.dart';

class WithdrawRepository {
  final HttpHelper helper = HttpHelper();

  Future<dynamic> withdrawRequest({required body}) async {
    var response =
        await helper.post(url: ApiService.withdrawRequest, body: body);
    var res = jsonDecode(response);
    return res;
  }
}
