import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliverAppBarController extends GetxController {
  ScrollController scrollController = ScrollController();
  RxBool isTransparent = true.obs;

  @override
  void onInit() {
    scrollController.addListener(() {
      if (scrollController.offset > 56) {
        isTransparent.value = false;
        return;
      }
      isTransparent.value = true;
    });
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
