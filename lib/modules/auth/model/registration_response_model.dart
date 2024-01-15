// To parse this JSON data, do
//
//     final registrationResponseModel = registrationResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RegistrationResponseModel registrationResponseModelFromJson(String str) => RegistrationResponseModel.fromJson(json.decode(str));

String registrationResponseModelToJson(RegistrationResponseModel data) => json.encode(data.toJson());

class RegistrationResponseModel {
  Data data;
  int code;
  String message;
  bool isSuccess;

  RegistrationResponseModel({
    required this.data,
    required this.code,
    required this.message,
    required this.isSuccess,
  });

  factory RegistrationResponseModel.fromJson(Map<String, dynamic> json) => RegistrationResponseModel(
    data: Data.fromJson(json["data"]),
    code: json["code"],
    message: json["message"],
    isSuccess: json["isSuccess"],
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
  };
}

class User {
  dynamic memberId;
  dynamic fullName;
  dynamic phoneNumber;
  dynamic email;
  dynamic country;
  dynamic city;

  User({
    required this.memberId,
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.country,
    required this.city,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    memberId: json["memberId"],
    fullName: json["fullName"],
    phoneNumber: json["phoneNumber"],
    email: json["email"],
    country: json["country"],
    city: json["city"],
  );

  Map<String, dynamic> toJson() => {
    "memberId": memberId,
    "fullName": fullName,
    "phoneNumber": phoneNumber,
    "email": email,
    "country": country,
    "city": city,
  };
}
