import 'dart:convert';
import 'package:aladin/modules/notification/model/get_notification_list_model.dart';
import 'package:aladin/modules/notification/service/notification_service.dart';
import 'package:get/state_manager.dart';

class NotificationController extends GetxController {
  RxBool pNotifications= false.obs;
  NotificationsModel? notificationsModel;

  /// Notifications
  void getNotifications() async {
    pNotifications = true.obs;
    try {
      var rNotifications =
      await NotificationService.getNotificationList();
      notificationsModel =
          notificationListModelFromJson(jsonEncode(rNotifications));
      print("Test Get Notifications Res");
      print("Test Get = $rNotifications");
    } finally {
      pNotifications.value = false;
    }
  }
}