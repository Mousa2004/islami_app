import 'dart:convert';
import 'package:flutter/services.dart';

class AzkarApi {
  static Future<List<T>> getAzkar<T>(
    String azkarType,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    var jsonContent = jsonDecode(
      await rootBundle.loadString("assets/azkars/azkar.json"),
    );

    return (jsonContent[azkarType] as List)
        .map((e) => fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
