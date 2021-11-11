import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';

import '../models/weather_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class WeatherClient {
  //http://api.openweathermap.org/data/2.5/forecast?id=524901&appid=";
  static const baseUrl = 'http://api.openweathermap.org/data/2.5/weather?';

  final String apiKey;

  final String cityName;
  WeatherClient(this.apiKey, this.cityName);

  bool isNumeric(String string) {
    // Null or empty string is not a number
    if (string == null || string.isEmpty) {
      return false;
    }

    // Try to parse input string to number.
    // Both integer and double work.
    // Use int.tryParse if you want to check integer only.
    // Use double.tryParse if you want to check double only.
    final number = num.tryParse(string);

    if (number == null) {
      return false;
    }

    return true;
  }

  Future<List<WeatherItem>> getItems() async {
    String check = cityName.characters.first.toString();
    var uri;
    if (isNumeric(check)) {
      var ayudante = cityName.split(",");
      uri = Uri.parse(baseUrl +
          "lat=" +
          ayudante[0] +
          "&lon=" +
          ayudante[1] +
          "&appid=" +
          apiKey);
    } else {
      uri = Uri.parse(baseUrl + "q=" + cityName + "&appid=" + apiKey);
    }
    try {
      final response = await http.get(uri).timeout(const Duration(seconds: 2));
      //print(response.body);
      if (response.statusCode == 200) {
        print("Got code 200");
        var jsonResponse = convert.jsonDecode(response.body);

        List<WeatherItem> output = [];
        output.add(WeatherItem.fromJson(jsonResponse));
        return Future.value(output);
      } else {
        return Future.error([]);
      }
    } catch (e) {
      return Future.error('Error catch');
    }
  }
}
