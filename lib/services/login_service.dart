import 'package:flutter_rpg/constants/config_constant.dart';
import 'package:flutter_rpg/models/login_model.dart';
import 'package:flutter_rpg/services/language_service.dart';
import 'package:flutter_rpg/utils/functions.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginService extends GetConnect {
  final GetStorage _box = GetStorage();
  final String _key = 'login';

  @override
  void onInit() {
    final LanguageService languageService = LanguageService();

    httpClient
      ..baseUrl = baseUrl
      ..defaultDecoder = LoginModel.decoderFromJson
      ..addRequestModifier<dynamic>((dynamic request) {
        request.headers['accept-language'] = languageService.getLanguage();
        return request;
      });
    super.onInit();
  }

  Future<LoginModel> login(String email, String password) async {
    final formData = FormData({
      'email': email,
      'password': password,
    });
    final response = await post<dynamic>('/login', formData);
    if (response.status.hasError) {
      if (response.bodyString == null) {
        return Future.error(showConnectionFailure());
      }
      return Future.error(response.bodyString.toString());
    }
    return response.body;
  }

  Map<String, dynamic>? get loginBox => _box.read(_key);

  void saveLogin(LoginModel login) => _box.write(_key, login);

  void removeLogin() => _box.remove(_key);
}
