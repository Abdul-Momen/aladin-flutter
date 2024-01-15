// To parse this JSON data, do
//
//     final removeAddressModel = removeAddressModelFromJson(jsonString);

import 'dart:convert';

RemoveAddressModel removeAddressModelFromJson(String str) => RemoveAddressModel.fromJson(json.decode(str));

String removeAddressModelToJson(RemoveAddressModel data) => json.encode(data.toJson());

class RemoveAddressModel {
  Data data;
  int code;
  String message;
  bool isSuccess;

  RemoveAddressModel({
    required this.data,
    required this.code,
    required this.message,
    required this.isSuccess,
  });

  factory RemoveAddressModel.fromJson(Map<String, dynamic> json) => RemoveAddressModel(
    data: Data.fromJson(json["data"]??{}),
    code: json["code"]??0,
    message: json["message"]??"",
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
  Address address;

  Data({
    required this.address,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    address: Address.fromJson(json["address"]??{}),
  );

  Map<String, dynamic> toJson() => {
    "address": address.toJson(),
  };
}

class Address {
  Address();

  factory Address.fromJson(Map<String, dynamic> json) => Address(
  );

  Map<String, dynamic> toJson() => {
  };
}
