import 'package:flutter/material.dart';
import 'package:flutter_rpg/interfaces/custom_app_scroll_abstract.dart';
import 'package:flutter_rpg/interfaces/form_validator.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController
    with FormValidator
    implements CustomAppScrollAbstract {
  ScrollController scrollController = ScrollController();

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
    // TODO: implement goToTop
  }

  @override
  void listenScrollController() {
    // TODO: implement listenScrollController
  }
}
