// To parse this JSON data, do
//
//     final removeCartModel = removeCartModelFromJson(jsonString);

import 'dart:convert';

RemoveCartModel removeCartModelFromJson(String str) => RemoveCartModel.fromJson(json.decode(str));

String removeCartModelToJson(RemoveCartModel data) => json.encode(data.toJson());

class RemoveCartModel {
  Data data;
  int code;
  String message;
  bool isSuccess;

  RemoveCartModel({
    required this.data,
    required this.code,
    required this.message,
    required this.isSuccess,
  });

  factory RemoveCartModel.fromJson(Map<String, dynamic> json) => RemoveCartModel(
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
  CartProduct cartProduct;

  Data({
    required this.cartProduct,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    cartProduct: CartProduct.fromJson(json["cartProduct"]??{}),
  );

  Map<String, dynamic> toJson() => {
    "cartProduct": cartProduct.toJson(),
  };
}

class CartProduct {
  CartProduct();

  factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
  );

  Map<String, dynamic> toJson() => {
  };
}
