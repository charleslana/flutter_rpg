import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.role,
    this.accessToken,
    this.email,
  });

  factory LoginModel.decoderFromJson(dynamic json) => LoginModel.fromJson(json);

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        role: json['role'],
        accessToken: json['accessToken'],
        email: json['email'],
      );

  final String? role;
  final String? accessToken;
  final String? email;

  Map<String, dynamic> toJson() => {
        'role': role,
        'accessToken': accessToken,
        'email': email,
      };
}
