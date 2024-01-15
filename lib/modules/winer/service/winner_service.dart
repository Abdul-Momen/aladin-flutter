import 'package:aladin/constants/string.dart';
import 'package:aladin/states/services/base_client.dart';

class WinnerService {


  /// get Winner All
  static Future<dynamic> getWinnerAll() async {
    var rWinnerAll = BaseClient.getData(
        api: ConstantStrings.kWinnerAllList);
    return rWinnerAll;
  }



  static Future<dynamic> testPost({
    required int id,
    required int name,
    required int num,
  }) async {
    Map<String, dynamic> pBody = {
      "addressBookId": id,
      "fullName": name,
      "mobileNumber": num,
    };
    var response = BaseClient.postData(
      api: 'post-data',
      body: pBody,
    );
    return response;
  }

}