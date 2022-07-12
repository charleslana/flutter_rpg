import 'package:flutter_rpg/controllers/sliver_app_bar_controller.dart';
import 'package:get/get.dart';

class SliverAppBarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SliverAppBarController>(SliverAppBarController.new);
  }
}
