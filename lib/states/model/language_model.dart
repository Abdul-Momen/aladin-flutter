// To parse this JSON data, do
//
//     final languageModel = languageModelFromJson(jsonString);

import 'dart:convert';

LanguageModel languageModelFromJson(String str) => LanguageModel.fromJson(json.decode(str));

String languageModelToJson(LanguageModel data) => json.encode(data.toJson());

class LanguageModel {
  Data data;
  int code;
  String message;
  bool isSuccess;

  LanguageModel({
    required this.data,
    required this.code,
    required this.message,
    required this.isSuccess,
  });

  factory LanguageModel.fromJson(Map<String, dynamic> json) => LanguageModel(
    data: Data.fromJson(json["data"]?? {}),
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
  List<Language> languages;

  Data({
    required this.languages,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    languages: List<Language>.from(json["languages"].map((x) => Language.fromJson(x))??[]),
  );

  Map<String, dynamic> toJson() => {
    "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
  };
}

class Language {
  int languageId;
  String languageCode;
  String languageName;
  String status;

  Language({
    required this.languageId,
    required this.languageCode,
    required this.languageName,
    required this.status,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
    languageId: json["languageId"]?? 0,
    languageCode: json["languageCode"]?? '',
    languageName: json["languageName"]?? '',
    status: json["status"]?? '',
  );

  Map<String, dynamic> toJson() => {
    "languageId": languageId,
    "languageCode": languageCode,
    "languageName": languageName,
    "status": status,
  };
}
