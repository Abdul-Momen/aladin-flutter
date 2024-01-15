// To parse this JSON data, do
//
//     final getNotificationList = getNotificationListFromJson(jsonString);

import 'dart:convert';

NotificationsModel notificationListModelFromJson(String str) => NotificationsModel.fromJson(json.decode(str));

String notificationListModelToJson(NotificationsModel data) => json.encode(data.toJson());

class NotificationsModel {
  Data data;
  int code;
  String message;
  bool isSuccess;

  NotificationsModel({
    required this.data,
    required this.code,
    required this.message,
    required this.isSuccess,
  });

  factory NotificationsModel.fromJson(Map<String, dynamic> json) => NotificationsModel(
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
  List<Notification> notification;

  Data({
    required this.notification,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    notification: List<Notification>.from(json["notification"].map((x) => Notification.fromJson(x))??[]),
  );

  Map<String, dynamic> toJson() => {
    "notification": List<dynamic>.from(notification.map((x) => x.toJson())),
  };
}

class Notification {
  int notificationId;
  int memberId;
  String title;
  String message;
  DateTime receivedAt;
  bool isDelete;

  Notification({
    required this.notificationId,
    required this.memberId,
    required this.title,
    required this.message,
    required this.receivedAt,
    required this.isDelete,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
    notificationId: json["notificationId"]??0,
    memberId: json["memberId"]??0,
    title: json["title"]??'',
    message: json["message"]??'',
    receivedAt: DateTime.parse(json["receivedAt"]??''),
    isDelete: json["isDelete"]??false,
  );

  Map<String, dynamic> toJson() => {
    "notificationId": notificationId,
    "memberId": memberId,
    "title": title,
    "message": message,
    "receivedAt": receivedAt.toIso8601String(),
    "isDelete": isDelete,
  };
}
