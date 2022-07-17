import 'package:flutter_rpg/constants/text_constant.dart';
import 'package:flutter_rpg/models/api_error_model.dart';
import 'package:flutter_rpg/models/login_model.dart';
import 'package:flutter_rpg/services/language_service.dart';
import 'package:get/get.dart';

class LoginService extends GetConnect {
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
        return Future.error(apiErrorModelToJson(ApiErrorModel(
          status: '400',
          message: 'Falha ao conectar no servidor',
        )));
      }
      return Future.error(response.bodyString.toString());
    }
    return response.body;
  }
}
