import 'package:aladin/constants/string.dart';
import 'package:aladin/states/data/prefs.dart';
import 'package:aladin/states/services/base_client.dart';

class NotificationService {
  /// get Notifications
  static Future<dynamic> getNotificationList() async {
    var rNotifications = BaseClient.getData(

        api:'${ ConstantStrings.kNotificationList}?MemberId=${Preference.getMemberId()}');
    return rNotifications;
  }


}