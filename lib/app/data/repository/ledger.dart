import 'dart:convert';
import '../../service/api.dart';
import '../../service/http_service.dart';
import '../model/ledger_res.dart';

class LedgerRepository {
  final HttpHelper helper = HttpHelper();

  Future<LedgerRes> getLedger({required id}) async {
    var response = await helper.get(url: "${ApiService.getLedger}$id");
    var res = LedgerRes.fromMap(jsonDecode(response));
    return res;
  }
}
