import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/language_model.dart';

class AppTranslation {
  Map<String, Map<String, String>> translationsKeys = {
    'en_US': enUS,
    'pt_BR': ptBR,
    'es_ES': esES,
  };

  static final List<LanguageModel> languages = [
    LanguageModel('en', const Locale('en', 'US')),
    LanguageModel('pt', const Locale('pt', 'BR')),
    LanguageModel('es', const Locale('es', 'ES')),
  ];
}

final Map<String, String> enUS = {
  'login.page.title': 'Login',
  'login.page.button': 'Play now',
};

final Map<String, String> ptBR = {
  'login.page.title': 'Conecte-se',
  'login.page.button': 'Jogue agora',
};

final Map<String, String> esES = {
  'login.page.title': 'Acceso',
  'login.page.button': 'Jugar ahora',
};
