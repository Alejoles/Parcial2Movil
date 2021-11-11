import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parcial2movil/data/models/variables_model.dart';
import 'package:parcial2movil/data/models/weather_model.dart';
import 'package:parcial2movil/ui/widgets/boxes.dart';
import '../data/data_repository.dart';

class HomeController extends GetxController {
  List listaWeather = [
    "Descripcion",
    "Temp",
    "Velocidad",
    "Humedad",
    "Feels like",
    "Ciudad",
    "Pais"
  ].obs;

  Future prueba1(String cityName) async {
    List<WeatherItem> _regular = await DataRepository(cityName).getItems();
    listaWeather = [];
    for (var item in _regular) {
      listaWeather.add(item.weatherDescription);
      listaWeather.add(item.mainTemp);
      listaWeather.add(item.mainFeelsLike);
      listaWeather.add(item.mainHumidity);
      listaWeather.add(item.windSpeed);
      listaWeather.add(item.ciudad);
      listaWeather.add(item.pais);
    }
    final weatherinfo = WeatherModel()
      ..weatherDescription = listaWeather[0]
      ..mainTemp = listaWeather[1]
      ..mainFeelsLike = listaWeather[2]
      ..mainHumidity = listaWeather[3]
      ..windSpeed = listaWeather[4]
      ..ciudad = listaWeather[5]
      ..pais = listaWeather[6];
    //final box = Boxes.getWeather();
    //box.add(weatherinfo);
    update();
    return weatherinfo;
  }

  Icon fluticon = Icon(Icons.favorite_outline);

  void favoriteIcon(bool boolean) {
    if (listaWeather[0] != "Descripcion") {
      final weatherinfo = WeatherModel()
        ..weatherDescription = listaWeather[0]
        ..mainTemp = listaWeather[1]
        ..mainFeelsLike = listaWeather[2]
        ..mainHumidity = listaWeather[3]
        ..windSpeed = listaWeather[4]
        ..ciudad = listaWeather[5]
        ..pais = listaWeather[6];
      final box = Boxes.getWeather();
      if (boolean) {
        fluticon = Icon(Icons.favorite_outline);
        update();
      } else {
        fluticon = Icon(Icons.favorite);
        box.add(weatherinfo);
        update();
      }
    }
  }
}
