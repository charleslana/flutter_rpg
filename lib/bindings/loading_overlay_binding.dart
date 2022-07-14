import 'package:flutter_rpg/controllers/loading_overlay_controller.dart';
import 'package:get/get.dart';

class LoadingOverlayBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoadingOverlayController>(LoadingOverlayController.new);
  }
}
