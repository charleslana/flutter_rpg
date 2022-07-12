import 'package:flutter_rpg/controllers/language_controller.dart';
import 'package:get/get.dart';

class LanguageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LanguageController>(LanguageController.new);
  }
}
