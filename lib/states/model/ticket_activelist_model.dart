// To parse this JSON data, do
//
//     final ticketActiveListModel = ticketActiveListModelFromJson(jsonString);

import 'dart:convert';

TicketActiveListModel ticketActiveListModelFromJson(String str) => TicketActiveListModel.fromJson(json.decode(str));

String ticketActiveListModelToJson(TicketActiveListModel data) => json.encode(data.toJson());

class TicketActiveListModel {
  Data data;
  int code;
  String message;
  bool isSuccess;

  TicketActiveListModel({
    required this.data,
    required this.code,
    required this.message,
    required this.isSuccess,
  });

  factory TicketActiveListModel.fromJson(Map<String, dynamic> json) => TicketActiveListModel(
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
  List<Ticket> tickets;

  Data({
    required this.tickets,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    tickets: List<Ticket>.from(json["tickets"].map((x) => Ticket.fromJson(x))??[]),
  );

  Map<String, dynamic> toJson() => {
    "tickets": List<dynamic>.from(tickets.map((x) => x.toJson())),
  };
}

class Ticket {
  int aladinTicketId;
  String aladinTicketSerial;
  String ticketType;
  String campaignPrize;
  DateTime purchaseDate;
  DateTime aladinDate;
  dynamic status;

  Ticket({
    required this.aladinTicketId,
    required this.aladinTicketSerial,
    required this.ticketType,
    required this.campaignPrize,
    required this.purchaseDate,
    required this.aladinDate,
    required this.status,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
    aladinTicketId: json["aladinTicketId"]??0,
    aladinTicketSerial: json["aladinTicketSerial"]??'',
    ticketType: json["ticketType"]??"",
    campaignPrize: json["campaignPrize"]??'',
    purchaseDate: DateTime.parse(json["purchaseDate"]??''),
    aladinDate: DateTime.parse(json["aladinDate"]??''),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "aladinTicketId": aladinTicketId,
    "aladinTicketSerial": aladinTicketSerial,
    "ticketType": ticketTypeValues.reverse[ticketType],
    "campaignPrize": campaignPrizeValues.reverse[campaignPrize],
    "purchaseDate": purchaseDate.toIso8601String(),
    "aladinDate": aladinDate.toIso8601String(),
    "status": status,
  };
}

enum CampaignPrize {
  AED_155400,
  GOLD
}

final campaignPrizeValues = EnumValues({
  "AED 155400": CampaignPrize.AED_155400,
  "Gold": CampaignPrize.GOLD
});

enum TicketType {
  ADDITIONAL_TICKET,
  COMPLIMENTARY
}

final ticketTypeValues = EnumValues({
  "Additional Ticket": TicketType.ADDITIONAL_TICKET,
  "Complimentary": TicketType.COMPLIMENTARY
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
