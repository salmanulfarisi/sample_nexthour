import 'dart:convert';

LoginErrorResponseModel loginErrorResponseModelFromJson(String str) =>
    LoginErrorResponseModel.fromJson(json.decode(str));

String loginErrorResponseModelToJson(LoginErrorResponseModel data) =>
    json.encode(data.toJson());

class LoginErrorResponseModel {
  LoginErrorResponseModel({
    this.success,
    this.message,
  });

  bool? success;
  String? message;

  factory LoginErrorResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginErrorResponseModel(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}
