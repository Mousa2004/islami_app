import 'radio_model.dart';

class RadioResponse {
  List<RadioModel>? radios;

  RadioResponse({this.radios});

  factory RadioResponse.fromJson(Map<String, dynamic> json) => RadioResponse(
    radios: (json['radios'] as List<dynamic>?)
        ?.map((e) => RadioModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'radios': radios?.map((e) => e.toJson()).toList(),
  };
}
