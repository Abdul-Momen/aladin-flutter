// To parse this JSON data, do
//
//     final listByMemberCartModel = listByMemberCartModelFromJson(jsonString);

import 'dart:convert';

ListByMemberCartModel listByMemberCartModelFromJson(String str) => ListByMemberCartModel.fromJson(json.decode(str));

String listByMemberCartModelToJson(ListByMemberCartModel data) => json.encode(data.toJson());

class ListByMemberCartModel {
  Data data;
  int code;
  String message;
  bool isSuccess;

  ListByMemberCartModel({
    required this.data,
    required this.code,
    required this.message,
    required this.isSuccess,
  });

  factory ListByMemberCartModel.fromJson(Map<String, dynamic> json) => ListByMemberCartModel(
    data: Data.fromJson(json["data"]?? []),
    code: json["code"]?? 0,
    message: json["message"]?? '',
    isSuccess: json["isSuccess"]?? false,
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "code": code,
    "message": message,
    "isSuccess": isSuccess,
  };
}

class Data {
  List<CartProduct> cartProducts;

  Data({
    required this.cartProducts,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    cartProducts: List<CartProduct>.from(json["cartProducts"].map((x) => CartProduct.fromJson(x))??[]),
  );

  Map<String, dynamic> toJson() => {
    "cartProducts": List<dynamic>.from(cartProducts.map((x) => x.toJson())),
  };
}

class CartProduct {
  int id;
  int memberId;
  String cookieId;
  double qty;
  String status;
  Product product;

  CartProduct({
    required this.id,
    required this.memberId,
    required this.cookieId,
    required this.qty,
    required this.status,
    required this.product,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
    id: json["id"]??0,
    memberId: json["memberId"]??0,
    cookieId: json["cookieId"]??'',
    qty: json["qty"]??0,
    status: json["status"]??'',
    product: Product.fromJson(json["product"]??{}),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "memberId": memberId,
    "cookieId": cookieId,
    "qty": qty,
    "status": status,
    "product": product.toJson(),
  };
}

class Product {
  int productCategoryId;
  int productId;
  String productCode;
  String productName;
  String description;
  String productImage;
  double price;
  String currency;
  int prizeId;
  String prizeCode;
  String prizeName;
  String prizeImage;
  dynamic prizeDescription;
  dynamic prizePrice;
  int productLimit;
  int winnerId;
  String status;
  String isSold;
  String aladinPlace;
  DateTime declareDate;
  DateTime announcedDate;
  DateTime announcedTime;
  String campaignTitle;
  String campaignSubTitle;
  String campaignDescription;
  String campaignImage;
  String icon;
  String joinImage;
  String remarks;
  int ticketOfferId;
  int soldQty;
  int ticketQty;

  double rating;
  bool isWish;
  bool isPopular;

  Product({
    required this.productCategoryId,
    required this.productId,
    required this.productCode,
    required this.productName,
    required this.description,
    required this.productImage,
    required this.price,
    required this.currency,
    required this.prizeId,
    required this.prizeCode,
    required this.prizeName,
    required this.prizeImage,
    required this.prizeDescription,
    required this.prizePrice,
    required this.productLimit,
    required this.winnerId,
    required this.status,
    required this.isSold,
    required this.aladinPlace,
    required this.declareDate,
    required this.announcedDate,
    required this.announcedTime,
    required this.campaignTitle,
    required this.campaignSubTitle,
    required this.campaignDescription,
    required this.campaignImage,
    required this.icon,
    required this.joinImage,
    required this.remarks,
    required this.ticketOfferId,
    required this.soldQty,
    required this.ticketQty,

    required this.rating,
    required this.isWish,
    required this.isPopular,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productCategoryId: json["productCategoryId"]??0 ,
    productId: json["productId"]??0,
    productCode: json["productCode"]??'',
    productName: json["productName"]??'',
    description: json["description"]??'',
    productImage: json["productImage"]??'',
    price: json["price"]??0,
    currency: json["currency"]??'',
    prizeId: json["prizeId"]??0,
    prizeCode: json["prizeCode"]??'',
    prizeName: json["prizeName"]??'',
    prizeImage: json["prizeImage"]??'',
    prizeDescription: json["prizeDescription"]??'',
    prizePrice: json["prizePrice"],
    productLimit: json["productLimit"]??0,
    winnerId: json["winnerId"]??0,
    status: json["status"]??'',
    isSold: json["isSold"]??'',
    aladinPlace: json["aladinPlace"]??'',
    declareDate: DateTime.parse(json["declareDate"]??''),
    announcedDate: DateTime.parse(json["announcedDate"]??''),
    announcedTime: DateTime.parse(json["announcedTime"]??''),
    campaignTitle: json["campaignTitle"]??'',
    campaignSubTitle: json["campaignSubTitle"]??'',
    campaignDescription: json["campaignDescription"]??'',
    campaignImage: json["campaignImage"]??'',
    icon: json["icon"]??'',
    joinImage: json["joinImage"]??'',
    remarks: json["remarks"]??'',
    ticketOfferId: json["ticketOfferId"]??0,
    soldQty: json["soldQty"]??0,
    ticketQty: json["ticketQty"]??0,

    rating: json["rating"]??0,
    isWish: json["isWish"]??false,
    isPopular: json["isPopular"]??false,
  );

  Map<String, dynamic> toJson() => {
    "productCategoryId": productCategoryId,
    "productId": productId,
    "productCode": productCode,
    "productName": productName,
    "description": description,
    "productImage": productImage,
    "price": price,
    "currency": currency,
    "prizeId": prizeId,
    "prizeCode": prizeCode,
    "prizeName": prizeName,
    "prizeImage": prizeImage,
    "prizeDescription": prizeDescription,
    "prizePrice": prizePrice,
    "productLimit": productLimit,
    "winnerId": winnerId,
    "status": status,
    "isSold": isSold,
    "aladinPlace": aladinPlace,
    "declareDate": declareDate.toIso8601String(),
    "announcedDate": announcedDate.toIso8601String(),
    "announcedTime": announcedTime.toIso8601String(),
    "campaignTitle": campaignTitle,
    "campaignSubTitle": campaignSubTitle,
    "campaignDescription": campaignDescription,
    "campaignImage": campaignImage,
    "icon": icon,
    "joinImage": joinImage,
    "remarks": remarks,
    "ticketOfferId": ticketOfferId,
    "soldQty": soldQty,
    "ticketQty": ticketQty,

    "rating": rating,
    "isWish": isWish,
    "isPopular": isPopular,
  };
}
