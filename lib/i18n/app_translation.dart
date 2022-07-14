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
  'login.page.email': 'Email',
  'login.page.password': 'Password',
  'validation.field.empty': 'Please this field must be filled',
  'validation.field.email': 'Please, type a valid email',
};

final Map<String, String> ptBR = {
  'login.page.title': 'Conecte-se',
  'login.page.button': 'Jogue agora',
  'login.page.email': 'E-mail',
  'login.page.password': 'Senha',
  'validation.field.empty': 'Por favor, este campo deve ser preenchido',
  'validation.field.email': 'Por favor, digite um e-mail válido',
};

final Map<String, String> esES = {
  'login.page.title': 'Acceso',
  'login.page.button': 'Jugar ahora',
  'login.page.email': 'Correo electrónico',
  'login.page.password': 'Contraseña',
  'validation.field.empty': 'Por favor este campo debe ser llenado',
  'validation.field.email': 'Por favor, escriba un correo electrónico válido',
};
