import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) {
  final a = LoginResponseModel.fromJson(json.decode(str));
  print(a.accessToken);
  print(a.user?.email);
  print(a.success);
  print(a.refreshToken);
  return a;
}

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    this.success,
    this.accessToken,
    this.refreshToken,
    this.user,
  });

  bool? success;
  String? accessToken;
  String? refreshToken;
  User? user;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        success: json["success"],
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "accessToken": accessToken,
        "refreshToken": refreshToken,
        "user": user!.toJson(),
      };
}

class User {
  User({
    this.email,
    this.id,
    this.username,
    this.role,
    this.isBlocked,
    this.resetPasswordToken,
    this.resetPasswordTokenExpire,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.accessToken,
    this.refreshToken,
  });

  Email? email;
  String? id;
  String? username;
  String? role;
  bool? isBlocked;
  dynamic resetPasswordToken;
  dynamic resetPasswordTokenExpire;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? accessToken;
  String? refreshToken;

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: Email.fromJson(json["email"]),
        id: json["_id"],
        username: json["username"],
        role: json["role"],
        isBlocked: json["isBlocked"],
        resetPasswordToken: json["resetPasswordToken"],
        resetPasswordTokenExpire: json["resetPasswordTokenExpire"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "email": email!.toJson(),
        "_id": id,
        "username": username,
        "role": role,
        "isBlocked": isBlocked,
        "resetPasswordToken": resetPasswordToken,
        "resetPasswordTokenExpire": resetPasswordTokenExpire,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      };
}

class Email {
  Email({
    this.verified,
    this.verificationToken,
    this.verificationTokenExpire,
    this.address,
  });

  bool? verified;
  dynamic verificationToken;
  dynamic verificationTokenExpire;
  String? address;

  factory Email.fromJson(Map<String, dynamic> json) => Email(
        verified: json["verified"],
        verificationToken: json["verificationToken"],
        verificationTokenExpire: json["verificationTokenExpire"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "verified": verified,
        "verificationToken": verificationToken,
        "verificationTokenExpire": verificationTokenExpire,
        "address": address,
      };
}
