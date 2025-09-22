import 'dart:convert';

import 'package:islami_app/api/api_constant.dart';
import 'package:islami_app/api/reciters_response.dart';
import 'package:http/http.dart' as http;

class RecitersApi {
  static Future<RecitersResponse> getReciters() async {
    try {
      Uri url = Uri.parse(ApiConstant.recitesUrl);
      final response = await http.get(url);
      final json = jsonDecode(response.body);
      return RecitersResponse.fromJson(json);
    } catch (e) {
      throw Exception("Exception: $e");
    }
  }
}
