class Timings {
  String? fajr;
  String? sunrise;
  String? dhuhr;
  String? asr;
  String? maghrib;
  String? isha;

  Timings({
    this.fajr,
    this.sunrise,
    this.dhuhr,
    this.asr,
    this.maghrib,
    this.isha,
  });

  factory Timings.fromJson(Map<String, dynamic> json) => Timings(
    fajr: json['Fajr'] as String?,
    sunrise: json['Sunrise'] as String?,
    dhuhr: json['Dhuhr'] as String?,
    asr: json['Asr'] as String?,
    maghrib: json['Maghrib'] as String?,
    isha: json['Isha'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'Fajr': fajr,
    'Sunrise': sunrise,
    'Dhuhr': dhuhr,
    'Asr': asr,
    'Maghrib': maghrib,
    'Isha': isha,
  };
}
