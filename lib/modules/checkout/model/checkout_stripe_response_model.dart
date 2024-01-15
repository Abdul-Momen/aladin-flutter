// To parse this JSON data, do
//
//     final checkoutStripeResponseModel = checkoutStripeResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CheckoutStripeResponseModel checkoutStripeResponseModelFromJson(String str) => CheckoutStripeResponseModel.fromJson(json.decode(str));

String checkoutStripeResponseModelToJson(CheckoutStripeResponseModel data) => json.encode(data.toJson());

class CheckoutStripeResponseModel {
  Data data;
  int code;
  String message;
  bool isSuccess;

  CheckoutStripeResponseModel({
    required this.data,
    required this.code,
    required this.message,
    required this.isSuccess,
  });

  factory CheckoutStripeResponseModel.fromJson(Map<String, dynamic> json) => CheckoutStripeResponseModel(
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
  OrderRequest orderRequest;

  Data({
    required this.orderRequest,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    orderRequest: OrderRequest.fromJson(json["orderRequest"]),
  );

  Map<String, dynamic> toJson() => {
    "orderRequest": orderRequest.toJson(),
  };
}

class OrderRequest {
  dynamic orderRequest;
  String key;
  String clientSecret;
  String paymentId;
  String ephemeralKey;
  String customerKey;

  OrderRequest({
    required this.orderRequest,
    required this.key,
    required this.clientSecret,
    required this.paymentId,
    required this.ephemeralKey,
    required this.customerKey,
  });

  factory OrderRequest.fromJson(Map<String, dynamic> json) => OrderRequest(
    orderRequest: json["orderRequest"],
    key: json["key"],
    clientSecret: json["client_secret"],
    paymentId: json["paymentId"],
    ephemeralKey: json["ephemeralKey"],
    customerKey: json["customerKey"],
  );

  Map<String, dynamic> toJson() => {
    "orderRequest": orderRequest,
    "key": key,
    "client_secret": clientSecret,
    "paymentId": paymentId,
    "ephemeralKey": ephemeralKey,
    "customerKey": customerKey,
  };
}
