class Offset {
  int? fajr;
  int? sunrise;
  int? dhuhr;
  int? asr;
  int? maghrib;
  int? isha;

  Offset({
    this.fajr,
    this.sunrise,
    this.dhuhr,
    this.asr,
    this.maghrib,
    this.isha,
  });

  factory Offset.fromJson(Map<String, dynamic> json) => Offset(
    fajr: json['Fajr'] as int?,
    sunrise: json['Sunrise'] as int?,
    dhuhr: json['Dhuhr'] as int?,
    asr: json['Asr'] as int?,
    maghrib: json['Maghrib'] as int?,
    isha: json['Isha'] as int?,
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
