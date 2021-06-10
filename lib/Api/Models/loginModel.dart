// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.estado,
    required this.accessToken,
    required this.tokenType,
    required this.expiresAt,
    required this.userId,
    required this.message,
  });

  int estado;
  String accessToken;
  String tokenType;
  DateTime expiresAt;
  int userId;
  String message;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        estado: json["estado"] == null ? null : json["estado"],
        accessToken: json["access_token"] == null ? null : json["access_token"],
        tokenType: json["token_type"] == null ? null : json["token_type"],
        expiresAt: json["expires_at"],
        userId: json["user_id"] == null ? null : json["user_id"],
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "estado": estado == null ? null : estado,
        "access_token": accessToken == null ? null : accessToken,
        "token_type": tokenType == null ? null : tokenType,
        "expires_at": expiresAt == null ? null : expiresAt.toIso8601String(),
        "user_id": userId == null ? null : userId,
        "message": message == null ? null : message,
      };
}
