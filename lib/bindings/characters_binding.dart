import 'package:flutter_rpg/controllers/characters_controller.dart';
import 'package:get/get.dart';

class CharactersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CharactersController>(CharactersController.new);
  }
}
