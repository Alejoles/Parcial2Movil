class WeatherItem {
  String? weatherDescription;
  double? mainTemp;
  double? mainFeelsLike;
  int? mainHumidity;
  double? windSpeed;

  WeatherItem(
      {required this.weatherDescription,
      required this.mainTemp,
      required this.mainFeelsLike,
      required this.mainHumidity,
      required this.windSpeed});

  WeatherItem.fromJson(Map<String, dynamic> json) {
    weatherDescription = json['description'];
    mainTemp = json['temp'];
    mainFeelsLike = json['feels_like'];
    mainHumidity = json['humidity'];
    windSpeed = json['speed'];
  }
}
