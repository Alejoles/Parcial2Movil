class WeatherItem {
  String? weatherDescription;
  double? mainTemp;
  double? mainFeelsLike;
  int? mainHumidity;
  double? windSpeed;
  String? ciudad;
  String? pais;

  WeatherItem(
      {required this.weatherDescription,
      required this.mainTemp,
      required this.mainFeelsLike,
      required this.mainHumidity,
      required this.windSpeed});

  WeatherItem.fromJson(Map<String, dynamic> json) {
    weatherDescription = json['weather'][0]['description'];
    mainTemp = json['main']['temp'];
    mainFeelsLike = json['main']['feels_like'];
    mainHumidity = json['main']['humidity'];
    windSpeed = json['wind']['speed'];
    ciudad = json['name'];
    pais = json['sys']['country'];
  }
}
