// To parse this JSON data, do
//
//     final addWishListModel = addWishListModelFromJson(jsonString);

import 'dart:convert';

AddWishListModel addWishListModelFromJson(String str) => AddWishListModel.fromJson(json.decode(str));

String addWishListModelToJson(AddWishListModel data) => json.encode(data.toJson());

class AddWishListModel {
  Data data;
  int code;
  String message;
  bool isSuccess;

  AddWishListModel({
    required this.data,
    required this.code,
    required this.message,
    required this.isSuccess,
  });

  factory AddWishListModel.fromJson(Map<String, dynamic> json) => AddWishListModel(
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
  String message;

  Data({
    required this.message,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    message: json["message"]??{},
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
