import 'dart:convert';

import 'package:islami_app/api/api_constant.dart';
import 'package:http/http.dart' as http;
import 'package:islami_app/models/pray_time_response/pray_time_response.dart';

class PrayTimeApi {
  static Future<PrayTimeResponse> getPrayTime() async {
    try {
      Uri uri = Uri.parse(ApiConstant.prayTimeUrl);
      final response = await http.get(uri);
      final json = jsonDecode(response.body);
      return PrayTimeResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
