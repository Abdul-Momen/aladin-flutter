// To parse this JSON data, do
//
//     final checkoutModel = checkoutModelFromJson(jsonString);

import 'dart:convert';

CheckoutModel checkoutModelFromJson(String str) => CheckoutModel.fromJson(json.decode(str));

String checkoutModelToJson(CheckoutModel data) => json.encode(data.toJson());

class CheckoutModel {
  Data data;
  int code;
  String message;
  bool isSuccess;

  CheckoutModel({
    required this.data,
    required this.code,
    required this.message,
    required this.isSuccess,
  });

  factory CheckoutModel.fromJson(Map<String, dynamic> json) => CheckoutModel(
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
  Invoice invoice;

  Data({
    required this.invoice,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    invoice: Invoice.fromJson(json["invoice"]),
  );

  Map<String, dynamic> toJson() => {
    "invoice": invoice.toJson(),
  };
}

class Invoice {
  int invoiceMasterid;
  String refNo;
  DateTime date;
  String currency;
  double amount;
  String ticketNo;
  String email;

  Invoice({
    required this.invoiceMasterid,
    required this.refNo,
    required this.date,
    required this.currency,
    required this.amount,
    required this.ticketNo,
    required this.email,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
    invoiceMasterid: json["invoiceMasterid"],
    refNo: json["refNo"]??'',
    date: DateTime.parse(json["date"]),
    currency: json["currency"]??"",
    amount: json["amount"]??0.0,
    ticketNo: json["ticketNo"]??'',
    email: json["email"]??'',
  );

  Map<String, dynamic> toJson() => {
    "invoiceMasterid": invoiceMasterid,
    "refNo": refNo,
    "date": date.toIso8601String(),
    "currency": currency,
    "amount": amount,
    "ticketNo": ticketNo,
    "email": email,
  };
}
