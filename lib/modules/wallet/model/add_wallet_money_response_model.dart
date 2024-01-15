// To parse this JSON data, do
//
//     final addWalletMoneyResponseModel = addWalletMoneyResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AddWalletMoneyResponseModel addWalletMoneyResponseModelFromJson(String str) => AddWalletMoneyResponseModel.fromJson(json.decode(str));

String addWalletMoneyResponseModelToJson(AddWalletMoneyResponseModel data) => json.encode(data.toJson());

class AddWalletMoneyResponseModel {
  Data data;
  int code;
  String message;
  bool isSuccess;

  AddWalletMoneyResponseModel({
    required this.data,
    required this.code,
    required this.message,
    required this.isSuccess,
  });

  factory AddWalletMoneyResponseModel.fromJson(Map<String, dynamic> json) => AddWalletMoneyResponseModel(
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
  bool wallet;

  Data({
    required this.wallet,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    wallet: json["wallet"],
  );

  Map<String, dynamic> toJson() => {
    "wallet": wallet,
  };
}
