// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

import 'dart:convert';

CountryModel countryModelFromJson(String str) => CountryModel.fromJson(json.decode(str));

String countryModelToJson(CountryModel data) => json.encode(data.toJson());

class CountryModel {
  Data data;
  int code;
  String message;
  bool isSuccess;

  CountryModel({
    required this.data,
    required this.code,
    required this.message,
    required this.isSuccess,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
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
  List<City> cities;

  Data({
    required this.cities,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    cities: List<City>.from(json["cities"].map((x) => City.fromJson(x))??[]),
  );

  Map<String, dynamic> toJson() => {
    "cities": List<dynamic>.from(cities.map((x) => x.toJson())),
  };
}

class City {
  int cityId;
  String cityName;
  String status;
  Counrty counrty;

  City({
    required this.cityId,
    required this.cityName,
    required this.status,
    required this.counrty,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    cityId: json["cityId"]??0,
    cityName: json["cityName"]??'',
    status: json["status"]??'',
    counrty: Counrty.fromJson(json["counrty"]??{}),
  );

  Map<String, dynamic> toJson() => {
    "cityId": cityId,
    "cityName": cityName,
    "status": status,
    "counrty": counrty.toJson(),
  };
}

class Counrty {
  int countryId;
  String countryName;
  String countryCode;
  String flagImage;
  String status;

  Counrty({
    required this.countryId,
    required this.countryName,
    required this.countryCode,
    required this.flagImage,
    required this.status,
  });

  factory Counrty.fromJson(Map<String, dynamic> json) => Counrty(
    countryId: json["countryId"]??0,
    countryName: json["countryName"]??'',
    countryCode: json["countryCode"]??'',
    flagImage: json["flagImage"]??'',
    status: json["status"]??'',
  );

  Map<String, dynamic> toJson() => {
    "countryId": countryId,
    "countryName": countryName,
    "countryCode": countryCode,
    "flagImage": flagImage,
    "status": status,
  };
}
