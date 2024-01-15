
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../constants/color.dart';
import '../constants/string.dart';
import '../states/data/prefs.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Title ${message.notification!.title}');
  print('Body ${message.notification!.body}');
  print('Payload ${message.data}');
}

class FirebaseAPI {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    //  await _firebaseMessaging.requestPermission();
    print("FCMToken ");

    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    final fcmToken = await _firebaseMessaging.getToken();
    print("FCMToken $fcmToken");
    Preference.setFirebaseToken(fcmToken!);
FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }

    });
    initPushNotifications();
  }

  void handleMessage(RemoteMessage? message) {
    if (message == null) {
      return;
    }
  //  Get.toNamed(NotificationScreen.routeName);
  }

  void handleForegroundMessage(RemoteMessage? message) {
    if (message == null) {
      return;
    }
   /* if (!Preference.getLoggedInFlag() &&
        !Preference.getDistributorLoggedInFlag() &&
        !Preference.getRiderLoggedInFlag()) {
      return;
    }*/
    print("111");
    if (Preference.getLoggedInFlag()) {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.noHeader,
        title: message.notification!.title,

        // title: message.notification!.title,
        titleTextStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontFamily: ConstantStrings.kAppInterFont),
        desc: message.notification!.body,
        descTextStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            fontFamily: ConstantStrings.kAppInterFont),
      //  btnCancelOnPress: () {},
        btnOkOnPress: () {
         // Get.toNamed(NotificationScreen.routeName);
        },
        // btnCancelText: "Cancel",
        // btnCancelColor: Colors.black,
        buttonsTextStyle: const TextStyle(color: Colors.white),
        btnOkText: "Ok",
        buttonsBorderRadius: BorderRadius.circular(5),
        btnOkColor: ConstantColors.darkYellow,
        // reverseBtnOrder: ,
      ).show();
    }/* else if (Preference.getDistributorLoggedInFlag()) {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.noHeader,
        title: 'NXBro',

        // title: message.notification!.title,
        titleTextStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: ConstantStrings.kAppFont),
        desc: message.notification!.body,
        descTextStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            fontFamily: ConstantStrings.kAppFont),
        btnCancelOnPress: () {
          Get.back();
        },
       *//* btnOkOnPress: () {
          Get.toNamed(DistributorNotificationScreen.routeName);
        },*//*
        btnCancelText: "Ok",
        btnCancelColor: Colors.black,
        buttonsTextStyle: const TextStyle(color: Colors.white),
      //  btnOkText: "Open",
        buttonsBorderRadius: BorderRadius.circular(5),
        btnOkColor: ConstantColors.pantone,
        // reverseBtnOrder: ,
      ).show();
    } else if (Preference.getRiderLoggedInFlag()) {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.noHeader,
        title: 'NXBro',

        // title: message.notification!.title,
        titleTextStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontFamily: ConstantStrings.kAppFont),
        desc: message.notification!.body,
        descTextStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            fontFamily: ConstantStrings.kAppFont),
        btnCancelOnPress: () {
          Get.back();
        },
       *//* btnOkOnPress: () {
          Get.toNamed(RiderNotificationScreen.routeName);
        },*//*
        btnCancelText: "Ok",
        btnCancelColor: Colors.black,
        buttonsTextStyle: const TextStyle(color: Colors.white),
      //  btnOkText: "Open",
        buttonsBorderRadius: BorderRadius.circular(5),
        btnOkColor: ConstantColors.darkGreen,
        // reverseBtnOrder: ,
      ).show();
    }*/

  }

  Future initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen(handleForegroundMessage);
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);
  }
}
