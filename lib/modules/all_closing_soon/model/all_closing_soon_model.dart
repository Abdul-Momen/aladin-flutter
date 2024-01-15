// To parse this JSON data, do
//
//     final allClosingModel = allClosingModelFromJson(jsonString);

import 'dart:convert';

AllClosingModel allClosingModelFromJson(String str) => AllClosingModel.fromJson(json.decode(str));

String allClosingModelToJson(AllClosingModel data) => json.encode(data.toJson());

class AllClosingModel {
  Data data;
  int code;
  String message;
  bool isSuccess;

  AllClosingModel({
    required this.data,
    required this.code,
    required this.message,
    required this.isSuccess,
  });

  factory AllClosingModel.fromJson(Map<String, dynamic> json) => AllClosingModel(
    data: Data.fromJson(json["data"]??{}),
    code: json["code"]??"",
    message: json["message"]??"",
    isSuccess: json["isSuccess"]??"",
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "code": code,
    "message": message,
    "isSuccess": isSuccess,
  };
}

class Data {
  List<Campaign> campaigns;

  Data({
    required this.campaigns,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    campaigns: List<Campaign>.from(json["campaigns"].map((x) => Campaign.fromJson(x))??[]),
  );

  Map<String, dynamic> toJson() => {
    "campaigns": List<dynamic>.from(campaigns.map((x) => x.toJson())),
  };
}

class Campaign {
  int productCategoryId;
  int productId;
  String productCode;
  String productName;
  String description;
  String productImage;
  int price;
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
  int rating;
  bool isWish;
  bool isPopular;
  List<PrizeFor> prizeForUae;
  List<PrizeFor> prizeForIndia;

  Campaign({
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
    required this.rating,
    required this.isWish,
    required this.isPopular,
    required this.prizeForUae,
    required this.prizeForIndia,
  });

  factory Campaign.fromJson(Map<String, dynamic> json) => Campaign(
    productCategoryId: json["productCategoryId"]??0,
    productId: json["productId"],
    productCode: json["productCode"],
    productName: json["productName"],
    description: json["description"],
    productImage: json["productImage"],
    price: json["price"],
    currency: json["currency"],
    prizeId: json["prizeId"],
    prizeCode: json["prizeCode"],
    prizeName: json["prizeName"],
    prizeImage: json["prizeImage"],
    prizeDescription: json["prizeDescription"]??'',
    prizePrice: json["prizePrice"],
    productLimit: json["productLimit"],
    winnerId: json["winnerId"],
    status: json["status"],
    isSold: json["isSold"],
    aladinPlace: json["aladinPlace"],
    declareDate: DateTime.parse(json["declareDate"]),
    announcedDate: DateTime.parse(json["announcedDate"]),
    announcedTime: DateTime.parse(json["announcedTime"]),
    campaignTitle: json["campaignTitle"],
    campaignSubTitle: json["campaignSubTitle"],
    campaignDescription: json["campaignDescription"],
    campaignImage: json["campaignImage"],
    icon: json["icon"],
    joinImage: json["joinImage"],
    remarks: json["remarks"],
    ticketOfferId: json["ticketOfferId"],
    soldQty: json["soldQty"],
    rating: json["rating"],
    isWish: json["isWish"],
    isPopular: json["isPopular"],
    prizeForUae: List<PrizeFor>.from(json["prizeForUae"].map((x) => PrizeFor.fromJson(x))),
    prizeForIndia: List<PrizeFor>.from(json["prizeForIndia"].map((x) => PrizeFor.fromJson(x))),
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
    "rating": rating,
    "isWish": isWish,
    "isPopular": isPopular,
    "prizeForUae": List<dynamic>.from(prizeForUae.map((x) => x.toJson())),
    "prizeForIndia": List<dynamic>.from(prizeForIndia.map((x) => x.toJson())),
  };
}

class PrizeFor {
  int productPrizeId;
  String prizeCode;
  String prizeName;
  String prizeImage;
  String prizeDescription;
  dynamic prizePrice;
  int countryId;
  int productId;
  bool isMainPrize;
  int prizeWinnerCount;
  DateTime lastUpdate;

  PrizeFor({
    required this.productPrizeId,
    required this.prizeCode,
    required this.prizeName,
    required this.prizeImage,
    required this.prizeDescription,
    required this.prizePrice,
    required this.countryId,
    required this.productId,
    required this.isMainPrize,
    required this.prizeWinnerCount,
    required this.lastUpdate,
  });

  factory PrizeFor.fromJson(Map<String, dynamic> json) => PrizeFor(
    productPrizeId: json["productPrizeId"],
    prizeCode: json["prizeCode"],
    prizeName: json["prizeName"],
    prizeImage: json["prizeImage"],
    prizeDescription: json["prizeDescription"],
    prizePrice: json["prizePrice"],
    countryId: json["countryId"],
    productId: json["productId"],
    isMainPrize: json["isMainPrize"],
    prizeWinnerCount: json["prizeWinnerCount"],
    lastUpdate: DateTime.parse(json["lastUpdate"]),
  );

  Map<String, dynamic> toJson() => {
    "productPrizeId": productPrizeId,
    "prizeCode": prizeCode,
    "prizeName": prizeName,
    "prizeImage": prizeImage,
    "prizeDescription": prizeDescription,
    "prizePrice": prizePrice,
    "countryId": countryId,
    "productId": productId,
    "isMainPrize": isMainPrize,
    "prizeWinnerCount": prizeWinnerCount,
    "lastUpdate": lastUpdate.toIso8601String(),
  };
}
