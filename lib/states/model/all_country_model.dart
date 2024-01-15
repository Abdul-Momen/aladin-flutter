// To parse this JSON data, do
//
//     final settingModel = settingModelFromJson(jsonString);

import 'dart:convert';

AllCountryModel settingModelFromJson(String str) =>
    AllCountryModel.fromJson(json.decode(str));

String settingModelToJson(AllCountryModel data) => json.encode(data.toJson());

class AllCountryModel {
  Data? data;
  int? code;
  String? message;
  bool? isSuccess;

  AllCountryModel({
     this.data,
     this.code,
     this.message,
     this.isSuccess,
  });

  factory AllCountryModel.fromJson(Map<String, dynamic> json) =>
      AllCountryModel(
        data: Data.fromJson(json["data"] ?? {}),
        code: json["code"]??0,
        message: json["message"]??'',
        isSuccess: json["isSuccess"]??false,
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "code": code,
        "message": message,
        "isSuccess": isSuccess,
      };
}

class Data {
  List<Country> countries;

  Data({
    required this.countries,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        countries: List<Country>.from(
            json["countries"].map((x) => Country.fromJson(x)) ?? []),
      );

  Map<String, dynamic> toJson() => {
        "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
      };
}

class Country {
  int? countryId;
  String? countryName;
  String? countryCode;
  String? flagImage;
  String? status;

  Country({
     this.countryId,
     this.countryName,
     this.countryCode,
     this.flagImage,
     this.status,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        countryId: json["countryId"] ?? 0,
        countryName: json["countryName"] ?? '',
        countryCode: json["countryCode"] ?? '',
        flagImage: json["flagImage"] ?? '',
        status: json["status"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "countryId": countryId,
        "countryName": countryName,
        "countryCode": countryCode,
        "flagImage": flagImage,
        "status": status,
      };
}
