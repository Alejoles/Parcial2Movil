import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';

import '../models/weather_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class WeatherClient {
  //http://api.openweathermap.org/data/2.5/forecast?id=524901&appid=";
  static const baseUrl = 'http://api.openweathermap.org/data/2.5/weather?q=';

  final String apiKey;

  final String cityName;
  WeatherClient(this.apiKey, this.cityName);

  Future<List<WeatherItem>> getItems() async {
    var uri = Uri.parse(baseUrl + cityName + "&appid=" + apiKey);
    try {
      final response = await http.get(uri).timeout(const Duration(seconds: 2));
      //print(response.body);
      if (response.statusCode == 200) {
        print("Got code 200");
        var jsonResponse = convert.jsonDecode(response.body);
        var descripcion = (jsonResponse['weather'][0]['description']);
        var temp = jsonResponse['main']['temp'];
        var feelsLike = (jsonResponse['main']['feels_like']);
        var humidity = (jsonResponse['main']['humidity']);
        var speed = (jsonResponse['wind']['speed']);

        List<WeatherItem> output = [];
        //for (var item in jsonResponse['response']['results']){}
        return Future.value(output);
      } else {
        return Future.error([]);
      }
    } catch (e) {
      return Future.error('Error catch');
    }
  }
}
