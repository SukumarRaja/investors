import 'dart:convert';
import 'package:investors/app/data/model/profile_res.dart';

import '../../service/api.dart';
import '../../service/http_service.dart';

class ProfileRepository {
  final HttpHelper helper = HttpHelper();

  Future<ProfileRes> getProfile({required id}) async {
    var response = await helper.get(url: "${ApiService.getProfile}$id");
    var res = ProfileRes.fromMap(jsonDecode(response));
    return res;
  }
}
