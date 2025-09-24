import 'package:islami_app/models/azkar_contain_model.dart';

class AzkarListImage {
  static List<AzkarContainModel> azkarList = [
    AzkarContainModel(azkarName: "Morning prayers", imageName: "morning_azkar"),
    AzkarContainModel(azkarName: "Evening prayers", imageName: "evening_azkar"),
    AzkarContainModel(
      azkarName: "Prayer remembrances",
      imageName: "remembrances",
    ),
    AzkarContainModel(azkarName: "Tasbeeh", imageName: "tasbeeh"),
    AzkarContainModel(
      azkarName: "Sleeping Remembrances",
      imageName: "sleeping",
    ),
    AzkarContainModel(azkarName: "Wake-up supplications", imageName: "wakeup"),
    AzkarContainModel(
      azkarName: "Quranic supplications",
      imageName: "quranic_supplications",
    ),
    AzkarContainModel(
      azkarName: "Supplications of the Prophets",
      imageName: "supplications_of_the_prophets",
    ),
  ];
}
