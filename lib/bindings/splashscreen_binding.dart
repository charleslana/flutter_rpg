import 'package:flutter_rpg/controllers/splashscreen_controller.dart';
import 'package:get/get.dart';

class SplashscreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashscreenController>(SplashscreenController.new);
  }
}
