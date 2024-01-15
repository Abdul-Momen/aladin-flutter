import 'package:aladin/constants/string.dart';
import 'package:aladin/states/services/base_client.dart';

class SoldOutService {

  /// get All Sold Out
  static Future<dynamic> getAllSoldOut() async {
    var rAllSoldOut = BaseClient.getData(
        api: ConstantStrings.kAllSoldOut);
    return rAllSoldOut;
  }

}