// To parse this JSON data, do
//
//     final cartCountModel = cartCountModelFromJson(jsonString);

import 'dart:convert';

CartCountModel cartCountModelFromJson(String str) => CartCountModel.fromJson(json.decode(str));

String cartCountModelToJson(CartCountModel data) => json.encode(data.toJson());

class CartCountModel {
  Data data;
  int code;
  String message;
  bool isSuccess;

  CartCountModel({
    required this.data,
    required this.code,
    required this.message,
    required this.isSuccess,
  });

  factory CartCountModel.fromJson(Map<String, dynamic> json) => CartCountModel(
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
  CartProducts cartProducts;

  Data({
    required this.cartProducts,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    cartProducts: CartProducts.fromJson(json["cartProducts"]),
  );

  Map<String, dynamic> toJson() => {
    "cartProducts": cartProducts.toJson(),
  };
}

class CartProducts {
  int totalProducts;

  CartProducts({
    required this.totalProducts,
  });

  factory CartProducts.fromJson(Map<String, dynamic> json) => CartProducts(
    totalProducts: json["totalProducts"],
  );

  Map<String, dynamic> toJson() => {
    "totalProducts": totalProducts,
  };
}
