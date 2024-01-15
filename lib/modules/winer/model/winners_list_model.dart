// To parse this JSON data, do
//
//     final winnersListModel = winnersListModelFromJson(jsonString);

import 'dart:convert';

WinnersListModel winnersListModelFromJson(String str) => WinnersListModel.fromJson(json.decode(str));

String winnersListModelToJson(WinnersListModel data) => json.encode(data.toJson());

class WinnersListModel {
  Data data;
  int code;
  String message;
  bool isSuccess;

  WinnersListModel({
    required this.data,
    required this.code,
    required this.message,
    required this.isSuccess,
  });

  factory WinnersListModel.fromJson(Map<String, dynamic> json) => WinnersListModel(
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
  List<Winner> winners;

  Data({
    required this.winners,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    winners: List<Winner>.from(json["winners"].map((x) => Winner.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "winners": List<dynamic>.from(winners.map((x) => x.toJson())),
  };
}

class Winner {
  int productId;
  String productName;
  String productImage;
  dynamic price;
  String currency;
  String prizeName;
  String prizeImage;
  dynamic prizePrice;
  String aladinPlace;
  DateTime declareDate;
  DateTime announcedDate;
  DateTime announcedTime;
  AladinTicket aladinTicket;

  Winner({
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.price,
    required this.currency,
    required this.prizeName,
    required this.prizeImage,
    required this.prizePrice,
    required this.aladinPlace,
    required this.declareDate,
    required this.announcedDate,
    required this.announcedTime,
    required this.aladinTicket,
  });

  factory Winner.fromJson(Map<String, dynamic> json) => Winner(
    productId: json["productId"],
    productName: json["productName"],
    productImage: json["productImage"],
    price: json["price"],
    currency: json["currency"],
    prizeName: json["prizeName"],
    prizeImage: json["prizeImage"],
    prizePrice: json["prizePrice"],
    aladinPlace: json["aladinPlace"],
    declareDate: DateTime.parse(json["declareDate"]),
    announcedDate: DateTime.parse(json["announcedDate"]),
    announcedTime: DateTime.parse(json["announcedTime"]),
    aladinTicket: AladinTicket.fromJson(json["aladinTicket"]),
  );

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "productName": productName,
    "productImage": productImage,
    "price": price,
    "currency": currency,
    "prizeName": prizeName,
    "prizeImage": prizeImage,
    "prizePrice": prizePrice,
    "aladinPlace": aladinPlace,
    "declareDate": declareDate.toIso8601String(),
    "announcedDate": announcedDate.toIso8601String(),
    "announcedTime": announcedTime.toIso8601String(),
    "aladinTicket": aladinTicket.toJson(),
  };
}
class AladinTicket {
  int aladinTicketId;
  String aladinTicketSerial;
  TicketTypes ticketTypes;
  Member member;
  int aladinInvoiceDetailsId;
  bool isDonate;
  Status status;

  AladinTicket({
    required this.aladinTicketId,
    required this.aladinTicketSerial,
    required this.ticketTypes,
    required this.member,
    required this.aladinInvoiceDetailsId,
    required this.isDonate,
    required this.status,
  });

  factory AladinTicket.fromJson(Map<String, dynamic> json) => AladinTicket(
    aladinTicketId: json["aladinTicketId"],
    aladinTicketSerial: json["aladinTicketSerial"],
    ticketTypes: TicketTypes.fromJson(json["ticketTypes"]),
    member: Member.fromJson(json["member"]),
    aladinInvoiceDetailsId: json["aladinInvoiceDetailsId"],
    isDonate: json["isDonate"],
    status: statusValues.map[json["status"]]!,
  );

  Map<String, dynamic> toJson() => {
    "aladinTicketId": aladinTicketId,
    "aladinTicketSerial": aladinTicketSerial,
    "ticketTypes": ticketTypes.toJson(),
    "member": member.toJson(),
    "aladinInvoiceDetailsId": aladinInvoiceDetailsId,
    "isDonate": isDonate,
    "status": statusValues.reverse[status],
  };
}

class Member {
  int memberId;
  String fullName;
  String gender;
  String email;
  String phoneNumber;
  Coun country;
  City city;
  String postCode;
  String streetAddressOne;
  String streetAddressTwo;
  String image;

  Member({
    required this.memberId,
    required this.fullName,
    required this.gender,
    required this.email,
    required this.phoneNumber,
    required this.country,
    required this.city,
    required this.postCode,
    required this.streetAddressOne,
    required this.streetAddressTwo,
    required this.image,
  });

  factory Member.fromJson(Map<String, dynamic> json) => Member(
    memberId: json["memberId"],
    fullName: json["fullName"],
    gender: json["gender"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    country: Coun.fromJson(json["country"]),
    city: City.fromJson(json["city"]),
    postCode: json["postCode"],
    streetAddressOne: json["streetAddressOne"],
    streetAddressTwo: json["streetAddressTwo"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "memberId": memberId,
    "fullName": fullName,
    "gender": gender,
    "email": email,
    "phoneNumber": phoneNumber,
    "country": country.toJson(),
    "city": city.toJson(),
    "postCode": postCode,
    "streetAddressOne": streetAddressOne,
    "streetAddressTwo": streetAddressTwo,
    "image": image,
  };
}

class City {
  int cityId;
  String cityName;
  Status status;
  Coun counrty;

  City({
    required this.cityId,
    required this.cityName,
    required this.status,
    required this.counrty,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    cityId: json["cityId"],
    cityName: json["cityName"],
    status: statusValues.map[json["status"]]!,
    counrty: Coun.fromJson(json["counrty"]),
  );

  Map<String, dynamic> toJson() => {
    "cityId": cityId,
    "cityName": cityName,
    "status": statusValues.reverse[status],
    "counrty": counrty.toJson(),
  };
}

class Coun {
  int countryId;
  CountryName countryName;
  String countryCode;
  String flagImage;
  Status status;

  Coun({
    required this.countryId,
    required this.countryName,
    required this.countryCode,
    required this.flagImage,
    required this.status,
  });

  factory Coun.fromJson(Map<String, dynamic> json) => Coun(
    countryId: json["countryId"],
    countryName: countryNameValues.map[json["countryName"]]!,
    countryCode: json["countryCode"],
    flagImage: json["flagImage"],
    status: statusValues.map[json["status"]]!,
  );

  Map<String, dynamic> toJson() => {
    "countryId": countryId,
    "countryName": countryNameValues.reverse[countryName],
    "countryCode": countryCode,
    "flagImage": flagImage,
    "status": statusValues.reverse[status],
  };
}

enum CountryName {
  ALBANIA,
  UNITED_ARAB_EMIRATES
}

final countryNameValues = EnumValues({
  "ALBANIA": CountryName.ALBANIA,
  "United Arab Emirates": CountryName.UNITED_ARAB_EMIRATES
});

enum Status {
  ACTIVE,
  INACTIVE
}

final statusValues = EnumValues({
  "Active": Status.ACTIVE,
  "Inactive": Status.INACTIVE
});

class TicketTypes {
  int ticketTypeId;
  String ticketTypeName;
  String description;
  Status status;

  TicketTypes({
    required this.ticketTypeId,
    required this.ticketTypeName,
    required this.description,
    required this.status,
  });

  factory TicketTypes.fromJson(Map<String, dynamic> json) => TicketTypes(
    ticketTypeId: json["ticketTypeId"],
    ticketTypeName: json["ticketTypeName"],
    description: json["description"],
    status: statusValues.map[json["status"]]!,
  );

  Map<String, dynamic> toJson() => {
    "ticketTypeId": ticketTypeId,
    "ticketTypeName": ticketTypeName,
    "description": description,
    "status": statusValues.reverse[status],
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
