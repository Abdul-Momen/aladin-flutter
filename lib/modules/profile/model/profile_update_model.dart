// To parse this JSON data, do
//
//     final profileUpdateModel = profileUpdateModelFromJson(jsonString);

import 'dart:convert';

ProfileUpdateModel profileUpdateModelFromJson(String str) => ProfileUpdateModel.fromJson(json.decode(str));

String profileUpdateModelToJson(ProfileUpdateModel data) => json.encode(data.toJson());

class ProfileUpdateModel {
  Data data;
  int code;
  String message;
  bool isSuccess;

  ProfileUpdateModel({
    required this.data,
    required this.code,
    required this.message,
    required this.isSuccess,
  });

  factory ProfileUpdateModel.fromJson(Map<String, dynamic> json) => ProfileUpdateModel(
    data: Data.fromJson(json["data"]??{}),
    code: json["code"]??0,
    message: json["message"]??'',
    isSuccess: json["isSuccess"]??false,
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
    user: User.fromJson(json["user"]??{}),
  );

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
    memberId: json["memberId"]?? 0,
    fullName: json["fullName"]?? '',
    phoneNumber: json["phoneNumber"]?? '',
    email: json["email"]?? '',
  );

  Map<String, dynamic> toJson() => {
    "memberId": memberId,
    "fullName": fullName,
    "phoneNumber": phoneNumber,
    "email": email,
  };
}
