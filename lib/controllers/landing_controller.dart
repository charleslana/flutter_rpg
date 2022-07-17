import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/api_error_model.dart';
import 'package:flutter_rpg/models/login_model.dart';
import 'package:flutter_rpg/routes/app_route_generator.dart';
import 'package:flutter_rpg/services/encrypt_service.dart';
import 'package:flutter_rpg/services/landing_service.dart';
import 'package:flutter_rpg/services/login_service.dart';
import 'package:flutter_rpg/services/pubspec_service.dart';
import 'package:flutter_rpg/utils/functions.dart';
import 'package:get/get.dart';

class LandingController extends GetxController {
  LandingController({
    required this.landingService,
    required this.loginService,
  });

  LandingService landingService = LandingService();
  PubspecService pubspecService = PubspecService();
  LoginService loginService = LoginService();
  EncryptService encryptService = EncryptService();
  ScrollController scrollController = ScrollController();
  RxString text = 'landing.page.connection'.tr.obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    _fetchVersion();
    super.onInit();
  }

  Future<void> _fetchVersion() async {
    await landingService.getVersion().then(
      _validateConnection,
      onError: (dynamic error) {
        final ApiErrorModel apiErrorModel = apiErrorModelFromJson(error);
        isLoading.value = false;
        text.value = apiErrorModel.message!;
      },
    );
  }

  Future<void> _validateConnection(String result) async {
    final String version = await pubspecService.getVersion();
    if (result != version) {
      isLoading.value = false;
      text.value = 'landing.page.version'.tr;
      return;
    }
    text.value = 'landing.page.start'.tr;
    await _validateLoginBox();
  }

  Future<void> _validateLoginBox() async {
    final Map<String, dynamic>? loginBox = loginService.loginBox;
    if (loginBox == null) {
      navigateOff(AppRoutes.login);
      return;
    }
    final LoginModel login = LoginModel.decoderFromJson(loginBox);
    if (login.email == null || login.password == null) {
      navigateOff(AppRoutes.login);
      return;
    }
    await _validateLogin(login);
  }

  Future<void> _validateLogin(LoginModel login) async {
    await loginService
        .login(login.email!, encryptService.decrypt(login.password!))
        .then(
      (result) {
        navigateOff(AppRoutes.characters);
      },
      onError: (dynamic error) {
        navigateOff(AppRoutes.login);
      },
    );
  }
}
