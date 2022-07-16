import 'package:flutter/material.dart';
import 'package:flutter_rpg/controllers/loading_overlay_controller.dart';
import 'package:flutter_rpg/enums/toast_enum.dart';
import 'package:flutter_rpg/interfaces/custom_app_scroll_abstract.dart';
import 'package:flutter_rpg/interfaces/form_validator.dart';
import 'package:flutter_rpg/routes/app_route_generator.dart';
import 'package:flutter_rpg/utils/functions.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController
    with FormValidator
    implements CustomAppScrollAbstract {
  ScrollController scrollController = ScrollController();
  final LoadingOverlayController loadingOverlayController =
      Get.find<LoadingOverlayController>();
  final registerFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

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

  String? validator(String? value,
      {bool? isValidEmail, bool? isPasswordConfirmation}) {
    if (value == null || value.trim().isEmpty) {
      return 'validation.field.empty'.tr;
    }
    if (isValidEmail != null && !isEmail(value.trim())) {
      return 'validation.field.email'.tr;
    }
    if (isPasswordConfirmation != null && value.trim().length < 6) {
      return 'validation.field.password.length'.tr;
    }
    if (isPasswordConfirmation != null &&
        passwordController.text.trim() !=
            passwordConfirmationController.text.trim()) {
      return 'validation.field.password.confirmation'.tr;
    }
    return null;
  }

  void register() {
    if (registerFormKey.currentState!.validate()) {
      loadingOverlayController.isLoading.value = true;
      checkUser(emailController.text, passwordController.text).then((auth) {
        if (auth) {
          showToast('E-mail já cadastrado', ToastEnum.error);
        } else {
          navigateOffAll(AppRoutes.characters);
        }
        loadingOverlayController.isLoading.value = false;
      });
    }
  }

  Future<bool> checkUser(String user, String password) async {
    await Future<dynamic>.delayed(const Duration(seconds: 1));
    if (user == 'example@example.com' && password == '123456') {
      return Future.value(true);
    }
    return Future.value(false);
  }
}
