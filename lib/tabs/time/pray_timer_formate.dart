import 'package:intl/intl.dart';

class PrayTimerFormate {
  static String prayTimeFormate(String? prayTime, {bool isHijri = false}) {
    if (prayTime == null) return "";
    try {
      final parts = prayTime.split("-");
      if (parts.length != 3) return prayTime;

      final day = parts[0];
      final month = int.parse(parts[1]);
      final year = parts[2];

      if (isHijri) {
        const hijriMonths = [
          "Muh",
          "Saf",
          "Rabi I",
          "Rabi II",
          "Jum I",
          "Jum II",
          "Raj",
          "Sha",
          "Ram",
          "Shaw",
          "Dhul-Qi",
          "Dhul-Hij",
        ];
        final monthName = hijriMonths[month - 1];
        return "$day $monthName,\n$year";
      } else {
        final date = DateTime(int.parse(year), month, int.parse(day));
        return DateFormat("dd MMM,\nyyyy").format(date);
      }
    } catch (e) {
      return prayTime;
    }
  }

  static String formatTime(String time) {
    try {
      final dateTime = DateFormat("HH:mm").parse(time);

      return DateFormat("hh:mm \na").format(dateTime);
    } catch (e) {
      return time;
    }
  }
}
