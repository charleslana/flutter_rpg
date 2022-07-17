import 'package:flutter/material.dart';
import 'package:flutter_rpg/enums/toast_enum.dart';
import 'package:flutter_rpg/models/api_error_model.dart';
import 'package:flutter_rpg/routes/app_route_generator.dart';
import 'package:flutter_rpg/services/login_service.dart';
import 'package:get/get.dart';

void showToast(String message, ToastEnum toast) {
  _closeToast();
  Get.rawSnackbar(
    messageText: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: toast == ToastEnum.error ? Colors.red : Colors.green[900],
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 2,
          ),
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
    backgroundColor: Colors.transparent,
    dismissDirection: DismissDirection.horizontal,
    forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
    reverseAnimationCurve: Curves.easeOut,
    borderRadius: 10,
    margin: const EdgeInsets.all(15),
    animationDuration: const Duration(),
    duration: const Duration(seconds: 4),
  );
}

void _closeToast() {
  if (Get.isSnackbarOpen) {
    Get.back<dynamic>();
    return;
  }
}

void navigate(String route) {
  Get.toNamed<dynamic>(route);
}

void navigateOff(String route) {
  Get.offNamed<dynamic>(route);
}

void navigateOffAll(String route) {
  Get.offAllNamed<dynamic>(route);
}

void logout() {
  LoginService().removeLogin();
  navigateOff(AppRoutes.login);
}

String showConnectionFailure() {
  return apiErrorModelToJson(ApiErrorModel(
    status: '400',
    message: 'connection.failure'.tr,
  ));
}
