import 'package:flutter_rpg/i18n/app_translation.dart';
import 'package:flutter_rpg/models/language_model.dart';
import 'package:flutter_rpg/services/language_service.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  Rx<LanguageModel> selectedLanguage = AppTranslation.languages
      .where((language) => language.language == Get.locale!.languageCode)
      .toList()
      .first
      .obs;
  LanguageService languageService = LanguageService();

  @override
  void onInit() {
    selectedLanguage.value = languageService.locale == null
        ? selectedLanguage.value
        : AppTranslation.languages
            .where((language) =>
                language.language == languageService.locale!.languageCode)
            .toList()
            .first;
    super.onInit();
  }

  void changeLanguage(LanguageModel languageModel) {
    if (languageModel.locale != selectedLanguage.value.locale) {
      selectedLanguage.value = languageModel;
      languageService.change(languageModel.locale);
    }
  }
}
