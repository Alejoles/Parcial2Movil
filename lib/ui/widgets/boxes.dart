import 'package:hive/hive.dart';
import 'package:parcial2movil/data/models/variables_model.dart';

class Boxes {
  static Box<WeatherModel> getWeather() => Hive.box<WeatherModel>('weathers');
}
