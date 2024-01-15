// To parse this JSON data, do
//
//     final onboardModel = onboardModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

OnboardModel onboardModelFromJson(String str) => OnboardModel.fromJson(json.decode(str));

String onboardModelToJson(OnboardModel data) => json.encode(data.toJson());

class OnboardModel {
  Data data;
  int code;
  String message;
  bool isSuccess;

  OnboardModel({
    required this.data,
    required this.code,
    required this.message,
    required this.isSuccess,
  });

  factory OnboardModel.fromJson(Map<String, dynamic> json) => OnboardModel(
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
  List<WebHtml> webHtmls;

  Data({
    required this.webHtmls,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    webHtmls: List<WebHtml>.from(json["webHtmls"].map((x) => WebHtml.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "webHtmls": List<dynamic>.from(webHtmls.map((x) => x.toJson())),
  };
}

class WebHtml {
  int webHtmlId;
  String identifier;
  String title;
  String subTitle;
  String smallDetailsOne;
  String smallDetailsTwo;
  String bigDetailsOne;
  String bigDetailsTwo;
  String pictureOne;
  String pictureTwo;
  String pictureThree;
  String redirectPath;

  WebHtml({
    required this.webHtmlId,
    required this.identifier,
    required this.title,
    required this.subTitle,
    required this.smallDetailsOne,
    required this.smallDetailsTwo,
    required this.bigDetailsOne,
    required this.bigDetailsTwo,
    required this.pictureOne,
    required this.pictureTwo,
    required this.pictureThree,
    required this.redirectPath,
  });

  factory WebHtml.fromJson(Map<String, dynamic> json) => WebHtml(
    webHtmlId: json["webHtmlId"],
    identifier: json["identifier"],
    title: json["title"],
    subTitle: json["subTitle"],
    smallDetailsOne: json["smallDetailsOne"],
    smallDetailsTwo: json["smallDetailsTwo"],
    bigDetailsOne: json["bigDetailsOne"],
    bigDetailsTwo: json["bigDetailsTwo"],
    pictureOne: json["pictureOne"],
    pictureTwo: json["pictureTwo"],
    pictureThree: json["pictureThree"],
    redirectPath: json["redirectPath"],
  );

  Map<String, dynamic> toJson() => {
    "webHtmlId": webHtmlId,
    "identifier": identifier,
    "title": title,
    "subTitle": subTitle,
    "smallDetailsOne": smallDetailsOne,
    "smallDetailsTwo": smallDetailsTwo,
    "bigDetailsOne": bigDetailsOne,
    "bigDetailsTwo": bigDetailsTwo,
    "pictureOne": pictureOne,
    "pictureTwo": pictureTwo,
    "pictureThree": pictureThree,
    "redirectPath": redirectPath,
  };
}
