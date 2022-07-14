import 'package:flutter/material.dart';
import 'package:flutter_rpg/controllers/loading_overlay_controller.dart';
import 'package:flutter_rpg/interfaces/form_validator.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with FormValidator {
  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final LoadingOverlayController loadingOverlayController =
      Get.find<LoadingOverlayController>();

  @override
  void onInit() {
    emailController.text = '';
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String? validator(String? value, {bool? isValidEmail}) {
    if (value == null || value.trim().isEmpty) {
      return 'validation.field.empty'.tr;
    }
    if (isValidEmail != null && !isEmail(value.trim())) {
      return 'validation.field.email'.tr;
    }
    return null;
  }

  void login() {
    if (loginFormKey.currentState!.validate()) {
      loadingOverlayController.isLoading.value = true;
      checkUser(emailController.text, passwordController.text).then((auth) {
        if (auth) {
        } else {}
        loadingOverlayController.isLoading.value = false;
        passwordController.clear();
      });
    }
  }

  Future<bool> checkUser(String user, String password) async {
    await Future<dynamic>.delayed(const Duration(seconds: 1));
    if (user == 'example@example.com' && password == '123') {
      return Future.value(true);
    }
    return Future.value(false);
  }
}
