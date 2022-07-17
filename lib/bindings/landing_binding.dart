import 'package:flutter_rpg/controllers/landing_controller.dart';
import 'package:flutter_rpg/services/landing_service.dart';
import 'package:flutter_rpg/services/login_service.dart';
import 'package:get/get.dart';

class LandingBinding implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<LoginService>(LoginService.new)
      ..lazyPut<LandingService>(LandingService.new)
      ..lazyPut<LandingController>(() => LandingController(
            landingService: Get.find<LandingService>(),
            loginService: Get.find<LoginService>(),
          ));
  }
}
