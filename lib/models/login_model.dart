import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.role,
    this.accessToken,
    this.email,
    this.password,
  });

  factory LoginModel.decoderFromJson(dynamic json) => LoginModel.fromJson(json);

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        role: json['role'],
        accessToken: json['accessToken'],
        email: json['email'],
        password: json['password'],
      );

  final String? role;
  final String? accessToken;
  final String? email;
  final String? password;

  Map<String, dynamic> toJson() => {
        'role': role,
        'accessToken': accessToken,
        'email': email,
        'password': password,
      };

  LoginModel copyWith({
    String? role,
    String? accessToken,
    String? email,
    String? password,
  }) {
    return LoginModel(
      role: role ?? this.role,
      accessToken: accessToken ?? this.accessToken,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
