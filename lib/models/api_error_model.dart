import 'dart:convert';

ApiErrorModel apiErrorModelFromJson(String str) =>
    ApiErrorModel.fromJson(json.decode(str));

String apiErrorModelToJson(ApiErrorModel data) => json.encode(data.toJson());

class ApiErrorModel {
  ApiErrorModel({
    this.status,
    this.message,
    this.value,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) => ApiErrorModel(
        status: json['status'],
        message: json['message'],
        value: json['value'],
      );

  final String? status;
  final String? message;
  final String? value;

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'value': value,
      };
}
