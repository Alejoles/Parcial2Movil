import 'package:get/get.dart';
import 'package:parcial2movil/data/models/weather_model.dart';
import '../data/data_repository.dart';

class HomeController extends GetxController {
  List listaWeather = [
    "Descripcion",
    "Temp",
    "Velocidad",
    "Humedad",
    "Feels like"
  ];

  Future prueba1(String cityName) async {
    List<WeatherItem> _regular = await DataRepository(cityName).getItems();
    listaWeather = [];
    for (var item in _regular) {
      listaWeather.add(item.weatherDescription);
      listaWeather.add(item.mainTemp);
      listaWeather.add(item.mainFeelsLike);
      listaWeather.add(item.mainHumidity);
      listaWeather.add(item.windSpeed);
    }
    update();
  }
}
