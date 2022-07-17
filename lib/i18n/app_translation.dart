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
  'landing.page.connection': 'Connecting to the server...',
  'landing.page.version':
      'There is a new update available, please update the app on your store...',
  'landing.page.start': 'Preparing to start...',
  'connection.failure': 'Failed to connect to server',
  'validation.field.empty': 'Please this field must be filled',
  'validation.field.email': 'Please, type a valid email',
  'validation.field.password.confirmation': 'Passwords must be the same',
  'validation.field.password.length':
      'Password must contain at least 6 characters',
  'login.page.title': 'Login',
  'login.page.button': 'Play now',
  'login.page.email': 'Email',
  'login.page.password': 'Password',
  'login.page.have.registration': "Don't have a registration?",
  'login.page.register.button': 'Register',
  'register.page.title': 'Register',
  'register.page.email': 'Email',
  'register.page.password': 'Password',
  'register.page.password.confirmartion': 'Confirm the password',
  'register.page.button': 'Register',
  'register.page.service.terms.text':
      'By creating an account you agree to read all ',
  'register.page.service.terms.action': 'Service terms',
  'characters.page.title': 'Characters',
};

final Map<String, String> ptBR = {
  'landing.page.connection': 'Conectando no servidor...',
  'landing.page.version':
      'Há uma nova atualização disponível, por favor atualize a aplicação na sua loja.',
  'landing.page.start': 'Preparando para iniciar...',
  'connection.failure': 'Falha ao conectar no servidor',
  'validation.field.empty': 'Por favor, este campo deve ser preenchido',
  'validation.field.email': 'Por favor, digite um e-mail válido',
  'validation.field.password.confirmation': 'As senhas devem ser iguais',
  'validation.field.password.length':
      'A senha deve conter pelo menos 6 caracteres',
  'login.page.title': 'Conecte-se',
  'login.page.button': 'Jogue agora',
  'login.page.email': 'E-mail',
  'login.page.password': 'Senha',
  'login.page.have.registration': 'Não tem cadastro?',
  'login.page.register.button': 'Cadastre-se',
  'register.page.title': 'Cadastre-se',
  'register.page.email': 'E-mail',
  'register.page.password': 'Senha',
  'register.page.password.confirmartion': 'Confirme a senha',
  'register.page.button': 'Registrar',
  'register.page.service.terms.text':
      'Ao criar uma conta você aceita ler todos os ',
  'register.page.service.terms.action': 'Termos de serviço',
  'characters.page.title': 'Personagens',
};

final Map<String, String> esES = {
  'landing.page.connection': 'Conectando al servidor...',
  'landing.page.version':
      'Hay una nueva actualización disponible, actualice la aplicación en su tienda.',
  'landing.page.start': 'Preparándonos para empezar...',
  'connection.failure': 'Error al conectar con el servidor',
  'validation.field.empty': 'Por favor este campo debe ser llenado',
  'validation.field.email': 'Por favor, escriba un correo electrónico válido',
  'validation.field.password.confirmation':
      'Las contraseñas deben ser las mismas',
  'validation.field.password.length':
      'La contraseña debe contener al menos 6 caracteres',
  'login.page.title': 'Acceso',
  'login.page.button': 'Jugar ahora',
  'login.page.email': 'Correo electrónico',
  'login.page.password': 'Contraseña',
  'login.page.have.registration': '¿No tienes un registro?',
  'login.page.register.button': 'Registro',
  'register.page.title': 'Registro',
  'register.page.email': 'Correo electrónico',
  'register.page.password': 'Contraseña',
  'register.page.password.confirmartion': 'Confirmar la contraseña',
  'register.page.button': 'Registro',
  'register.page.service.terms.text': 'Al crear una cuenta, acepta leer todo ',
  'register.page.service.terms.action': 'Términos del servicio',
  'characters.page.title': 'Personajes',
};
