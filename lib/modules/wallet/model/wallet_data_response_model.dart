// To parse this JSON data, do
//
//     final walletDataResponseModel = walletDataResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

WalletDataResponseModel walletDataResponseModelFromJson(String str) =>
    WalletDataResponseModel.fromJson(json.decode(str));

String walletDataResponseModelToJson(WalletDataResponseModel data) =>
    json.encode(data.toJson());

class WalletDataResponseModel {
  Data data;
  int code;
  String message;
  bool isSuccess;

  WalletDataResponseModel({
    required this.data,
    required this.code,
    required this.message,
    required this.isSuccess,
  });

  factory WalletDataResponseModel.fromJson(Map<String, dynamic> json) =>
      WalletDataResponseModel(
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
  Wallet wallet;

  Data({
    required this.wallet,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        wallet: Wallet.fromJson(json["wallet"]),
      );

  Map<String, dynamic> toJson() => {
        "wallet": wallet.toJson(),
      };
}

class Wallet {
  int walletId;
  String walletIdGuid;
  int memberId;
  dynamic availableBalace;
  dynamic actualBalance;
  dynamic status;
  dynamic updatedBy;
  DateTime upadtedDate;
  dynamic currency;

  Wallet({
    required this.walletId,
    required this.walletIdGuid,
    required this.memberId,
    required this.availableBalace,
    required this.actualBalance,
    required this.status,
    required this.updatedBy,
    required this.upadtedDate,
    required this.currency,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        walletId: json["walletId"],
        walletIdGuid: json["walletIdGuid"],
        memberId: json["memberId"],
        availableBalace: json["availableBalace"],
        actualBalance: json["actualBalance"],
        status: json["status"],
        updatedBy: json["updatedBy"],
        upadtedDate: DateTime.parse(json["upadtedDate"]),
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "walletId": walletId,
        "walletIdGuid": walletIdGuid,
        "memberId": memberId,
        "availableBalace": availableBalace,
        "actualBalance": actualBalance,
        "status": status,
        "updatedBy": updatedBy,
        "upadtedDate": upadtedDate.toIso8601String(),
        "currency": currency,
      };
}
