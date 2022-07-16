import 'package:flutter/material.dart';
import 'package:flutter_rpg/controllers/loading_overlay_controller.dart';
import 'package:flutter_rpg/enums/toast_enum.dart';
import 'package:flutter_rpg/interfaces/custom_app_scroll_abstract.dart';
import 'package:flutter_rpg/interfaces/form_validator.dart';
import 'package:flutter_rpg/routes/app_route_generator.dart';
import 'package:flutter_rpg/utils/functions.dart';
import 'package:get/get.dart';

class LoginController extends GetxController
    with FormValidator
    implements CustomAppScrollAbstract {
  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final LoadingOverlayController loadingOverlayController =
      Get.find<LoadingOverlayController>();
  ScrollController scrollController = ScrollController();
  RxDouble offset = 0.0.obs;

  @override
  void onInit() {
    emailController.text = '';
    listenScrollController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
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
          showToast('Usuário inexistente ou senha inválida', ToastEnum.error);
        } else {
          navigateOff(AppRoutes.characters);
        }
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
