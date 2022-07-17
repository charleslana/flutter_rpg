import 'package:flutter_rpg/controllers/login_controller.dart';
import 'package:flutter_rpg/services/login_service.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<LoginService>(LoginService.new)
      ..lazyPut<LoginController>(() => LoginController(
            loginService: Get.find<LoginService>(),
          ));
  }
}
