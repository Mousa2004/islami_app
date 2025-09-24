import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:islami_app/api/api_constant.dart';
import 'package:islami_app/models/radio_response.dart';

class RadioApi {
  static Future<RadioResponse> getRadio() async {
    try {
      Uri url = Uri.parse(ApiConstant.radioUrl);
      final response = await http.get(url);
      final json = jsonDecode(response.body);
      return RadioResponse.fromJson(json);
    } catch (e) {
      throw Exception("Exception: $e");
    }
  }
}
