// To parse this JSON data, do
//
//     final passowrdUpdateModel = passowrdUpdateModelFromJson(jsonString);

import 'dart:convert';

PasswordUpdateModel passowrdUpdateModelFromJson(String str) =>
    PasswordUpdateModel.fromJson(json.decode(str));

String passowrdUpdateModelToJson(PasswordUpdateModel data) =>
    json.encode(data.toJson());

class PasswordUpdateModel {
  Data data;
  int code;
  String message;
  bool isSuccess;

  PasswordUpdateModel({
    required this.data,
    required this.code,
    required this.message,
    required this.isSuccess,
  });

  factory PasswordUpdateModel.fromJson(Map<String, dynamic> json) =>
      PasswordUpdateModel(
        data: Data.fromJson(json["data"] ?? {}),
        code: json["code"] ?? 0,
        message: json["message"] ?? '',
        isSuccess: json["isSuccess"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "code": code,
        "message": message,
        "isSuccess": isSuccess,
      };
}

class Data {
  User user;

  Data({
    required this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) =>
      Data(user: User.fromJson(json["user"] ?? {}));

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
}

class User {
  int memberId;
  String fullName;
  String phoneNumber;
  String email;

  User({
    required this.memberId,
    required this.fullName,
    required this.phoneNumber,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        memberId: json["memberId"] ?? 0,
        fullName: json["fullName"] ?? '',
        phoneNumber: json["phoneNumber"] ?? '',
        email: json["email"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "memberId": memberId,
        "fullName": fullName,
        "phoneNumber": phoneNumber,
        "email": email,
      };
}
