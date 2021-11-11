import 'package:get/get.dart';
import 'package:parcial2movil/data/models/variables_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:parcial2movil/ui/widgets/boxes.dart';

class FavoriteController extends GetxController {
  void deleteFromFav(WeatherModel item) {
    item.delete();
  }

  Future addFav(WeatherModel item) {
    final box = Boxes.getWeather();
    box.add(item);
    return Future.error("added item");
  }
}
