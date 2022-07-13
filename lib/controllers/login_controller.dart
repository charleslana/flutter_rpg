import 'package:flutter/material.dart';
import 'package:flutter_rpg/interfaces/form_validator.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with FormValidator {
  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
    if (value == null || value.isEmpty) {
      return 'Please this field must be filled';
    }
    if (isValidEmail != null && !isEmail(value)) {
      return 'Please, type a valid email';
    }
    return null;
  }

  void login() {
    if (loginFormKey.currentState!.validate()) {
      checkUser(emailController.text, passwordController.text).then((auth) {
        if (auth) {
          Get.snackbar('Login', 'Login successfully');
        } else {
          Get.snackbar('Login', 'Invalid email or password');
        }
        passwordController.clear();
      });
    }
  }

  Future<bool> checkUser(String user, String password) {
    if (user == 'example@example.com' && password == '123') {
      return Future.value(true);
    }
    return Future.value(false);
  }
}
