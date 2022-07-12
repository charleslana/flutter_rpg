import 'package:flutter_rpg/controllers/form_login_controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormLoginController>(FormLoginController.new);
  }
}
