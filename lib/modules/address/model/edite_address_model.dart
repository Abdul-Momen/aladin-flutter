// To parse this JSON data, do
//
//     final editeAddressModel = editeAddressModelFromJson(jsonString);

import 'dart:convert';

EditeAddressModel editeAddressModelFromJson(String str) => EditeAddressModel.fromJson(json.decode(str));

String editeAddressModelToJson(EditeAddressModel data) => json.encode(data.toJson());

class EditeAddressModel {
  Data data;
  int code;
  String message;
  bool isSuccess;

  EditeAddressModel({
    required this.data,
    required this.code,
    required this.message,
    required this.isSuccess,
  });

  factory EditeAddressModel.fromJson(Map<String, dynamic> json) => EditeAddressModel(
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
  Address address;

  Data({
    required this.address,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    address: Address.fromJson(json["address"]??{}),
  );

  Map<String, dynamic> toJson() => {
    "address": address.toJson(),
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
