import 'data.dart';

class PrayTimeResponse {
  int? code;
  String? status;
  Data? data;

  PrayTimeResponse({this.code, this.status, this.data});

  factory PrayTimeResponse.fromJson(Map<String, dynamic> json) {
    return PrayTimeResponse(
      code: json['code'] as int?,
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'code': code,
    'status': status,
    'data': data?.toJson(),
  };
}
