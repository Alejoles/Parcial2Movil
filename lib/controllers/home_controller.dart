import 'package:get/get.dart';
import 'package:parcial2movil/data/models/weather_model.dart';
import '../data/data_repository.dart';

class HomeController extends GetxController {
  Future prueba1(String cityName) async {
    List<WeatherItem> _regular = await DataRepository(cityName).getItems();
    //await DataRepository(cityName).getItems();

    for (var item in _regular) {
      print(item.mainHumidity);
    }
  }

  void prueba2() {}
}
