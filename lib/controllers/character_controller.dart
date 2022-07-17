import 'package:flutter/material.dart';
import 'package:flutter_rpg/controllers/loading_overlay_controller.dart';
import 'package:flutter_rpg/interfaces/custom_app_scroll_abstract.dart';
import 'package:get/get.dart';

class CharacterController extends GetxController
    implements CustomAppScrollAbstract {
  final LoadingOverlayController loadingOverlayController =
      Get.find<LoadingOverlayController>();
  ScrollController scrollController = ScrollController();
  RxDouble offset = 0.0.obs;

  @override
  void onInit() {
    listenScrollController();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  @override
  void goToTop() {
    if (scrollController.hasClients) {
      scrollController.jumpTo(scrollController.position.minScrollExtent);
    }
  }

  @override
  void listenScrollController() {
    scrollController.addListener(() {
      offset.value = scrollController.offset;
    });
  }
}
