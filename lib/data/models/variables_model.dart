import 'package:hive/hive.dart';

part 'variables_model.g.dart';

@HiveType(typeId: 0)
class WeatherModel extends HiveObject {
  @HiveField(0)
  late String weatherDescription;

  @HiveField(1)
  late double mainTemp;

  @HiveField(2)
  late double mainFeelsLike;

  @HiveField(3)
  late int mainHumidity;

  @HiveField(4)
  late double windSpeed;

  @HiveField(5)
  late String ciudad;

  @HiveField(6)
  late String pais;
}
