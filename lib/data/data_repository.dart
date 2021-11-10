import 'remote/weather_client.dart';
import 'models/weather_model.dart';

class DataRepository {
  late WeatherClient client;
  static const apiKey = "47581f99906ff83fe45a63f5be84bd10";

  final String cityName;

  DataRepository(this.cityName) {
    client = WeatherClient(apiKey, cityName);
  }

  Future<List<WeatherItem>> getItems() async {
    return await client.getItems();
  }
}
