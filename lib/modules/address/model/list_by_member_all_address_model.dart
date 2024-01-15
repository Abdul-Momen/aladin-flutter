// To parse this JSON data, do
//
//     final listByMemberAllAddressModel = listByMemberAllAddressModelFromJson(jsonString);

import 'dart:convert';

ListByMemberAllAddressModel listByMemberAllAddressModelFromJson(String str) => ListByMemberAllAddressModel.fromJson(json.decode(str));

String listByMemberAllAddressModelToJson(ListByMemberAllAddressModel data) => json.encode(data.toJson());

class ListByMemberAllAddressModel {
  Data data;
  int code;
  String message;
  bool isSuccess;

  ListByMemberAllAddressModel({
    required this.data,
    required this.code,
    required this.message,
    required this.isSuccess,
  });

  factory ListByMemberAllAddressModel.fromJson(Map<String, dynamic> json) => ListByMemberAllAddressModel(
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
  List<Address> addresses;

  Data({
    required this.addresses,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    addresses: List<Address>.from(json["addresses"].map((x) => Address.fromJson(x))??[]),
  );

  Map<String, dynamic> toJson() => {
    "addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),
  };
}

class Address {
  int addressBookId;
  String fullName;
  String mobileNumber;
  String area;
  String apartmentNo;
  String extraDirection;
  String currentLocation;
  String latitude;
  String longitude;
  int memberId;
  bool isDefault;

  Address({
    required this.addressBookId,
    required this.fullName,
    required this.mobileNumber,
    required this.area,
    required this.apartmentNo,
    required this.extraDirection,
    required this.currentLocation,
    required this.latitude,
    required this.longitude,
    required this.memberId,
    required this.isDefault,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    addressBookId: json["addressBookId"]??0,
    fullName: json["fullName"]??'',
    mobileNumber: json["mobileNumber"]??'',
    area: json["area"]??'',
    apartmentNo: json["apartmentNo"]??'',
    extraDirection: json["extraDirection"]??'',
    currentLocation: json["currentLocation"]??'',
    latitude: json["latitude"]??'',
    longitude: json["longitude"]??'',
    memberId: json["memberId"]??0,
    isDefault: json["isDefault"]??false,
  );

  Map<String, dynamic> toJson() => {
    "addressBookId": addressBookId,
    "fullName": fullName,
    "mobileNumber": mobileNumber,
    "area": area,
    "apartmentNo": apartmentNo,
    "extraDirection": extraDirection,
    "currentLocation": currentLocation,
    "latitude": latitude,
    "longitude": longitude,
    "memberId": memberId,
    "isDefault": isDefault,
  };
}
