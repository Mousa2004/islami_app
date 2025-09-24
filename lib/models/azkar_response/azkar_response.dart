import 'evening_prayer.dart';
import 'morning_prayer.dart';
import 'quranic_supplication.dart';
import 'prayer_remembrances.dart';
import 'sleeping_remembrance.dart';
import 'supplications_of_the_prophet.dart';
import 'tasbeeh.dart';
import 'wake_up_supplication.dart';

class AzkarResponse {
  List<MorningPrayer>? morningPrayers;
  List<EveningPrayer>? eveningPrayers;
  List<PrayerRemembrances>?
  remembrancesAfterThePeaceGreetingOfTheObligatoryPrayer;
  List<Tasbeeh>? tasbeeh;
  List<SleepingRemembrance>? sleepingRemembrances;
  List<WakeUpSupplication>? wakeUpSupplications;
  List<QuranicSupplication>? quranicSupplications;
  List<SupplicationsOfTheProphet>? supplicationsOfTheProphets;

  AzkarResponse({
    this.morningPrayers,
    this.eveningPrayers,
    this.remembrancesAfterThePeaceGreetingOfTheObligatoryPrayer,
    this.tasbeeh,
    this.sleepingRemembrances,
    this.wakeUpSupplications,
    this.quranicSupplications,
    this.supplicationsOfTheProphets,
  });

  factory AzkarResponse.fromJson(Map<String, dynamic> json) => AzkarResponse(
    morningPrayers: (json['Morning prayers'] as List<dynamic>?)
        ?.map((e) => MorningPrayer.fromJson(e as Map<String, dynamic>))
        .toList(),
    eveningPrayers: (json['Evening prayers'] as List<dynamic>?)
        ?.map((e) => EveningPrayer.fromJson(e as Map<String, dynamic>))
        .toList(),
    remembrancesAfterThePeaceGreetingOfTheObligatoryPrayer:
        (json['Prayer remembrances'] as List<dynamic>?)
            ?.map((e) => PrayerRemembrances.fromJson(e as Map<String, dynamic>))
            .toList(),
    tasbeeh: (json['Tasbeeh'] as List<dynamic>?)
        ?.map((e) => Tasbeeh.fromJson(e as Map<String, dynamic>))
        .toList(),
    sleepingRemembrances: (json['Sleeping Remembrances'] as List<dynamic>?)
        ?.map((e) => SleepingRemembrance.fromJson(e as Map<String, dynamic>))
        .toList(),
    wakeUpSupplications: (json['Wake-up supplications'] as List<dynamic>?)
        ?.map((e) => WakeUpSupplication.fromJson(e as Map<String, dynamic>))
        .toList(),
    quranicSupplications: (json['Quranic supplications'] as List<dynamic>?)
        ?.map((e) => QuranicSupplication.fromJson(e as Map<String, dynamic>))
        .toList(),
    supplicationsOfTheProphets:
        (json['Supplications of the Prophets'] as List<dynamic>?)
            ?.map(
              (e) =>
                  SupplicationsOfTheProphet.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'Morning prayers': morningPrayers?.map((e) => e.toJson()).toList(),
    'Evening prayers': eveningPrayers?.map((e) => e.toJson()).toList(),
    'Remembrances after the peace greeting of the obligatory prayer':
        remembrancesAfterThePeaceGreetingOfTheObligatoryPrayer
            ?.map((e) => e.toJson())
            .toList(),
    'Tasbeeh': tasbeeh?.map((e) => e.toJson()).toList(),
    'Sleeping Remembrances': sleepingRemembrances
        ?.map((e) => e.toJson())
        .toList(),
    'Wake-up supplications': wakeUpSupplications
        ?.map((e) => e.toJson())
        .toList(),
    'Quranic supplications': quranicSupplications
        ?.map((e) => e.toJson())
        .toList(),
    'Supplications of the Prophets': supplicationsOfTheProphets
        ?.map((e) => e.toJson())
        .toList(),
  };
}
