import 'package:aladin/constants/string.dart';
import 'package:aladin/states/services/base_client.dart';

class AllClosingSoonService {

  /// get All Closing Soon
  static Future<dynamic> getAllClosingSoon() async {
    var rAllClosingSoon = BaseClient.getData(
        api: ConstantStrings.kAllClosingSoon);
    return rAllClosingSoon;
  }


}