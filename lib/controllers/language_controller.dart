import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/language_model.dart';
import 'package:flutter_rpg/services/language_service.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  final List<LanguageModel> languages = [
    LanguageModel('en', const Locale('en', 'US')),
    LanguageModel('pt', const Locale('pt', 'BR')),
    LanguageModel('es', const Locale('es', 'ES')),
  ];
  RxString selectedLanguage = Get.locale!.languageCode.obs;
  LanguageService languageService = LanguageService();

  @override
  void onInit() {
    selectedLanguage.value = languageService.locale == null
        ? selectedLanguage.value
        : languageService.locale!.languageCode;
    super.onInit();
  }

  void changeLanguage(String locale) {
    if (locale != selectedLanguage.value) {
      selectedLanguage.value = locale;
      languageService.change(Locale(locale));
    }
  }
}
