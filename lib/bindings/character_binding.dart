import 'package:flutter_rpg/controllers/character_controller.dart';
import 'package:get/get.dart';

class CharacterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CharacterController>(CharacterController.new);
  }
}
