import 'package:get/get.dart';
import '../data/data_repository.dart';

class HomeController extends GetxController {
  Future prueba1(String cityName) {
    return DataRepository(cityName).getItems();
  }
}
