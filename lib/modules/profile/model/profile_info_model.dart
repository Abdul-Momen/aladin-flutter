// To parse this JSON data, do
//
//     final profileInfoModel = profileInfoModelFromJson(jsonString);

import 'dart:convert';

ProfileInfoModel profileInfoModelFromJson(String str) => ProfileInfoModel.fromJson(json.decode(str));

String profileInfoModelToJson(ProfileInfoModel data) => json.encode(data.toJson());

class ProfileInfoModel {
  Data data;
  int code;
  String message;
  bool isSuccess;

  ProfileInfoModel({
    required this.data,
    required this.code,
    required this.message,
    required this.isSuccess,
  });

  factory ProfileInfoModel.fromJson(Map<String, dynamic> json) => ProfileInfoModel(
    data: Data.fromJson(json["data"]?? ''),
    code: json["code"]?? 0,
    message: json["message"]?? '',
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
    user: User.fromJson(json["user"]?? {}),
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
  };
}

class User {
  int memberId;
  String fullName;
  String gender;
  String email;
  String phoneNumber;
  Coun country;
  City city;
  String postCode;
  String streetAddressOne;
  String streetAddressTwo;
  String image;

  User({
    required this.memberId,
    required this.fullName,
    required this.gender,
    required this.email,
    required this.phoneNumber,
    required this.country,
    required this.city,
    required this.postCode,
    required this.streetAddressOne,
    required this.streetAddressTwo,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    memberId: json["memberId"]?? 0,
    fullName: json["fullName"]?? '',
    gender: json["gender"]?? '',
    email: json["email"]?? '',
    phoneNumber: json["phoneNumber"]?? '',
    country: Coun.fromJson(json["country"]?? {}),
    city: City.fromJson(json["city"]??{}),
    postCode: json["postCode"]?? '',
    streetAddressOne: json["streetAddressOne"]?? '',
    streetAddressTwo: json["streetAddressTwo"]?? '',
    image: json["image"]?? '',
  );

  Map<String, dynamic> toJson() => {
    "memberId": memberId,
    "fullName": fullName,
    "gender": gender,
    "email": email,
    "phoneNumber": phoneNumber,
    "country": country.toJson(),
    "city": city.toJson(),
    "postCode": postCode,
    "streetAddressOne": streetAddressOne,
    "streetAddressTwo": streetAddressTwo,
    "image": image,
  };
}

class City {
  int cityId;
  String cityName;
  String status;
  Coun counrty;

  City({
    required this.cityId,
    required this.cityName,
    required this.status,
    required this.counrty,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    cityId: json["cityId"]?? 0,
    cityName: json["cityName"]?? '',
    status: json["status"]?? '',
    counrty: Coun.fromJson(json["counrty"]??{}),
  );

  Map<String, dynamic> toJson() => {
    "cityId": cityId,
    "cityName": cityName,
    "status": status,
    "counrty": counrty.toJson(),
  };
}

class Coun {
  int countryId;
  String countryName;
  String countryCode;
  String flagImage;
  String status;

  Coun({
    required this.countryId,
    required this.countryName,
    required this.countryCode,
    required this.flagImage,
    required this.status,
  });

  factory Coun.fromJson(Map<String, dynamic> json) => Coun(
    countryId: json["countryId"]?? 0,
    countryName: json["countryName"]?? '',
    countryCode: json["countryCode"]?? '',
    flagImage: json["flagImage"]?? '',
    status: json["status"]?? '',
  );

  Map<String, dynamic> toJson() => {
    "countryId": countryId,
    "countryName": countryName,
    "countryCode": countryCode,
    "flagImage": flagImage,
    "status": status,
  };
}
