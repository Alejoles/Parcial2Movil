import 'package:get/get.dart';
import 'package:parcial2movil/controllers/dashboard_controller.dart';
import 'package:parcial2movil/controllers/favorite_controller.dart';
import 'package:parcial2movil/controllers/home_controller.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashBoardController>(() => DashBoardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<FavoriteController>(() => FavoriteController());
  }
}
