import 'package:flutter/foundation.dart';
import 'package:loggy/loggy.dart';

import '../models/weather_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class WeatherClient {
  //static const apiKey = "47581f99906ff83fe45a63f5be84bd10";
  static const baseUrl =
      'http://api.openweathermap.org/data/2.5/forecast?id=524901&appid=';

  final String apiKey;
  WeatherClient(this.apiKey);

  Future<List<WeatherItem>> getItems(String topic) async {
    var uri = Uri.parse(baseUrl + apiKey);

    try {
      final response = await http.get(uri).timeout(const Duration(seconds: 1));
      if (response.statusCode == 200) {
        logInfo("Got code 200, great!");
        var jsonResponse = convert.jsonDecode(response.body);
        int itemCount = jsonResponse['response']['total'];
        logInfo("We got $itemCount items");

        if (itemCount == 0) {
          logError("get got nothing");
          return [];
        }
        List<WeatherItem> output = [];
        return Future.value(output);
      } else {
        return Future.error([]);
      }
    } catch (e) {
      logError('Client error Timeout');
      return Future.error('Client error Timeout');
    }
  }
}
